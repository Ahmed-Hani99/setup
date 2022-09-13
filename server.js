const express = require('express');
const app = express();
app.use(express.json());

const pharamcies = [
    { id: 1 , name: 'alnoor', location: 'manama'},
    { id: 2 , name: 'royan'},
    { id: 3 , name: 'alhidd'},
];


app.set('view engine', 'ejs')

app.get("/", (req, res) => {
    console.log("Here")
    res.render("index", {text: 'World'})
})

app.get("/api/pharamcies", (req, res)=>
{
    res.send("pharamcies List")
})

app.get("/api/pharamcies/new", (req, res)=>
{
    res.send("pharmacy new form")
})

app.get("/api/pharamcies/:id", (req, res)=>
{
    const pharmacy = pharamcies.find(c => c.id === parseInt(req.params.id));
    if (!pharmacy) res.status(404).send('the pharmacy with the given ID was not found');
    res.send(pharmacy);
})

//posts for pharmacies
app.post('/api/pharamcies', (req, res) =>{
    const pharmacy = {
        id: pharamcies.length +1,
        name: req.body.name
    }
    pharamcies.push(pharmacy);
    res.send(pharmacy);
})

//posts for pharmacies

app.listen(8000, console.log('lisening on port 8000....'))

