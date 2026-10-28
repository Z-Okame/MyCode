const http = require("http");
const fs = require("fs");
const qs = require("querystring");

const hostname = "127.0.0.1";
const port = 3000;

const nomi = ["Ciro", "Pippo", "Manuel"];
const password = ["12345678", "abcdef", "dpfrz"];


function verificaLogin(nome, pass, res) {
	const indice = nomi.indexOf(nome);
	if (indice !== -1 && password[indice] === pass) {
		res.end("Benvenuto " + nomi[indice]);
	}
	else {
		res.end("Utente non autorizzato");
	}
}

function requestHandler(req, res) {
	
	const oggettoUrl = new URL(req.url, `http://${req.headers.host}`);

	if (oggettoUrl.pathname === "/") {
		fs.readFile("index.html", function (error, data) {
			if (error) {
				res.writeHead(500, { "Content-Type": "text/plain" });
				res.end("errore interno del server");
			} else {
				res.writeHead(200, { "Content-Type": "text/html" });
				res.end(data);
			}
		});
	}
	else if (oggettoUrl.pathname === "/login") {
		if (req.method === "GET") {

			const nome = oggettoUrl.searchParams.get("nome");
			const pass = oggettoUrl.searchParams.get("pass");
			verificaLogin(nome, pass, res);
		}
		else if (req.method === "POST") {
			
			let body = "";
			req.on("data", function (data) {
				body += data;
			});
			req.on("end", function () {
				const post = qs.parse(body);
				verificaLogin(post.nome, post.pass, res);
			});
		}
	}
	else {
		res.writeHead(404, { "Content-Type": "text/plain" });
		res.end("errore: url non trovato");
	}
}

const server = http.createServer(requestHandler);
server.listen(port, hostname, function () {
	console.log(`Server running at http://${hostname}:${port}/`);
});
