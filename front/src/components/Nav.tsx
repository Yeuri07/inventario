interface Client {
  id_cliente: number;
  nombre: string;
  email: string;
  telefono: string;
}

import { useEffect, useState } from 'react';

function App() {
  const [clients, setClients] = useState<Client[]>([]);
  const [client, setClient] = useState<Client | null>(null);
  const [id, setId] = useState<string>('');

  // Fetch all clients
  useEffect(() => {
    fetch('http://localhost:8000/clientes')
      .then(response => response.json())
      .then(data => setClients(data))
      .catch(error => console.error('Error fetching clients:', error));
  }, []);

  // Fetch client by id
  const fetchClient = () => {
    fetch(`http://localhost:8000/clientes/${id}`)
      .then(response => response.json())
      .then(data => setClient(data))
      .catch(error => console.error('Error fetching client:', error));
  };

  return (
    <div className="App">
      <h1>Clientes</h1>
      <ul>
        {clients.map(client => (
          <li key={client.id_cliente}>
            {client.nombre} - {client.email} - {client.telefono}
          </li>
        ))}
      </ul>

      <h1>Buscar Cliente por ID</h1>
      <input
        type="text"
        value={id}
        onChange={(e) => setId(e.target.value)}
        placeholder="Ingrese el ID del cliente"
      />
      <button onClick={fetchClient}>Buscar</button>
        
      {client && (
        <div>
          <h2>Información del Cliente</h2>
          <p>Nombre: {client.nombre}</p>
          <p>Email: {client.email}</p>
          <p>Teléfono: {client.telefono}</p>
        </div>
      )}
    </div>
  );
}

export default App;
