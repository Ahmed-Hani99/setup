import express from "express"
import  { PrismaClient }  from "@prisma/client"


const prisma = new PrismaClient()
const app = express();

//app.use(express.json());
//app.set('view engine', 'ejs')

app.get('/api/medID', async(req, res, next)=>
{
        const medID = await prisma.medicines.findMany({
            where: { medID : 20230222},
        })
        res.json({data:medID}) 
        console.log(medID)
})

app.get('/api/dID', async(req, res, next)=>
{
        const dID = await prisma.doctor.findMany({
            where: { dID : 20220919},
        })
        res.json({data:dID}) 
        console.log(dID)
})

app.get('/api/cusID', async(req, res, next)=>
{
        const cusID = await prisma.customer.findMany({
            where: { cusID : 20210019},
        })
        res.json({data:cusID}) 
        console.log(cusID)
})

/*
const selectAll = (expressRES) =>
{
    var con = prisma.$connect;
    con.$connect((err)=>
    {
        if(err)
        {
            expressRES.status(400).send({
                message: "ERROR!",
            });
            throw err;
        }
        else{
            const sql = "SELECT * FROM Doctor;";
            con.prisma(sql,)
        }
    })
}

const selectAll = (expressRes) => {
  var con = mysql.createConnection(config);
  con.connect((err) => {
    if (err) {
      expressRes.status(400).send({
        message: "ERROR!!",
      });
      throw err;
    } else {
      const sql = "SELECT * FROM contacts;";
      con.query(sql, (err, result) => {
        if (err) {
          expressRes.status(400).send({
            message: "ERROR!!",
          });
          throw err;
        }
        expressRes.json(result);
      });
    }
  });
}; */



/*async function main()
{
     const did = await prisma.doctor.findUnique({
         where: {dID : 20228066,
            },
        })
        console.log(did)
    }

main()
.catch(e=>
    {
        console.error(e.message)
    })
.finally(async() =>{
    await prisma.$disconnect()
})
*/

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