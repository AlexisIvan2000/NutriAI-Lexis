-- CreateTable
CREATE TABLE "NutritionStats" (
    "id" SERIAL NOT NULL,
    "calories" INTEGER NOT NULL,
    "carbs" INTEGER NOT NULL,
    "protein" INTEGER NOT NULL,
    "fat" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" TEXT NOT NULL,

    CONSTRAINT "NutritionStats_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "NutritionStats_userId_key" ON "NutritionStats"("userId");

-- AddForeignKey
ALTER TABLE "NutritionStats" ADD CONSTRAINT "NutritionStats_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
