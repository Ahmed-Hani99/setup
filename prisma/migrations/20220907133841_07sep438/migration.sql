-- CreateTable
CREATE TABLE `Staff` (
    `staID` INTEGER NOT NULL AUTO_INCREMENT,
    `staCPR` BIGINT NOT NULL,
    `staDateOfBirth` DATETIME(3) NOT NULL,
    `staPassword` VARCHAR(191) NOT NULL,
    `staName` VARCHAR(191) NOT NULL,
    `staGender` BOOLEAN NOT NULL,
    `staJob` VARCHAR(191) NOT NULL,
    `staEmail` VARCHAR(191) NOT NULL,
    `staTel` DOUBLE NOT NULL,
    `staIsAdmin` BOOLEAN NOT NULL,

    PRIMARY KEY (`staID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Doctor` (
    `DocID` INTEGER NOT NULL AUTO_INCREMENT,
    `DocCPR` BIGINT NOT NULL,
    `DocDateOfBirth` DATETIME(3) NOT NULL,
    `DocPassword` VARCHAR(191) NOT NULL,
    `DocName` VARCHAR(191) NOT NULL,
    `DocGender` BOOLEAN NOT NULL,
    `DocEmail` VARCHAR(191) NOT NULL,
    `DocTel` DOUBLE NOT NULL,
    `DocPicture` VARCHAR(191) NOT NULL,
    `hosClinName` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`DocID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Customer` (
    `cusID` INTEGER NOT NULL AUTO_INCREMENT,
    `cusCPR` BIGINT NOT NULL,
    `cusDateOfBirth` DATETIME(3) NOT NULL,
    `cusEmail` VARCHAR(191) NOT NULL,
    `cusName` VARCHAR(191) NOT NULL,
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
    `OrdID` INTEGER NOT NULL AUTO_INCREMENT,
    `CustomerID` INTEGER NOT NULL,
    `StaID` INTEGER NOT NULL,
    `PresID` INTEGER NOT NULL,
    `Description` VARCHAR(191) NOT NULL,
    `OrdStatue` VARCHAR(191) NOT NULL,
    `OrdDate` DATETIME(3) NOT NULL,
    `TotalAmount` DOUBLE NOT NULL,

    UNIQUE INDEX `Order_PresID_key`(`PresID`),
    PRIMARY KEY (`OrdID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OrderMedicines` (
    `OrdID` INTEGER NOT NULL,
    `MedID` INTEGER NOT NULL,
    `OrdQuantity` INTEGER NOT NULL,

    PRIMARY KEY (`OrdID`, `MedID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Payment` (
    `PaymentID` INTEGER NOT NULL AUTO_INCREMENT,
    `OrdID` INTEGER NOT NULL,
    `PaymentDate` DATETIME(3) NOT NULL,
    `PaymentType` VARCHAR(191) NOT NULL,
    `PayStatus` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Payment_OrdID_key`(`OrdID`),
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
    `CartID` INTEGER NOT NULL,
    `MedID` INTEGER NOT NULL,

    PRIMARY KEY (`CartID`, `MedID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Prescriptions` ADD CONSTRAINT `Prescriptions_CustomerID_fkey` FOREIGN KEY (`CustomerID`) REFERENCES `Customer`(`cusID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Prescriptions` ADD CONSTRAINT `Prescriptions_DoctorID_fkey` FOREIGN KEY (`DoctorID`) REFERENCES `Doctor`(`DocID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PrescriptionsMedicines` ADD CONSTRAINT `PrescriptionsMedicines_PresID_fkey` FOREIGN KEY (`PresID`) REFERENCES `Prescriptions`(`presID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PrescriptionsMedicines` ADD CONSTRAINT `PrescriptionsMedicines_MedID_fkey` FOREIGN KEY (`MedID`) REFERENCES `Medicines`(`medID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Order` ADD CONSTRAINT `Order_CustomerID_fkey` FOREIGN KEY (`CustomerID`) REFERENCES `Customer`(`cusID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Order` ADD CONSTRAINT `Order_StaID_fkey` FOREIGN KEY (`StaID`) REFERENCES `Staff`(`staID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Order` ADD CONSTRAINT `Order_PresID_fkey` FOREIGN KEY (`PresID`) REFERENCES `Prescriptions`(`presID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderMedicines` ADD CONSTRAINT `OrderMedicines_OrdID_fkey` FOREIGN KEY (`OrdID`) REFERENCES `Order`(`OrdID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderMedicines` ADD CONSTRAINT `OrderMedicines_MedID_fkey` FOREIGN KEY (`MedID`) REFERENCES `Medicines`(`medID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Payment` ADD CONSTRAINT `Payment_OrdID_fkey` FOREIGN KEY (`OrdID`) REFERENCES `Order`(`OrdID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Cart` ADD CONSTRAINT `Cart_CusID_fkey` FOREIGN KEY (`CusID`) REFERENCES `Customer`(`cusID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CartMedicines` ADD CONSTRAINT `CartMedicines_CartID_fkey` FOREIGN KEY (`CartID`) REFERENCES `Cart`(`CartID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CartMedicines` ADD CONSTRAINT `CartMedicines_MedID_fkey` FOREIGN KEY (`MedID`) REFERENCES `Medicines`(`medID`) ON DELETE RESTRICT ON UPDATE CASCADE;
