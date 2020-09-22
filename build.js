import YAML from "yaml";
import fs from "fs";
import glob from "glob";
import path from "path";

glob("**/functions/*.add.mcfunction", function (err, files) {
    const replacementRegExp = /\{\%(\w+)\%\}/;

    for (let file of files) {
        let content = fs.readFileSync(file).toString();

        let match;
        while (match = replacementRegExp.exec(content)) {
            content = content.replace(match[0], convert(path.dirname(path.dirname(file)) + "/books/" + match[1] + ".mdf"));
        }

        fs.writeFileSync(file.replace(".add", ""), content);
    }
});

function convert(file) {
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

        let status = {
            bold: false,
            italic: false,
            underline: false,
            strikethrough: false,
            obfuscated: false,
            color: 'reset'
        };

        let text = "";
        let prevChar = "";
        const lookoutFor = ['*', '_', '-', '#', '%', '[', '$'];
        for (let j = 0; j < line.length; j++) {
            const char = line[j];
            if (prevChar !== "\\" && lookoutFor.includes(char)) {
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
                    if (line[j+1] == "(" && status.color == 'reset') {
                        let skip = 2;
                        status.color = "#";
                        while (line[j+skip] !== ")") {
                            status.color += line[j+skip];
                            skip++;
                        }
                        j += skip;
                    } else {
                        status.color = "reset";
                    }
                } else if (char == "[") {
                    let skip = 1;
                    while (line[j+skip] !== "]") {
                        text += line[j+skip];
                        skip++;
                    }
                    skip++;

                    // '(' means click action
                    let click = "";
                    if (line[j+skip] == "(") {
                        skip++;
                        while (line[j+skip] !== ")") {
                            click += line[j+skip];
                            skip++;
                        }
                        skip++;
                    }
                    
                    // '{' means hover
                    let hover = "";
                    if (line[j+skip] == "{") {
                        skip++;
                        while (line[j+skip] !== "}") {
                            hover += line[j+skip];
                            skip++;
                        }
                        skip++;
                    }

                    let out = {text, ...status};

                    if (click) {
                        const urlRegEx = new RegExp('https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)');
                        let action = "";

                        if (!isNaN(parseInt(click))) {
                            action = "change_page";
                            click = parseInt(click);
                        } else if (urlRegEx.test(click)) {
                            action = "open_url";
                        } else  {
                            action = "run_command";
                        }

                        out["clickEvent"] = {"action":action,"value":click};
                    }

                    if (hover) out["hoverEvent"] = {"action":"show_text","contents":hover};

                    page.push(out);
                    text = "";
                    j += skip;
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
                prevChar = char;
            }
        }

        line = lines[++i];
        if (text) page.push({text, 'color': 'reset'});
        page.push({"text": '\n', 'color': 'reset'});
    }

    output['pages'].push(JSON.stringify(page));

    return JSON.stringify(output)
}