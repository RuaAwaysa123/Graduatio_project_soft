const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/app");
const bcryptjs = require("bcryptjs");



const PORT = process.env.PORT || 3000;
const app = express();
//const cors = require("cors");
//app.use(cors());

app.use(express.json());
app.use(authRouter);

const DB = "mongodb+srv://Rua:CNkuPgFcdKzGLHPv@cluster0.uouryro.mongodb.net/?retryWrites=true&w=majority"

mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection to MongoDB successful");
  })
  .catch((e) => {
    console.log(e);
  });
app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});

