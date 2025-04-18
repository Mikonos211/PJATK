const express = require('express');
const bodyParser = require('body-parser');
const { Sequelize, DataTypes } = require('sequelize');
const path = require('path');
const { timeStamp, error } = require('console');

const app = express();
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));
app.use(bodyParser.urlencoded({ extended: false }));

const sequelize = new Sequelize('', '', '', {
    host: 'localhost',
    dialect: 'mysql',
    logging: false
});

const Lekarz = sequelize.define('Lekarz', {
    imie: {
        type : DataTypes.STRING,
        allowNull: false
    },
    lataDoswiadczenia: {
        type : DataTypes.INTEGER,
        allowNull: false
    }
}, {
    timestamps: false,
    freezeTableName: true
});

sequelize.sync().then(() => {
    console.log('Synchronizacja przebiegła pomyślnie');
}).catch((error) => {
    console.error('Wywaliło jakiś błąd', err);
});

app.get('/', (req, res) => {
    res.render('menu')
})

app.get('/list', async(req, res) => {
    const lekarze = await Lekarz.findAll();
    //console.log('Pobrane dane:', lekarze);
    res.render('list', {lekarze})
})

app.get('/add', (req, res) => {
    res.render('add');
});

app.post('/add', async (req, res) => {
    const {imie, lataDoswiadczenia } = req.body;
    await Lekarz.create({imie, lataDoswiadczenia});
    res.redirect('/');
});

app.get('/details', (req, res) => {
    const id = req.query.id;
    if (id) {
        res.redirect(`/details/${id}`);
    } else {
        res.status(400).send('Nie podano ID lekarza');
    }
});

app.get('/details/:id', async (req, res) => {
    try {
        const lekarz = await Lekarz.findByPk(req.params.id);
        if (lekarz) {
            res.render('details', { lekarz });
        } else {
            res.status(404).send('Nie znaleziono lekarza');
        }
    } catch (error) {
        console.error('Błąd podczas pobierania szczegółów lekarza:', error);
        res.status(500).send('Błąd podczas pobierania szczegółów lekarza');
    }
});

app.listen(3000, () => {
    console.log('Serwer działa na porcie 3000');
});