const fs = require("fs");
const http = require("http");
const url = require("url");

const hostname = '127.0.0.1';
const port = 3000;

// Funzione dedicata esclusivamente alla validazione dei dati
function valida(query) {
    const regex = /^[a-zA-Z\s]+$/;
    const nome = query.nome || "";
    const cognome = query.cognome || "";

    const isNomeValido = nome !== "" && regex.test(nome);
    const isCognomeValido = cognome !== "" && regex.test(cognome);

    return {
        // 'invia' diventa true se c'è almeno un errore nel form
        invia: !isNomeValido || !isCognomeValido,
        isNomeValido,
        isCognomeValido,
        nome,
        cognome
    };
}

// Funzione dedicata esclusivamente alla generazione dinamica dell'HTML
function generaHtml(esito) {
    let messaggio = `
	<html>
	<head>
		<title>Login Utente</title>
	</head>
	<body>
		<form action="recuperadati" method="GET">
		`;
    // Generazione del campo Nome
    if (!esito.isNomeValido) {
			messaggio += `
			<label for="user" style="color:red;">Nome:</label><br>
			<input type="text" id="user" name="nome" value="" size="30" style="border: 1px solid red;">&nbspInserisci un nome valido<br><br>`;
    } else {
			messaggio += `
			<label for="user">Nome:</label><br>
			<input type="text" id="user" name="nome" value="${esito.nome}" size="30"><br><br>`;
    }
    // Generazione del campo Cognome
    if (!esito.isCognomeValido) {
			messaggio += `
			<label for="cognome" style="color:red;">Cognome:</label><br>
			<input type="text" id="cognome" name="cognome" value="" size="30" style="border: 1px solid red;">&nbspInserisci un cognome valido<br><br>`;
    } else {
        messaggio += `
		<label for="cognome">Cognome:</label><br>
		<input type="text" id="cognome" name="cognome" value="${esito.cognome}" size="30"><br><br>`;
    }
		messaggio += `
		<input type="submit" value="Invia"></form>
		</body>
		</html>`;
    return messaggio;
}

function requestHandler(request, response) {
    let oggettourl = url.parse(request.url, true);
    console.log(oggettourl.href);
    const path = oggettourl.pathname;
    console.log(path);

    switch (path) {
        case '/':
            fs.readFile('index.html', function(error, data) {
                if (error) {
                    response.writeHead(404);
                } else {
                    response.writeHead(200, { "Content-Type": "text/html" });
                    response.write(data, "utf8");
                }
                response.end();
            });
            break;

        case '/recuperadati':
            // 1. Esegue la validazione dei dati inviati via query string
			//Se oggettourl.query è undefined o null, l'operatore restituisce 
			//l'oggetto vuoto {}. Questo evita che la funzione valida() vada 
			//in errore quando prova ad accedere alle proprietà .nome o .cognome.
            const esitoValidazione = valida(oggettourl.query || {});

            // 2. Se la validazione fallisce, genera l'HTML dinamicamente
            if (esitoValidazione.invia) {
                const paginaHtml = generaHtml(esitoValidazione);
                response.writeHead(200, { 'Content-Type': 'text/html' });
                response.write(paginaHtml);
                response.end();
            } else {
                // 3. Se la validazione ha successo
                response.writeHead(200, { 'Content-Type': 'text/plain' });
                response.write('Form compilato in modo corretto');
                response.end();
            }
            break;
    }
}

const server = http.createServer(requestHandler);
server.listen(port, hostname, function () {
    console.log(`Server running at http://${hostname}:${port}/`);
});



