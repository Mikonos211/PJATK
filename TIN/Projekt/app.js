const express = require('express');
const bodyParser = require('body-parser');
const session = require('express-session'); 
const { Sequelize, DataTypes } = require('sequelize');
const path = require('path');
const { timeStamp, error } = require('console');
const { Sprzet, Osoba, Wypozyczenia, Wypozyczony_sprzet, Platnosci } = require('./models');
const res = require('express/lib/response');

const app = express();

app.use(session({
    secret: 'twój sekretny klucz', 
    resave: false,
    saveUninitialized: true
}));

app.use(express.static(path.join(__dirname, 'public')));

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));
app.use(bodyParser.urlencoded({ extended: false }));


//Menu
app.get('/', (req, res) => {
    const isLoggedIn = req.session.user ? true : false; 
    res.render('menu', { isLoggedIn });
});


//Oferta
app.get('/oferta', async (req, res) => {
    const sprzet = await Sprzet.findAll();
    const isLoggedIn = req.session.user ? true : false; 
    const user = req.session.user; 

    res.render('oferta', { sprzet, isLoggedIn, user }); 
});

app.get('/Wglad', async (req, res) => {
    if (!req.session.user) {
        return res.redirect('/login');
    }

    try {
        const osoby = await Osoba.findAll(); 
        const platnosci = await Platnosci.findAll(); 
        const wypozyczenia = await Wypozyczenia.findAll({
            attributes: ['id_wypozyczenia', 'data_wypozyczenia', 'data_zwrotu']
        });
        const wypozyczonySprzet = await Wypozyczony_sprzet.findAll(); 

        const sprzetZHistoria = await Wypozyczenia.findAll({
            include: [
                {
                    model: Wypozyczony_sprzet,
                    include: [
                        {
                            model: Sprzet,
                            attributes: ['id_sprzetu', 'nazwa', 'ilosc_dostepna', 'cena_dzienna', 'stan']
                        }
                    ],
                    attributes: ['Sprzet_id_sprzetu', 'Wypozyczenia_id_wypozyczenia', 'ilosc']
                }
            ],
            attributes: ['id_wypozyczenia', 'data_wypozyczenia', 'data_zwrotu']
        });

        
        res.render('Wglad', { osoby, platnosci, wypozyczenia, wypozyczonySprzet, sprzetZHistoria  });
    } catch (error) {
        console.error("Błąd podczas pobierania danych:", error);
        res.status(500).send("Wystąpił błąd podczas pobierania danych.");
    }
});


//Logowanie
app.get('/login', async (req, res) => {
    res.render('login');
});

app.post('/login', async (req, res) => {
    console.log(req.body); 

    const { email, password } = req.body;

    try {
        const user = await Osoba.findOne({ where: { email: email, haslo: password } });

        if (user) {
            req.session.user = user;
            return res.redirect('/');
        } else {
            res.send("Błędne dane logowania");
        }
    } catch (error) {
        console.error("Błąd podczas logowania:", error);
        res.send("Wystąpił błąd podczas logowania.");
    }
});


app.get('/account', async (req, res) => {
    if (req.session.user) {
        const userId = req.session.user.id_osoby; 

        try {
            const wypozyczenia = await Platnosci.findAll({
                include: [
                    {
                        model: Wypozyczenia,
                        include: [
                            {
                                model: Wypozyczony_sprzet,
                                include: [
                                    {
                                        model: Sprzet,
                                        attributes: ['nazwa']
                                    }
                                ]
                            }
                        ],
                        attributes: ['data_wypozyczenia', 'data_zwrotu'], 
                    },
                    {
                        model: Osoba, 
                        attributes: ['imie']
                    }
                ],
                where: { Klient_id_klienta: userId }, 

                attributes: ['kwota'],
            });
                        res.render('account', { user: req.session.user, wypozyczenia });
        } catch (error) {
            console.error("Błąd podczas pobierania danych konta:", error);
            res.status(500).send("Wystąpił błąd podczas pobierania danych konta.");
        }
    } else {
        res.redirect('/login');
    }
});

app.post('/delete/:id_sprzetu', async (req, res) => {
    const { id_sprzetu } = req.params;

    try {
        await Sprzet.destroy({ where: { id_sprzetu } });
        console.log("Sprzęt został usunięty");
        res.redirect('/oferta');
    } catch (error) {
        console.error("Błąd podczas usuwania sprzętu:", error);
        res.status(500).send("Wystąpił błąd podczas usuwania sprzętu.");
    }
});



app.get('/logout', (req, res) => {
    req.session.destroy((err) => {
        if (err) {
            return res.send("Błąd podczas wylogowywania");
        }
        res.redirect('/'); 
    });
});

//Rejestracja
app.get('/register', async(req, res) =>{
    res.render('register');
});

app.post('/register', async (req, res) => {
    const { imie, email, telefon, adres, haslo } = req.body;

    if (!imie || !email || !telefon || !adres || !haslo) {
        return res.send("Wszystkie pola są wymagane.");
    }

    try {
        const maxId = await Osoba.max('id_osoby');
        const newId = maxId ? maxId + 1 : 1; 
        const czyPracuje = 0; 

        await Osoba.create({
            id_osoby: newId,
            imie,
            email,
            telefon,
            adres,
            czyPracuje,
            haslo
        });

        res.redirect('/login');
    } catch (error) {
        console.error("Błąd podczas dodawania osoby:", error);
        res.send("Wystąpił błąd podczas dodawania osoby.");
    }
});


app.get('/details/:id_sprzetu', async (req, res) => {
    const { id_sprzetu } = req.params;
    const sprzet = await Sprzet.findByPk(id_sprzetu);

    const isLoggedIn = req.session.user ? true : false; 
    const user = req.session.user; 

    if (!sprzet) {
        console.log('Nie znaleziono sprzętu o id:', id_sprzetu);
        res.status(404).send('Produkt nie znaleziony');
    } else {
        res.render('details', { sprzet, isLoggedIn, user });
    }
});

//Dodawanie do bazy danych
app.get('/Dodaj', async (req, res) =>{
    res.render('Dodaj')
});

app.post('/Dodaj', async (req, res) => {
    const { nazwa, ilosc_dostepna, cena_dzienna, stan } = req.body;

    if (
        !nazwa || nazwa.length <= 0 || 
        !ilosc_dostepna || ilosc_dostepna <= 0 || 
        !cena_dzienna || cena_dzienna <= 0 || 
        !(stan === "Nowy" || stan === "Używany")
    ) {        
        console.log("Złe dane");
        res.send("Wszystkie pola są wymagane i muszą mieć odpowiednie wartości. A stan może być tylko Nowy lub Używany");
    } else {
        try {
            const maxId = await Sprzet.max('id_sprzetu');  

            const newId = maxId ? maxId + 1 : 1;  

            await Sprzet.create({
                id_sprzetu: newId, 
                nazwa,
                ilosc_dostepna,
                cena_dzienna,
                stan
            });

            console.log("Produkt pomyślnie dodany");
            res.redirect('/oferta');
        } catch (error) {
            console.error("Błąd podczas dodawania produktu:", error);
            res.send("Wystąpił błąd podczas dodawania produktu.");
        }
    }
});

//Updateowanie
app.post('/update/:id_sprzetu', async (req, res) => {
    const { id_sprzetu } = req.params;
    const { nazwa, ilosc_dostepna, cena_dzienna, stan } = req.body;


    try {
        const sprzet = await Sprzet.findByPk(id_sprzetu);

        if (sprzet) {
            sprzet.nazwa = nazwa;
            sprzet.ilosc_dostepna = ilosc_dostepna;
            sprzet.cena_dzienna = cena_dzienna;
            sprzet.stan = stan;

            await sprzet.save();
            console.log("Produkt zaktualizowany");
            res.redirect('/oferta'); 
        } else {
            console.log("Produkt nie znaleziony");
            res.status(404).send("Produkt nie znaleziony");
        }
    } catch (error) {
        console.error("Błąd podczas aktualizacji produktu:", error);
        res.status(500).send("Błąd serwera");
    }
});


app.post('/reserve/:id_sprzetu', async (req, res) => {
    const { id_sprzetu } = req.params; 
    const { days } = req.body; 

    if (req.session.user) {
        const userId = req.session.user.id_osoby;

    try {
        const maxId = await Wypozyczenia.max('id_wypozyczenia');  
        const newId = maxId ? maxId + 1 : 1;  

        const today = new Date(); 
        const returnDate = new Date(); 
        returnDate.setDate(today.getDate() + parseInt(days));

        await Wypozyczenia.create({
            id_wypozyczenia: newId, 
            data_wypozyczenia: today,
            data_zwrotu: returnDate 
        });

        await Wypozyczony_sprzet.create({
            Sprzet_id_sprzetu: id_sprzetu,
            Wypozyczenia_id_wypozyczenia: newId,
            ilosc: 2
        });

        const maxIdPlatnosci = await Platnosci.max('id_platnosci');  
        const newIdPlatnosci = maxIdPlatnosci ? maxIdPlatnosci + 1 : 1;  

        const sprzet = await Sprzet.findOne({ where: { id_sprzetu } });
        const zaplata = sprzet.cena_dzienna; 

        await Platnosci.create({
            id_platnosci: newIdPlatnosci,
            Wypozyczenia_id_wypozyczenia: newId,
            Klient_id_klienta: userId,
            kwota: zaplata * days
        });

        sprzet.ilosc_dostepna -= 1;
        await sprzet.save();
        console.log("Dokonano rezerwacji");
        res.redirect('/oferta');
    } catch (error) {
        console.error("Błąd podczas dodawania produktu:", error);
        res.send("Wystąpił błąd podczas dodawania produktu.");
    }
}
else{
    res.send("Jesteś niezalogowany.");
}
});


app.listen(3000, () => {
    console.log('Serwer działa na porcie 3000');
});
