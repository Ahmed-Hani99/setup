/*
  Warnings:

  - You are about to alter the column `cusGender` on the `customer` table. The data in that column could be lost. The data in that column will be cast from `TinyInt` to `VarChar(191)`.

*/
-- AlterTable
ALTER TABLE `customer` MODIFY `cusGender` VARCHAR(191) NOT NULL;
