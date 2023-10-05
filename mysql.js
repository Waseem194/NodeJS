const mysql = require("mysql");
const connection = mysql.createConnection({
  host: "localhost",
  user: "waseem",
  password: "admin123",
  database: "education",
});

connection.connect((error) => {
  if (error) {
    console.error("Connection failed", error);
    return;
  }
});

function sendQuery(query) {
  return new Promise((resolve, reject) => {
    connection.query(query, (error, result) => {
      if (error) {
        console.error("Query error", error);
        reject(error);
      }
      resolve(result);
    })
  });
}


module.exports = { sendQuery };