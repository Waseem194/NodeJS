const express = require("express");
const { sendQuery } = require("./mysql");
const app = express();

// for readonly route/path
app.get("/student", async (req, res) => {
  try {
    const students = await sendQuery("select name, rollNo, contact from student");
    res.send({ students: students});
  } catch (error) {
    res.send("An error occured");
  }
});

app.get("/departments", async(req, res) => {
  try {
    const departments = await sendQuery("select id, name from departments");
    console.log(departments);
    const result = [];
    for await (const department of departments) {
      const programs = await sendQuery("select id, name, shifts from programs p where p.fk_department = " + department.id);
      if (programs.length > 0) {
        result.push({
          ...department,
          programs
        })
      }
    }
    res.send(result);
    // const departments = await sendQuery("select * from departments d , programs p where d.id = p.fk_department");
    // console.log(departments);
    // res.send({ departments: departments});
  } catch (error) {
    res.send("An error occured");
  }
});
app.get("/programs", async(req, res) => {
  try {
    const programs = await sendQuery("select * from departments");
    res.send({ programs: programs});
  } catch (error) {
    res.send("An error occured");
  }
});
// app.post();
// app.put();
// app.delete();

app.listen(3000, () => console.log("Server is running at port 3000"));
