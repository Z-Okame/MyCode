const fs = require("fs");
const http = require ("http");
const url = require("url");


function requestHandler(request, response) {
    let oggettourl = url.parse(request.url,true);
    const path = oggettourl.pathname;
    switch (path) {
        case '/':
            fs.readFile('index.html',function(error,data) {
                if (error) {
                    response.writeHead(404);
                } else {
                    response.writeHead(200,{"Content-Type":"text/html"});
                    response.write(data,"utf8");
                }
                response.end()
            });
        break;
        case '/recuperadati':
            const cognome = oggettourl.query.nome;
            const nome = oggettourl.query.cognome;
            const matricola = oggettourl.query.matricola;
            const regioneresidenza = oggettourl.query.regione;
            const email = oggettourl.query.email;
            const telefono = oggettourl.query.telefono;
            const richieste = oggettourl.query.richieste;
            console.log(nome);
            console.log(cognome);
            console.log(matricola);
            console.log(regioneresidenza);
            console.log(email);
            console.log(telefono);
            console.log(richieste);
            response.writeHead(200,{"Content-Type":"text/html"});
            response.end("<h1>Richiesta ricevuta</h1>");
        break;
        
    }
}

const server = http.createServer(requestHandler);
server.listen(3000, function() {
    console.log("Server in ascolto sulla porta 3000");
});