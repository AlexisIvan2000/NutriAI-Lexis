const ACTIVITY_FACTORS = {
  SEDENTARY: 1.2,
  LIGHT: 1.375,
  MODERATE: 1.55,
  ACTIVE: 1.725,
  VERY_ACTIVE: 1.9,
};

const CALORIES_PER_GRAM = {
  PROTEIN: 4,
  CARB: 4,
  FAT: 9,
};

function lbsToKg(lbs) {
  return lbs / 2.20462;
}

function inchesToCm(inches) {
  return inches * 2.54;
}

export function calculateBMR(gender, currentWeight, height, age) {
  const weightKg = lbsToKg(currentWeight);
  const heightCm = inchesToCm(height);
  if (gender.toUpperCase() === "MALE") {
    return Math.round(10 * weightKg + 6.25 * heightCm - 5 * age + 5);
  } else if (gender.toUpperCase() === "FEMALE") {
    return Math.round(10 * weightKg + 6.25 * heightCm - 5 * age - 161);
  } else {
    throw new Error('Invalid gender provided. Must be "MALE" or "FEMALE".');
  }
}

export function calculateTDEE(bmr, activity) {
  const factor = ACTIVITY_FACTORS[activity.toUpperCase()];
  if (!factor) throw new Error("Invalid activity level provided.");
  return Math.round(bmr * factor);
}

export function adjustCalories(tdee, goal) {
  switch (goal.toUpperCase()) {
    case "LOSE_WEIGHT":
      return tdee - (15 / 100) * tdee;
    case "GAIN_MUSCLE":
      return tdee + (15 / 100) * tdee;
    case "MAINTAIN_WEIGHT":
      return tdee;
    default:
      throw new Error("Invalid goal provided.");
  }
}

export function calculateMacros(tdee, goal) {
  if (goal.toUpperCase() === "LOSE_WEIGHT") {
    return {
      protein: Math.round((0.4 * tdee) / CALORIES_PER_GRAM.PROTEIN),
      carb: Math.round((0.35 * tdee) / CALORIES_PER_GRAM.CARB),
      fat: Math.round((0.25 * tdee) / CALORIES_PER_GRAM.FAT),
    };
  } else if (goal.toUpperCase() === "GAIN_MUSCLE") {
    return {
      protein: Math.round((0.3 * tdee) / CALORIES_PER_GRAM.PROTEIN),
      carb: Math.round((0.5 * tdee) / CALORIES_PER_GRAM.CARB),
      fat: Math.round((0.2 * tdee) / CALORIES_PER_GRAM.FAT),
    };
  } else if (goal.toUpperCase() === "MAINTAIN_WEIGHT") {
    return {
      protein: Math.round((0.3 * tdee) / CALORIES_PER_GRAM.PROTEIN),
      carb: Math.round((0.4 * tdee) / CALORIES_PER_GRAM.CARB),
      fat: Math.round((0.3 * tdee) / CALORIES_PER_GRAM.FAT),
    };
  }
}
