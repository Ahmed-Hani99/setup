import prisma, { Prisma }  from "@prisma/client"
import express from "express"
import {selectAll} from "./date.js"

const app = express();
app.use(express.json());
app.set('view engine', 'ejs')

app.get("/", (req, res) => {
    console.log("Here")
    res.render("index", {text: 'World'})
})


async function main()
{
    const doctors = await prisma.doctor.findMany(
        {
        where: {
            dID: 20220069,
            },
         }); 
}


//pharmacy with ID
app.get("/api/pharmacies/:id", (req, res)=>
{
    const pharmacy = pharmacies.find(m => m.id === parseInt(req.params.id));
    if (!pharmacy) res.status(404).send('the pharmacy with the given ID was not found');
    res.send(pharmacy);
})

//medicines
app.get("/api/medicines/", (req, res)=>
{
    res.send(Medicines)
})

//medicines with ID
app.get("/api/medicines/:id", (req, res)=>
{
    const medicine = Medicines.find(m => m.id === parseInt(req.params.id));
    if (!medicine) res.status(404).send('the medicine with the given ID was not found');
    res.send(medicine);
})

//posts for pharmacies
app.post('/api/pharmacies', (req, res) =>{
    const pharmacy = {
        id: pharmacies.length +1,
        name: req.body.name
    }
    pharmacies.push(pharmacy);
    res.send(pharmacy);
})

//posts for pharmacies

app.listen(8000, console.log('lisening on port 8000....'))




/*End Points:
•	Medicines
o	ID
o	Name
•	Customer
o	ID
•	Doctor
o	ID
•	Order
o	ID
•	Staff
o	ID
•	Admin
o	ID
 */

/*const pharmacies = [
    { id: 1 , name: 'alnoor', location: 'manama'},
    { id: 2 , name: 'royan'},
    { id: 3 , name: 'alhidd'},
];

const Medicines = [
    { id: 1 , name: 'panadol'},
    { id: 2 , name: 'aminor'},
    { id: 3 , name: 'airon'},
];
*/