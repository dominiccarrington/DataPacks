import ghPages from 'gh-pages';
import zipAFolder from 'zip-a-folder';
import fs from "fs";
import glob from "glob";
import copyfiles from 'copyfiles';

const { publish } = ghPages;
const { zip } = zipAFolder;

const PACKS = fs.readdirSync(".").filter((val) => fs.statSync(val).isDirectory() && !(val.startsWith("_") || val.startsWith(".") || val == "node_modules"));

async function main() {
    for (let pack of PACKS) {
        const copyFiles = await new Promise((res, rej) => {
            glob(pack + "/**/!(*.add.mcfunction)", (err, files) => {
                if (err) rej(err);

                res(files.filter((f) => fs.statSync(f).isFile()));
            });
        });

        await new Promise((res) => {
            copyfiles([...copyFiles, "_out/" + pack], res)
        });

        await zip("_out/" + pack, '_site/files/' + pack + '.zip');
    }

    publish('_site');
}

main();