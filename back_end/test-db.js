const { Client } = require("pg");
require("dotenv").config();

const client = new Client({
  connectionString: process.env.DATABASE_URL,
});

client.connect()
  .then(() => console.log("Database Connected Successfully"))
  .catch(err => console.log("Connection Error:", err));
