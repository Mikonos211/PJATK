const { Sequelize } = require('sequelize');

// Tworzymy połączenie z bazą danych MySQL
const sequelize = new Sequelize('', '', '', {
    host: 'localhost',
    dialect: 'mysql',
    logging: false
});


sequelize.sync().then(() => {
    console.log('Synchronizacja przebiegła pomyślnie');
}).catch((error) => {
    console.error('Wywaliło jakiś błąd', err);
});



module.exports = { sequelize };
