import ghPages from 'gh-pages';
const { publish } = ghPages;

import zipAFolder from 'zip-a-folder';
const { zip } = zipAFolder;

const PACKS = [
    'Death_Swap',
    'SpeedRunner_VS_Hunter',
    'Survival_Games'
];

async function main() {
    for (let pack of PACKS) {
        await zip(pack, '_site/files/' + pack + '.zip');
    }

    publish('_site');
}

main();