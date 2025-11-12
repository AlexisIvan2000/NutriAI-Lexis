import express from "express";
import nutritionRoute from "./routes/calculator_route.js";

const app = express();
app.use(express.json());
app.use("/api/calculator", nutritionRoute);
app.listen(5000, () => console.log("Server running on port 5000"));


require ("dotenv").config();
