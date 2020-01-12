"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const path = require("path");
const workerpool = require("workerpool");
class UtensilsParser {
    constructor(extension) {
        this.extension = extension;
        this.pool = workerpool.pool(path.join(__dirname, 'syntax_worker.js'), { minWorkers: 1, maxWorkers: 1, workerType: 'process' });
    }
    async parseLatex(s, options) {
        try {
            return await this.pool.exec('parseLatex', [s, options]).timeout(3000);
        }
        catch (e) {
            return undefined;
        }
    }
    async parseLatexPreamble(s) {
        return await this.pool.exec('parseLatexPreamble', [s]).timeout(500);
    }
    async parseBibtex(s, options) {
        return await this.pool.exec('parseBibtex', [s, options]).timeout(30000);
    }
}
exports.UtensilsParser = UtensilsParser;
//# sourceMappingURL=syntax.js.map