const { DataTypes } = require('sequelize');
const {sequelize} = require('./config/database');

// Model Sprzętu
const Sprzet = sequelize.define('Sprzet', {
    id_sprzetu: {
        type: DataTypes.INTEGER,
        primaryKey: true,  
        autoIncrement: true,  
    },
    nazwa: {
        type: DataTypes.STRING,
        allowNull: false
    },
    ilosc_dostepna: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    cena_dzienna: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    stan: {
        type: DataTypes.STRING,
        allowNull: false
    }
}, {
    timestamps: false, 
    freezeTableName: true 
});

// Model Osoba
const Osoba = sequelize.define('Osoba', {
    id_osoby: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    imie: {
        type: DataTypes.STRING,
        allowNull: false
    },
    email: {
        type: DataTypes.STRING,
        allowNull: false
    },
    telefon: {
        type: DataTypes.STRING,
        allowNull: false
    },
    adres: {
        type: DataTypes.STRING,
        allowNull: false
    },
    czyPracuje: {
        type: DataTypes.BOOLEAN,
        allowNull: false
    },
    haslo: {
        type: DataTypes.STRING,
        allowNull: false
    }
},{
    timestamps: false, 
    freezeTableName: true 
});

// Model Wypozyczenia
const Wypozyczenia = sequelize.define('Wypozyczenia', {
    id_wypozyczenia: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    data_wypozyczenia: {
        type: DataTypes.DATE,
        allowNull: false
    },
    data_zwrotu: {
        type: DataTypes.DATE,
        allowNull: false
    }
}, {
    timestamps: false,
    freezeTableName: true
});

// Model Wypozyczony_sprzet
const Wypozyczony_sprzet = sequelize.define('Wypozyczony_sprzet', {
    Sprzet_id_sprzetu: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        references: {
            model: 'Sprzet',
            key: 'id_sprzetu'
        }
    },
    Wypozyczenia_id_wypozyczenia: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        references: {
            model: 'Wypozyczenia',
            key: 'id_wypozyczenia'
        }
    },
    ilosc: {
        type: DataTypes.INTEGER,
        allowNull: false
    }
}, {
    timestamps: false,
    freezeTableName: true
});

// Model Platnosci
const Platnosci = sequelize.define('Platnosci', {
    id_platnosci: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    Wypozyczenia_id_wypozyczenia: {
        type: DataTypes.INTEGER,
        references: {
            model: 'Wypozyczenia',
            key: 'id_wypozyczenia'
        }
    },
    Klient_id_klienta: {
        type: DataTypes.INTEGER,
        references: {
            model: 'Osoba',
            key: 'id_osoby'
        }
    },
    kwota: {
        type: DataTypes.DECIMAL(10, 2),
        allowNull: false
    }
}, {
    timestamps: false,
    freezeTableName: true
});

// Relacje między modelami

Osoba.hasMany(Wypozyczenia, { foreignKey: 'Klient_id_klienta' });
Wypozyczenia.belongsTo(Osoba, { foreignKey: 'Klient_id_klienta' });

Wypozyczenia.hasMany(Wypozyczony_sprzet, { foreignKey: 'Wypozyczenia_id_wypozyczenia' });
Wypozyczony_sprzet.belongsTo(Wypozyczenia, { foreignKey: 'Wypozyczenia_id_wypozyczenia' });

Sprzet.hasMany(Wypozyczony_sprzet, { foreignKey: 'Sprzet_id_sprzetu' });
Wypozyczony_sprzet.belongsTo(Sprzet, { foreignKey: 'Sprzet_id_sprzetu' });

Wypozyczenia.hasMany(Platnosci, { foreignKey: 'Wypozyczenia_id_wypozyczenia' });
Platnosci.belongsTo(Wypozyczenia, { foreignKey: 'Wypozyczenia_id_wypozyczenia' });

Osoba.hasMany(Platnosci, { foreignKey: 'Klient_id_klienta' });
Platnosci.belongsTo(Osoba, { foreignKey: 'Klient_id_klienta' });

module.exports = { Sprzet, Osoba, Wypozyczenia, Wypozyczony_sprzet, Platnosci };
