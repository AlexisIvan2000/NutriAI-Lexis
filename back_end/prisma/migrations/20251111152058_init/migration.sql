-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "firstName" TEXT,
    "lastName" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "age" INTEGER,
    "currentWeight" DOUBLE PRECISION,
    "targetWeight" DOUBLE PRECISION,
    "height" DOUBLE PRECISION,
    "gender" TEXT,
    "activity" TEXT,
    "dietType" TEXT,
    "allergies" TEXT,
    "goal" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
