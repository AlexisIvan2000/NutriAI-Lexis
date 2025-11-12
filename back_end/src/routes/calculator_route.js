import express from 'express';
import {} from "../controllers/calculator_controller.js";

const router = express.Router();

router.get("/stats/:userId", getNutritionStats);

export default router; 