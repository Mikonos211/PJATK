const http = require('http');
const url = require('url');
const fs = require('fs');
const port = 3000;

function renderForm(response) {
    response.writeHead(200, { 'Content-Type': 'text/html' });
    response.write(`
        <html>
            <head><title>Simple Form</title></head>
            <body>
                <h2>Enter a value:</h2>
                <form method="GET" action="/save">
                    <input type="text" name="inputValue" required />
                    <button type="submit">Submit</button>
                </form>
            </body>
        </html>
    `);
    response.end();
}

function saveToFile(response, query) {
    const inputValue = query.inputValue || "No input provided";

    fs.writeFile('data.txt', inputValue, (err) => {
        if (err) {
            response.writeHead(500, { 'Content-Type': 'text/plain' });
            response.write('Error writing to file');
            response.end();
            return;
        }

        response.writeHead(302, { 'Location': '/' });
        response.end();
    });
}

const server = http.createServer((req, res) => {
    const parsedUrl = url.parse(req.url, true);

    if (parsedUrl.pathname === '/' && req.method === 'GET') {
        renderForm(res);
    } else if (parsedUrl.pathname === '/save' && req.method === 'GET') {
        saveToFile(res, parsedUrl.query);
    } else {
        res.writeHead(404, { 'Content-Type': 'text/plain' });
        res.write('404 Not Found');
        res.end();
    }
});

server.listen(port, () => {
    console.log('Server is running at http://localhost:3000');
});
