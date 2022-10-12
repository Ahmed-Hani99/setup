import mysql from 'mysql'

var config = mysql.createConnection({
  host     : 'localhost',
  user     : 'Ahmed99',
  password : 'BECJNQ147_La97',
  database : 'pharmacydbs',
  port: '3000'
});
 

 export const selectAll = (expressRes) => {

  var con = mysql.createConnection(config);

  con.connect((err) => {

    if (err) {

      expressRes.status(400).send({

        message: "ERROR!!",

      });

      throw err;

    } else {

      const sql = "SELECT * FROM doctor;";

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

};
 