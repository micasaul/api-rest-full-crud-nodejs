require('dotenv').config();
const {Pool} = require('pg')

const pool = new Pool({
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    database: process.env.DB_NAME,
    password: process.env.DB_PASSWORD,
    port: Number(process.env.DB_PORT)
})

const express = require('express');
const app = express();
const PORT = process.env.PORT;

app.use(express.json());

// GET /users
app.get('/users', async (req, res) => {    
    const result = await pool.query('SELECT * FROM users');
    res.json(result.rows);
});

// GET /users/:id
app.get('/users/:id', async (req, res) => {
    const id = req.params.id;
    const result = await pool.query('SELECT * FROM users WHERE id = $1', [id]);
    if (result.rows.length === 0) {
        return res.status(404).json({ message: 'Usuario no encontrado' });
    }
    res.json(result.rows[0]);
});

// POST /users
// Crear un nuevo usuario
// Body JSON esperado: { name: string, email: string }
app.post('/users', async (req, res) => {
    const { name, email } = req.body || {};

    if (!name || !email) {
        return res.status(400).json({ error: 'Nombre y email son requeridos' });
    }

    const result = await pool.query(
        'INSERT INTO users (name, email, created_at) VALUES ($1, $2, NOW()) RETURNING *',
        [name, email]
    );

    res.status(201).json(result.rows[0]);
});

// DELETE /users/:id
// Elimina un usuario por id
app.delete('/users/:id', async (req, res) => {
    const id = req.params.id;

    const result = await pool.query('DELETE FROM users WHERE id = $1 RETURNING *', [id]);
  
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Usuario no encontrado' });
    }
  
    return res.status(204).send();
});


app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});