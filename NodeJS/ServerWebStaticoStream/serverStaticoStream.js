const http = require("http");
const fs = require("fs");

function inviaFile(response, percorso, contentType, codiceErrore) {
    const readable = fs.createReadStream(percorso);

    readable.on("open", () => {
        response.writeHead(200, { "Content-Type": contentType });
    });

    readable.on("data", chunk => {
        console.log("Ricevuto chunk:", chunk.length, "da", percorso);
        response.write(chunk);
    });

    readable.on("end", () => {
        console.log("Fine lettura file:", percorso);
        response.end();
    });

    readable.on("error", err => {
        console.error("Errore:", err);
        if (!response.headersSent) {
            response.writeHead(codiceErrore, { "Content-Type": "text/plain" });
            response.write(codiceErrore === 500 ? "Errore interno del server" : "File non trovato");
        }
        response.end();
    });
}

function requestHandler(request, response) {
    const path = request.url;
    switch (path) {
        case '/':
            inviaFile(response, 'Home.html', 'text/html', 500);
            break;

        case '/Foto1':
            inviaFile(response, 'index2.html', 'text/html', 500);
            break;

        case '/Foto2':
            inviaFile(response, 'index3.html', 'text/html', 500);
            break;

        case '/immagini/pic_trulli.jpg':
            inviaFile(response, './immagini/pic_trulli.jpg', 'image/jpeg', 404);
            break;

        case '/immagini/img_chania.jpg':
            inviaFile(response, './immagini/img_chania.jpg', 'image/jpeg', 404);
            break;

        case '/stile':
            inviaFile(response, './css/stile.css', 'text/css', 404);
            break;

        default:
            response.writeHead(404, { "Content-Type": "text/plain" });
            response.write("404 Not Found");
            response.end();
    }
}

const server = http.createServer(requestHandler);

server.listen(3000, () => {
    console.log("Server in ascolto sulla porta 3000");
});