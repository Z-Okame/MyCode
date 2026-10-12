const http = require("http");
let fs = require("fs");

function requestHandler(request, response) {
    const path = request.url;
    switch (path) {
        case '/':
            fs.readFile('Home.html', function (error, data) {
                if (error) {
                    response.writeHead(500, { "Content-Type": "text/plain" });
                    response.write("Errore interno del server");
                } else {
                    response.writeHead(200, { "Content-Type": "text/html" });
                    response.write(data, "utf8");
                }
                response.end();
            });
            break;

        case '/Foto1':
            fs.readFile('index2.html', function (error, data) {
                if (error) {
                    response.writeHead(500, { "Content-Type": "text/plain" });
                    response.write("Errore interno del server");
                } else {
                    response.writeHead(200, { "Content-Type": "text/html" });
                    response.write(data, "utf8");
                }
                response.end();
            });
            break;

        case '/Foto2':
            fs.readFile('index3.html', function (error, data) {
                if (error) {
                    response.writeHead(500, { "Content-Type": "text/plain" });
                    response.write("Errore interno del server");
                } else {
                    response.writeHead(200, { "Content-Type": "text/html" });  // era image/jpeg
                    response.write(data, "utf8");
                }
                response.end();
            });
            break;

        case '/immagini/pic_trulli.jpg':
        fs.readFile('./immagini/pic_trulli.jpg', function (error, data) {
            if (error) {
                response.writeHead(404, { "Content-Type": "text/plain" });
                response.write("File non trovato");
            } else {
                response.writeHead(200, { "Content-Type": "image/jpeg" });
                response.write(data);
            }
            response.end();
        });
        break;

        case '/immagini/img_chania.jpg':
        fs.readFile('./immagini/img_chania.jpg', function (error, data) {
            if (error) {
                response.writeHead(404, { "Content-Type": "text/plain" });
                response.write("File non trovato");
            } else {
                response.writeHead(200, { "Content-Type": "image/jpeg" });
                response.write(data);
            }
            response.end();
        });
        break;
        case '/stile':
            fs.readFile("./css/stile.css", function (error, data) {
                if (error) {
                    response.writeHead(404);
                } else {
                    response.writeHead(200, { "Content-Type": "text/css" });
                    response.write(data, "utf8");
                }
                response.end();
            });
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