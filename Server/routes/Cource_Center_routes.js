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



module.exports = course_centerRouter;
// routes/course_center_routes.js
