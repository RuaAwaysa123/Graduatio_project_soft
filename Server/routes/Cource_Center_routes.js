const User = require("../model/user");
const mongoose = require("mongoose");
const Post = require("../model/posts");
const jwt = require("jsonwebtoken");
const Event = require("../model/event");
const Course = require("../model/course");
const multer = require("multer");
const express = require("express");
const bcryptjs = require("bcryptjs");
const CourseCenter = require("../model/course_center");
// Other imports...

const course_centerRouter = express.Router(); // Define the router


// Set up multer storage
const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

course_centerRouter.post("/api/signup_course_center", async (req, res) => {
  try {
    const { name, email, password } = req.body;

    const existingcenter = await CourseCenter.findOne({ email });
    if (existingcenter) {
      return res
        .status(400)
        .json({ msg: "Course center with the same email already exists!" });
    }

    const hashedPassword = await bcryptjs.hash(password, 8);

    let newCourseCenter = new CourseCenter({
      email,
      password: hashedPassword,
      name,
    });
    newCourseCenter = await newCourseCenter.save();
    res.json(newSociety);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


module.exports = course_centerRouter;
// routes/course_center_routes.js
