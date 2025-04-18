import React, { useState } from 'react';
import ListaLekarzy from './components/ListaLekarzy';
import DodajLekarza from './components/DodajLekarza'; 
import './App.css'; 

const App = () => {
  const [lekarze, setLekarze] = useState([
    { id: 1, name: 'Jan Kowalski', age: 30 },
    { id: 2, name: 'Anna Nowak', age: 25 },
    { id: 3, name: 'Marek Wiśniewski', age: 35 }
  ]);

  const [error, setError] = useState(''); 

  const DodajLekarz = (nowyLekarz) => {
    const counter = nowyLekarz.name.length;
    if (counter <= 3) {
      setError('Minimalnie 3 znaki w polu stringa'); 
    } else {
      setLekarze((prevLekarze) => [...prevLekarze, nowyLekarz]);
      setError(''); 
    }
  };

  const UsunLekarz = (id) => {
    setLekarze((prevLekarze) => prevLekarze.filter((lekarz) => lekarz.id !== id));
  };

  return (
    <div className="Lek">
      <DodajLekarza DodajLekarz={DodajLekarz} lekarze={lekarze} />
      <ListaLekarzy lekarze={lekarze} UsunLekarz={UsunLekarz} />
      {error && <p style={{ color: 'red' }}>{error}</p>}
    </div>
  );
};

export default App;
