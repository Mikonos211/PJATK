const http = require('http');
const fs = require('fs');
const url = require('url');
const port = 3000;

function calculate(operation, x, y){
    if(operation == 'dodaj'){
        return x + y;
    } else if(operation == 'odejmij'){
        return x - y;
    } else if(operation == 'pomnoz'){
        return x * y;
    } else if(operation == 'podziel'){
        if ( y == 0 ){
            return 'Bląd: dzielenie przez 0';
        }
        return x / y
    } else {
        return 'Nieznana operacja';
    }
}

const sever = http.createServer(function(req, res){

    const parsedUrl = url.parse(req.url, true);
    const pathname = parsedUrl.pathname; 
    const query = parsedUrl.query;

    const x = parseFloat(query.x);
    const y = parseFloat(query.y);
    
    if (isNaN(x) || isNaN(y)) {
        result = 'Błąd: oba parametry muszą być liczbami';
    } else {
        result = calculate(pathname.substring(1), x, y);
    }

    res.writeHead(200, { 'Content-Type': 'text/html' })
    const responseHtml = `
    <!DOCTYPE html>
    <html lang="pl">
    <head>
        <meta charset="UTF-8">
        <title>Wynik operacji</title>
    </head>
    <body>
        <h1>Wynik: ${result}</h1>
    </body>
    </html>
    `
    res.end(responseHtml);

    })

sever.listen(port, function(error){
    if(error) { 
        console.log("cos poszlo nie tak", error)
    } else {
        console.log('Serwer działa w porcie http://localhost:' + port)
    }
})

