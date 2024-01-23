//const express = require("express");
//const mongoose = require("mongoose");
//const authRouter = require("./routes/app");
//
////const courceCenterRouter = require("./routes/Cource_Center_routes");    //Server/routes/Cource_Center_routes.js
//const bcryptjs = require("bcryptjs");
//
//const PORT = process.env.PORT || 3000;
//const app = express();
////const cors = require("cors");
////app.use(cors());
//
//app.use(express.json());
//app.use(authRouter);
////app.use(courceCenterRouter);
//const DB = "mongodb+srv://Rua:CNkuPgFcdKzGLHPv@cluster0.uouryro.mongodb.net/?retryWrites=true&w=majority"
//
//mongoose
//  .connect(DB)
//  .then(() => {
//    console.log("Connection to MongoDB successful");
//  })
//  .catch((e) => {
//    console.log(e);
//  });
//app.listen(PORT, "0.0.0.0", () => {
//  console.log(`connected at port ${PORT}`);
//});
//
// index.js
const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/app");
const societyRouter = require("./routes/society_apis");  // Import your society APIs
const course_centerRouter = require("./routes/Cource_Center_routes");

const PORT = process.env.PORT || 3000;
const app = express();
app.use(course_centerRouter);
app.use(express.json());
app.use(authRouter);
app.use(societyRouter);  // Use your society APIs router

const DB = "mongodb+srv://Rua:CNkuPgFcdKzGLHPv@cluster0.uouryro.mongodb.net/?retryWrites=true&w=majority";
//const DB ="mongodb+srv://Ruaa:Ruaa12345678@cluster0.fjjvrmb.mongodb.net/?retryWrites=true&w=majority"
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection to MongoDB successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Connected at port ${PORT}`);
});
// index.js