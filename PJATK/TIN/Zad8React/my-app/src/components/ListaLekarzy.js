import React from 'react';

const ListaLekarzy = ({ lekarze, UsunLekarz }) => {
  return (
    <div>
      <h2>Lista Lekarzy</h2>
      <ul>
        {lekarze.map((lekarz) => (
          <li key={lekarz.id}>
            {lekarz.name}, {lekarz.age} lat doświadczenia
            <button 
              style={{ marginLeft: '10px', color: 'white', background: 'red', border: 'none', padding: '5px' }}
              onClick={() => UsunLekarz(lekarz.id)}
            >
              Usuń
            </button>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default ListaLekarzy;
