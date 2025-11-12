import { PrismaClient } from "@prisma/client";

import {
  calculateBMR,
  calculateMacros,
  calculateTDEE,
  adjustCalories,
} from "../services/calculator.js";

const prisma = new PrismaClient();

export async function getNutritionStats(req, res) {
  try {
    const { userId } = req.params;
    const user = await prisma.user.findUnique({ where: { id: userId } });
    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }
    const { gender, currentWeight, height, age, activity, goal } = user;
    if (!gender || !currentWeight || !height || !age || !activity || !goal) {
      return res
        .status(400)
        .json({
          error:
            "User profile incomplete.Ensure all necessary fields are filled.",
        });
    }
    const bmr = calculateBMR(gender, currentWeight, height, age);
    const tdee = calculateTDEE(bmr, activity);
    const adjustedCalories = adjustCalories(tdee, goal);
    const macros = calculateMacros(adjustedCalories, goal);

    const stats = await prisma.NutritionStats.upsert({
      where: { userId: userId },
      update: {
        calories: adjustedCalories,
        carbs: macros.carb,
        protein: macros.protein,
        fat: macros.fat,
      },
      create: {
        userId,
        calories: adjustedCalories,
        carbs: macros.carb,
        protein: macros.protein,
        fat: macros.fat,
      },
    });
    return res.json({
      bmr,
      tdee,
      adjustedCalories,
      macros: stats,
      message: "Nutrition stats calculated and saved successfully.",

    });
  } catch (error) {
    console.error("Error calculating nutrition stats:", error);
    return res
      .status(500)
      .json({ error: "An error occurred while calculating nutrition stats." });
  }
}
