import express from 'express';
import 'dotenv/config';
import cors from 'cors';
import { data } from './dataset.mjs';
import DATABASE from './db/connnectdb.mjs';
const app = express();
const PORT = process.env.SERVER_PORT;
const db = new DATABASE();
app.use(cors());

app.use(express.json());

app.get('/api/intent', async (req, res) => {
    const result = await db.GET_ALL();
    res.status(200).json(result);
});

app.post('/api/intent', async (req, res) => {
    const data = await req.body
    const result = await db.ADD_DATA(data);
    res.status(200).json(result);
});

app.delete('/api/intent/:id', async (req, res) => {
    const id = await req.params.id;
    const response = await db.DELETE_DATA(id);
    res.status(200).json({ message: "Delete Success" });
})

app.listen(PORT, () => {
    console.log(`Server listening on ${PORT}`);
});
