const fs = require("fs");

const readable = fs.createReadStream("input.txt");
const writable = fs.createWriteStream("output.txt");

readable.pipe(writable);

writable.on("finish", () => {
    console.log("Copia completata: input.txt -> output.txt");
});

readable.on("error", err => console.error("Errore lettura:", err));
writable.on("error", err => console.error("Errore scrittura:", err));