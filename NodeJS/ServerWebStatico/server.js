const http = require("http");
let fs = require("fs");

function requestHandler(request, response) {
	const path = request.url;

	switch (path) {
		case '/' || '/index.html':
			fs.readFile('index.html', function (error, data) {
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
		case '/index2.html':
			fs.readFile('./index2.html', function (error, data) {
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
		case '/index3.html':
			fs.readFile('./index3.html', function (error, data) {
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