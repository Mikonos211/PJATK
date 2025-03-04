import React, { useState } from 'react';

const DodajLekarza = ({ DodajLekarz, lekarze }) => {
  const [name, setName] = useState('');
  const [age, setAge] = useState('');

  const subbmit = (e) => {
    e.preventDefault();

    if (name && age) {
      let maxId = 0;
      for (let i = 0; i < lekarze.length; i++) {
        if (lekarze[i].id > maxId) {
          maxId = lekarze[i].id;
        }
      }

      const nowyLekarz = {
        id: maxId + 1,
        name: name,
        age: parseInt(age),
      };

      DodajLekarz(nowyLekarz); 
      setName(''); 
      setAge('');
    }
  };

  return (
    <form onSubmit={subbmit}>
      <h3>Dodaj Nowego Lekarza</h3>
      <input
        type="text"
        placeholder="Imię i nazwisko"
        value={name}
        onChange={(e) => setName(e.target.value)}
      />
      <input
        type="number"
        placeholder="Lata doświadczenia"
        value={age}
        onChange={(e) => setAge(e.target.value)}
      />
      <button type="submit">Dodaj</button>
    </form>
  );
};

export default DodajLekarza;
