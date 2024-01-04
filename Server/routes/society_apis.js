// society_apis.js
const express = require("express");
const bcryptjs = require("bcryptjs");
const Society = require("../model/society");
const authMiddleware = require("../middleware/auth");
const societyRouter = express.Router();
const User = require("../model/user");
const mongoose = require("mongoose");
const Post = require("../model/posts");

societyRouter.post("/api/signup_society", async (req, res) => {
  try {
    const { name, email, password } = req.body;

    const existingSociety = await Society.findOne({ email });
    if (existingSociety) {
      return res
        .status(400)
        .json({ msg: "Society with the same email already exists!" });
    }

    const hashedPassword = await bcryptjs.hash(password, 8);

    let newSociety = new Society({
      email,
      password: hashedPassword,
      name,
    });
    newSociety = await newSociety.save();
    res.json(newSociety);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = societyRouter;

