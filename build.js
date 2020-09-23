import YAML from "yaml";
import fs from "fs";
import glob from "glob";
import path from "path";

glob("**/functions/*.add.mcfunction", function (err, files) {
    const replacementRegExp = /\{\%(\w+)\%\}/;

    for (let file of files) {
        let fileContent = fs.readFileSync(file).toString();
        let lines = fileContent.split("\n");

        for (let i = 0; i < lines.length; i++) {
            let line = lines[i];

            let match;
            if (match = replacementRegExp.exec(line)) {
                const content = path.dirname(path.dirname(file)) + "/content/" + match[1] + ".mdf";

                if (line.startsWith('give')) {
                    line = line.replace(match[0], convertForBook(content));
                } else if (line.startsWith('tellraw')) {
                    line = convertForTellraw(content, line.slice(0, match.index));
                }
            }

            lines[i] = line;
        }

        fs.writeFileSync(file.replace(".add", ""), lines.join("\n"));
    }
});

function convertForBook(file) {
    let output = {pages:[]};

    const content = fs.readFileSync(file).toString();
    const lines = content.split("\n");

    let line = lines[0];
    let i = 0;

    if (line === '---') {
        line = lines[++i];

        let header = [];

        while (line && line !== '---') {
            header.push(line);
            line = lines[++i];
        }

        header = YAML.parse(header.join("\n"));

        output['title'] = header['title'] || "Book";
        output['author'] = header['author'] || "A Function";
        output['generation'] = header['type'] || 0;
        output['display'] = {
            'Lore': header['description'] || ""
        };
        line = lines[++i];
    }

    let page = [];
    while (line !== undefined) {
        if (line === "===") {
            output['pages'].push(JSON.stringify(page))
            page = [];
            line = lines[++i];
        }

        page = convertLine(line, page, "reset");

        line = lines[++i];
        page.push({"text": '\n', 'color': 'reset'});
    }

    output['pages'].push(JSON.stringify(page));

    return JSON.stringify(output)
}

function convertForTellraw(file, start) {
    return fs.readFileSync(file).toString()
        .split("\n")
        .map((line) => convertLine(line, [], "white"))
        .map((el) => start + JSON.stringify(el))
        .join("\n");
}

function convertLine(line, page, defaultColor) {
    let status = {
        bold: false,
        italic: false,
        underline: false,
        strikethrough: false,
        obfuscated: false,
        color: defaultColor
    };

    let text = "";
    const lookoutFor = ['*', '_', '-', '#', '%', '[', '$'];
    for (let j = 0; j < line.length; j++) {
        const char = line[j];
        if (char === "\\") {
            text += line[++j];
        } else if (lookoutFor.includes(char)) {
            if (text) {
                page.push({text, ...status});
                text = "";
            }

            if (char == "*" && line[j+1] == "*") {
                status.bold = !status.bold;
                j++;
            } else if (char == "*") {
                status.italic = !status.italic;
            } else if (char == "_") {
                status.underline = !status.underline;
            } else if (char == "-") {
                status.strikethrough = !status.strikethrough;
            } else if (char == "#") {
                status.obfuscated = !status.obfuscated;
            } else if (char == "%") {
                if (line[j+1] == "(" && status.color == defaultColor) {
                    let skip = 2;
                    status.color = line[j+skip] === line[j+skip].toUpperCase() ? "#" : "";
                    while (line[j+skip] !== ")") {
                        status.color += line[j+skip];
                        skip++;
                    }
                    j += skip;
                } else {
                    status.color = defaultColor;
                }
            } else if (char == "[") {
                [text, j] = absorbTextUntil(line, j+1, "]");
                j++;

                // '(' means click action
                let click = "";
                if (line[j] == "(") {
                    [click, j] = absorbTextUntil(line, j+1, ")");
                    if (click === "") click = text;
                    j++;
                }
                
                // '{' means hover
                let hover = "";
                if (line[j] == "{") {
                    [hover, j] = absorbTextUntil(line, j+1, "}");
                    j++;
                }

                let out = {text, ...status};

                if (click) {
                    let action = "";

                    if (!isNaN(parseInt(click))) {
                        action = "change_page";
                        click = parseInt(click);
                    } else if (click.startsWith("/")) {
                        action = "run_command";
                    } else  {
                        action = "open_url";
                    }

                    out["clickEvent"] = {"action":action,"value":click};
                }

                if (hover) out["hoverEvent"] = {"action":"show_text","contents":hover};
                page.push(out);
                text = "";
            } else if (char == "$" && line[j+1] == "{") {
                let skip = 2;
                let player = "";
                let objective = "";
                while (line[j+skip] !== "}") {
                    player += line[j+skip];
                    skip++;
                }

                if (player.includes(".")) {
                    [player, objective] = player.split(".");
                }
                
                if (objective) {
                    page.push({"score": {"name": player, "objective": objective}, ...status});
                } else {
                    page.push({"selector":"@p", ...status});
                }
                j += skip;
            }
        } else {
            text += char;
        }
    }

    if (text) page.push({text, 'color': defaultColor});

    return page;
}

function absorbTextUntil(line, start, until) {
    let skip = 0;
    let text = "";
    let char;

    while ((char = line[start+skip]) !== until) {
        if (char === "\\") {
            text += line[start+(++skip)];
        } else {
            text += char;
        }
        skip++;
    }
    return [text, start+skip];
}