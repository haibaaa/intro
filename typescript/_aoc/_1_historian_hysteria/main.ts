import { readFile } from "fs/promises";
const filePath: string = process.argv[2];

async function main() {
    try {
        const data = await readFile(filePath, 'utf8');
        // parse to two arrays
        const lines: string[] = data.split('\n');
        let _1_arr: number[] = [];
        let _2_arr: number[] = [];

        for (const line of lines) {
            if (line === '') {
                continue;
            }
            const parsedLine = line.split('   ');

            _1_arr.push(Number(parsedLine[0]));
            _2_arr.push(Number(parsedLine[1]));
        }

        _1_arr.sort((a, b) => a - b);
        _2_arr.sort((a, b) => a - b);

        let ans = 0;
        for (let i = 0; i < _1_arr.length; i++) {
            ans += Math.abs(_1_arr[i] - _2_arr[i]);
        }
        console.log(ans);
    } catch (err) {
        console.log(err);
    }
}

main();
