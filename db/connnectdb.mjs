import mysql from "mysql2/promise";
import { gno } from "../action/gno.mjs";

export default class DATABASE {

    async connection() {
        try {
            const connection = await mysql.createConnection({
                host: process.env.HOST,
                user: process.env.USER,
                database: process.env.DATABASE,
                password: process.env.PASSWORD,
            });
            return connection;
        } catch (err) {
            console.error(`Error creating connection ${err}`);
            throw err;
        }
    }

    async GET_ALL() {
        try {
            const connection = await this.connection();
            const [result, fields] = await connection.query("SELECT * FROM data;");
            connection.end();
            return result;
        } catch (err) { }
        return;
    }

    async ADD_DATA(data) {

        try {
            const connection = await this.connection();
            let { intent, subintent, point } = data
            if (subintent == "sap") { subintent = 1 } else if (subintent == "ad") { subintent = 2 }
            const token = await gno();
            const sql = `INSERT INTO data (id, intent, subintent, point, date) VALUES (?, ?, ?, ?, current_timestamp())`;
            const [result] = await connection.query(sql, [
                token,
                intent,
                subintent,
                point
            ]);
            connection.end();
            if (result.affectedRows === 1) {
                return true;
            } else {
                return false;
            }
        } catch (err) {
            console.error("Failed to insert data");
        }
    }

    async DELETE_DATA(id) {
        try {
            const connection = await this.connection()
            const sql = `DELETE FROM data WHERE id =?;`;
            const [result] = await connection.query(sql, [
                id,
            ]);
            connection.end();
            if (result.affectedRows === 1) {
                return true;
            } else {
                throw false;
            }
        } catch (err) {
            console.error(`Failed to delete ${err}`)
        }


    }
}