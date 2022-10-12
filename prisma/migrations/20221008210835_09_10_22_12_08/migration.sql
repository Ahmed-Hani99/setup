-- CreateTable
CREATE TABLE `Staff` (
    `staID` INTEGER NOT NULL AUTO_INCREMENT,
    `staCPR` BIGINT NOT NULL,
    `sDOB` DATETIME(3) NOT NULL,
    `staPassword` VARCHAR(191) NOT NULL,
    `staFName` VARCHAR(191) NOT NULL,
    `staLName` VARCHAR(191) NOT NULL,
    `staGender` VARCHAR(191) NOT NULL,
    `staJob` VARCHAR(191) NOT NULL,
    `staEmail` VARCHAR(191) NOT NULL,
    `staTel` DOUBLE NOT NULL,
    `staIsAdmin` BOOLEAN NOT NULL,
    PRIMARY KEY (`staID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- CreateTable
CREATE TABLE `Doctor` (
    `dID` INTEGER NOT NULL AUTO_INCREMENT,
    `dCPR` BIGINT NOT NULL,
    `dDOB` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `dPassword` VARCHAR(191) NOT NULL,
    `dFName` VARCHAR(191) NOT NULL,
    `dFLame` VARCHAR(191) NOT NULL,
    `dGender` VARCHAR(191) NOT NULL,
    `dEmail` VARCHAR(191) NOT NULL,
    `dTel` DOUBLE NOT NULL,
    `dPicture` VARCHAR(191) NOT NULL,
    VARCHAR(191) NOT NULL,
    PRIMARY KEY (`dID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- CreateTable
CREATE TABLE `Customer` (
    `cusID` INTEGER NOT NULL AUTO_INCREMENT,
    `cusCPR` BIGINT NOT NULL,
    `cusDateOfBirth` DATETIME(3) NOT NULL,
    `cusEmail` VARCHAR(191) NOT NULL,
    `cusFName` VARCHAR(191) NOT NULL,
    `cusLName` VARCHAR(191) NOT NULL,
    `cusGender` BOOLEAN NOT NULL,
    `cusStreet` INTEGER NOT NULL,
    `cusCity` VARCHAR(191) NOT NULL,
    `cusBlock` INTEGER NOT NULL,
    `cusHouse` INTEGER NOT NULL,
    `cusPassword` VARCHAR(191) NOT NULL,
    `cusTel` DOUBLE NOT NULL,
    PRIMARY KEY (`cusID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- CreateTable
CREATE TABLE `Prescriptions` (
    `presID` INTEGER NOT NULL AUTO_INCREMENT,
    `CustomerID` INTEGER NOT NULL,
    `DoctorID` INTEGER NOT NULL,
    `PresPicture` VARCHAR(191) NOT NULL,
    `HosClinVisitDate` DATETIME(3) NOT NULL,
    `PresDateApp` DATETIME(3) NOT NULL,
    `PresTitle` VARCHAR(191) NOT NULL,
    PRIMARY KEY (`presID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- CreateTable
CREATE TABLE `Medicines` (
    `medID` INTEGER NOT NULL AUTO_INCREMENT,
    `medName` VARCHAR(191) NOT NULL,
    `medDescription` VARCHAR(191) NOT NULL,
    `medCategory` VARCHAR(191) NOT NULL,
    `medPrice` INTEGER NOT NULL,
    `medAvailQuant` INTEGER NOT NULL,
    `companyName` VARCHAR(191) NOT NULL,
    `medPicture` VARCHAR(191) NOT NULL,
    `medSpecification` VARCHAR(191) NOT NULL,
    `comments` VARCHAR(191) NOT NULL,
    PRIMARY KEY (`medID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- CreateTable
CREATE TABLE `PrescriptionsMedicines` (
    `PresID` INTEGER NOT NULL,
    `MedID` INTEGER NOT NULL,
    PRIMARY KEY (`PresID`, `MedID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- CreateTable
CREATE TABLE `Order` (
    `ordID` INTEGER NOT NULL AUTO_INCREMENT,
    `customerID` INTEGER NOT NULL,
    `staID` INTEGER NOT NULL,
    `presID` INTEGER NOT NULL,
    `description` VARCHAR(191) NOT NULL,
    `ordStatue` VARCHAR(191) NOT NULL,
    `ordDate` DATETIME(3) NOT NULL,
    `totalAmount` DOUBLE NOT NULL,
    UNIQUE INDEX `Order_presID_key`(`presID`),
    PRIMARY KEY (`ordID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- CreateTable
CREATE TABLE `OrderMedicines` (
    `ordID` INTEGER NOT NULL,
    `medID` INTEGER NOT NULL,
    `ordQuantity` INTEGER NOT NULL,
    PRIMARY KEY (`ordID`, `medID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- CreateTable
CREATE TABLE `Payment` (
    `PaymentID` INTEGER NOT NULL AUTO_INCREMENT,
    `ordID` INTEGER NOT NULL,
    `PaymentDate` DATETIME(3) NOT NULL,
    `PaymentType` VARCHAR(191) NOT NULL,
    `PayStatus` VARCHAR(191) NOT NULL,
    UNIQUE INDEX `Payment_ordID_key`(`ordID`),
    PRIMARY KEY (`PaymentID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- CreateTable
CREATE TABLE `Cart` (
    `CartID` INTEGER NOT NULL AUTO_INCREMENT,
    `CusID` INTEGER NOT NULL,
    PRIMARY KEY (`CartID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- CreateTable
CREATE TABLE `CartMedicines` (
    `cartID` INTEGER NOT NULL,
    `medID` INTEGER NOT NULL,
    PRIMARY KEY (`cartID`, `medID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- AddForeignKey
ALTER TABLE `Prescriptions`
ADD CONSTRAINT `Prescriptions_CustomerID_fkey` FOREIGN KEY (`CustomerID`) REFERENCES `Customer`(`cusID`) ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE `Prescriptions`
ADD CONSTRAINT `Prescriptions_DoctorID_fkey` FOREIGN KEY (`DoctorID`) REFERENCES `Doctor`(`dID`) ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE `PrescriptionsMedicines`
ADD CONSTRAINT `PrescriptionsMedicines_PresID_fkey` FOREIGN KEY (`PresID`) REFERENCES `Prescriptions`(`presID`) ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE `PrescriptionsMedicines`
ADD CONSTRAINT `PrescriptionsMedicines_MedID_fkey` FOREIGN KEY (`MedID`) REFERENCES `Medicines`(`medID`) ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE `Order`
ADD CONSTRAINT `Order_customerID_fkey` FOREIGN KEY (`customerID`) REFERENCES `Customer`(`cusID`) ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE `Order`
ADD CONSTRAINT `Order_staID_fkey` FOREIGN KEY (`staID`) REFERENCES `Staff`(`staID`) ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE `Order`
ADD CONSTRAINT `Order_presID_fkey` FOREIGN KEY (`presID`) REFERENCES `Prescriptions`(`presID`) ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE `OrderMedicines`
ADD CONSTRAINT `OrderMedicines_ordID_fkey` FOREIGN KEY (`ordID`) REFERENCES `Order`(`ordID`) ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE `OrderMedicines`
ADD CONSTRAINT `OrderMedicines_medID_fkey` FOREIGN KEY (`medID`) REFERENCES `Medicines`(`medID`) ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE `Payment`
ADD CONSTRAINT `Payment_ordID_fkey` FOREIGN KEY (`ordID`) REFERENCES `Order`(`ordID`) ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE `Cart`
ADD CONSTRAINT `Cart_CusID_fkey` FOREIGN KEY (`CusID`) REFERENCES `Customer`(`cusID`) ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE `CartMedicines`
ADD CONSTRAINT `CartMedicines_cartID_fkey` FOREIGN KEY (`cartID`) REFERENCES `Cart`(`CartID`) ON DELETE RESTRICT ON UPDATE CASCADE;
-- AddForeignKey
ALTER TABLE `CartMedicines`
ADD CONSTRAINT `CartMedicines_medID_fkey` FOREIGN KEY (`medID`) REFERENCES `Medicines`(`medID`) ON DELETE RESTRICT ON UPDATE CASCADE;