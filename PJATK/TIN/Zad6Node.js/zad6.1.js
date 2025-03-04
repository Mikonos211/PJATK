const http = require('http');
const url = require('url');
const port = 3000;

function renderForm(response) {
    response.writeHead(200, { 'Content-Type': 'text/html' });
    response.write(`
        <html>
            <head><title>Simple Form</title></head>
            <body>
                <h2>Enter a value:</h2>
                <form method="GET" action="/result">
                    <input type="text" name="inputValue" required />
                    <button type="submit">Submit</button>
                </form>
            </body>
        </html>
    `);
    response.end();
}

function renderResult(response, query) {
    const inputValue = query.inputValue || "No input provided";
    response.writeHead(200, { 'Content-Type': 'text/html' });
    response.write(`
        <html>
            <head><title>Result</title></head>
            <body>
                <h2>Submitted Value:</h2>
                <p>${inputValue}</p>
                <a href="/">Back to Form</a>
            </body>
        </html>
    `);
    response.end();
}

const server = http.createServer((req, res) => {
    const parsedUrl = url.parse(req.url, true);

    if (parsedUrl.pathname === '/' && req.method === 'GET') {
        renderForm(res);
    } else if (parsedUrl.pathname === '/result' && req.method === 'GET') {
        renderResult(res, parsedUrl.query);
    } else {
        res.writeHead(404, { 'Content-Type': 'text/plain' });
        res.write('404 Not Found');
        res.end();
    }
});

server.listen(port, () => {
    console.log('Server is running at http://localhost:3000');
});
