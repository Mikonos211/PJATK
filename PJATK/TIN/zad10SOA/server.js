const express = require("express");
const fs = require("fs");
const bodyParser = require("body-parser");

const app = express();
const PORT = 3000;

app.use(bodyParser.json()); 
app.use(express.urlencoded({ extended: true })); 

const DATA_FILE = "./data.json";

function readData() {
  return JSON.parse(fs.readFileSync(DATA_FILE, "utf-8"));
}

app.get("/", (req, res) => {
  res.send("O lol działa to Użyj /persons lub /persons/:id i przejdz dalej.");
});

app.get("/persons", (req, res) => {
  const data = readData();
  res.json(data);
});

app.get("/persons/:id", (req, res) => {
    const data = readData();
    const person = data.find((person) => person.id === parseInt(req.params.id));
    if (person) res.json(person);
    else res.status(404).json({ error: "Osoba nie zlaneziona" });
  });

app.post("/persons", (req, res) => {
    const data = readData()
    let newId;
  
    if (data.length > 0) {
      newId = data[data.length - 1].id + 1;
    } else {
      newId = 1;
    }
  
    const newPerson = {
      id: newId,
      imie: req.body.imie, 
      wiek: req.body.wiek,
    };

  data.push(newPerson);
  fs.writeFileSync(DATA_FILE, JSON.stringify(data, null, 2));

  res.send(`Dodano nową osobe: ${newPerson.imie} - ${newPerson.wiek}`);
});

app.listen(PORT, () => {
  console.log(`Serwer działa na http://localhost:${PORT}`);
});
