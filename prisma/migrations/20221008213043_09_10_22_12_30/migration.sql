/*
  Warnings:

  - You are about to drop the column `cusDateOfBirth` on the `customer` table. All the data in the column will be lost.
  - Added the required column `cDOB` to the `Customer` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `customer` DROP COLUMN `cusDateOfBirth`,
    ADD COLUMN `cDOB` DATETIME(3) NOT NULL;
