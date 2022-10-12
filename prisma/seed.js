import * as faker from 'faker';
import { PrismaClient } from '@prisma/client'

const { faker } = require ('faker');


const data = Array.from({lenght: 100}).map(() => 
(
    {
        DocID : faker.id(),
        DocCPR: faker.CPR(),
        DocDateOfBirth: faker.DocDateOfBirth(),
        DocPassword: faker.DocPassword(),
        DocName: faker.DocName(),
        DocGender: faker.DocGender(),
        DocEmail: faker.DocEmail(),
        DocTel: faker.DocPhone(),
        DocPicture: faker.DocPicture(),
        hosClinName: faker.DochosClinName(),
    }
))

const prisma = new PrismaClient()

async function main(){
   await prisma.doctor.createMany({
    data
   })
}

main().catch(e=>{
    console.log(e);
    process.exit(1)
}).finally(() =>{
    prisma.$disconnect();
})

/*model Doctor {
  DocID          Int             @id @default(autoincrement())
  DocCPR         BigInt
  DocDateOfBirth DateTime
  DocPassword    String
  DocName        String
  DocGender      Boolean
  DocEmail       String
  DocTel         Float
  DocPicture     String
  hosClinName    String
  Prescriptions  Prescriptions[]
} */