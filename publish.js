const ghPages = require('gh-pages');
const { zip } = require('zip-a-folder');

const PACKS = [
    'Death_Swap',
    'SpeedRunner_VS_Hunter',
    'Survival_Games'
];

async function main() {
    for (let pack of PACKS) {
        await zip(pack, '_site/files/' + pack + '.zip');
    }

    ghPages.publish('_site');
}

main();