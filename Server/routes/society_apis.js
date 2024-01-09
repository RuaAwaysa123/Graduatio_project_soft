// society_apis.js
const express = require("express");
const bcryptjs = require("bcryptjs");
const Society = require("../model/society");
const authMiddleware = require("../middleware/auth");
const societyRouter = express.Router();
const User = require("../model/user");
const mongoose = require("mongoose");
const Post = require("../model/posts");
const jwt = require("jsonwebtoken");
const Event = require("../model/event");
const Course = require("../model/course");


const multer = require("multer");

// Set up multer storage
const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

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

// Second step: Add mission, vision, and location
societyRouter.post("/api/signup_society_step2/:societyId", async (req, res) => {
  try {
    const { mission, vision, location } = req.body;
    const { societyId } = req.params;

    // Find the society by ID
    const society = await Society.findById(societyId);

    if (!society) {
      return res.status(404).json({ msg: "Society not found" });
    }

    // Update the society with additional information (step 2)
    society.mission = mission;
    society.vision = vision;
    society.location = location;

    await society.save();

    res.json({ msg: "Society information updated successfully" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Upload society profile picture
societyRouter.post("/api/upload_society_image/:societyId", upload.single("image"), async (req, res) => {
  try {
    const { societyId } = req.params;
    const society = await Society.findById(societyId);

    if (!society) {
      return res.status(404).json({ msg: "Society not found" });
    }

    // Check if an image file is provided
    if (!req.file) {
      return res.status(400).json({ msg: "No image file provided" });
    }

    // Save the image data to the society
    society.image = req.file.buffer;

    await society.save();

    res.json({ msg: "Society profile picture uploaded successfully" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// society_apis.js

// ... (existing imports)

// Create a new event
societyRouter.post("/api/create_event/:societyId", async (req, res) => {
  try {
    const { societyId } = req.params;
    const { name, topics, majors, location, isOnline, dateTime, price, description } = req.body;

    // Find the society by ID
    const society = await Society.findById(societyId);

    if (!society) {
      return res.status(404).json({ msg: "Society not found" });
    }

    // Create a new event
    const newEvent = new Event({
      name,
      topics,
      majors,
      location,
      isOnline,
      dateTime,
      price,
      organizers: [societyId], // Assuming the society is the organizer
      description,
    });

    await newEvent.save();

    // Add the event to the society's events array
    society.events.push(newEvent._id);
    await society.save();

    res.json({ msg: "Event created successfully", event: newEvent });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

societyRouter.put("/api/update_event/:eventId", async (req, res) => {
  try {
    const { eventId } = req.params;
    const { name, topics, majors, location, isOnline, dateTime, price, description } = req.body;

    // Find the event by ID
    const event = await Event.findById(eventId);

    if (!event) {
      return res.status(404).json({ msg: "Event not found" });
    }

    // Update event details
    event.name = name || event.name;
    event.topics = topics || event.topics;
    event.majors = majors || event.majors;
    event.location = location || event.location;
    event.isOnline = isOnline || event.isOnline;
    event.dateTime = dateTime || event.dateTime;
    event.price = price || event.price;
    event.description = description || event.description;

    await event.save();

    res.json({ msg: "Event updated successfully", event });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Delete an event
societyRouter.delete("/api/delete_event/:eventId", async (req, res) => {
  try {
    const { eventId } = req.params;

    // Find the event by ID
    const event = await Event.findById(eventId);

    if (!event) {
      return res.status(404).json({ msg: "Event not found" });
    }

    // Remove the event from the associated societies
    const societies = await Society.updateMany(
      { events: eventId },
      { $pull: { events: eventId } }
    );

    // Delete the event
    await Event.findByIdAndDelete(eventId);

    res.json({ msg: "Event deleted successfully" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// society_apis.js

// ... (existing imports)

// Create a new course
societyRouter.post("/api/create_course/:societyId", async (req, res) => {
  try {
    const { societyId } = req.params;
    const { name, topics, prequests, majors, location, isOnline, startDate, endDate, time, credential, price, trainer, description } = req.body;

    // Find the society by ID
    const society = await Society.findById(societyId);

    if (!society) {
      return res.status(404).json({ msg: "Society not found" });
    }

    // Create a new course
    const newCourse = new Course({
      name,
      topics,
      prequests,
      majors,
      location,
      isOnline,
      startDate,
      endDate,
      time,
      credential,
      price,
      trainer,
      description,
      isSociety: true,
      organization: societyId, // Assuming the society is the organizer
    });

    await newCourse.save();

    // Add the course to the society's courses array
    society.course.push(newCourse._id);
    await society.save();

    res.json({ msg: "Course created successfully", course: newCourse });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
// Update a course
societyRouter.put("/api/update_course/:courseId", async (req, res) => {
  try {
    const { courseId } = req.params;
    const { name, topics, prequests, majors, location, isOnline, startDate, endDate, time, credential, price, trainer, description } = req.body;

    // Find the course by ID
    const course = await Course.findById(courseId);

    if (!course) {
      return res.status(404).json({ msg: "Course not found" });
    }

    // Update course details
    course.name = name || course.name;
    course.topics = topics || course.topics;
    course.prequests = prequests || course.prequests;
    course.majors = majors || course.majors;
    course.location = location || course.location;
    course.isOnline = isOnline || course.isOnline;
    course.startDate = startDate || course.startDate;
    course.endDate = endDate || course.endDate;
    course.time = time || course.time;
    course.credential = credential || course.credential;
    course.price = price || course.price;
    course.trainer = trainer || course.trainer;
    course.description = description || course.description;

    await course.save();

    res.json({ msg: "Course updated successfully", course });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Delete a course
societyRouter.delete("/api/delete_course/:courseId", async (req, res) => {
  try {
    const { courseId } = req.params;

    // Find the course by ID
    const course = await Course.findById(courseId);

    if (!course) {
      return res.status(404).json({ msg: "Course not found" });
    }

    // Remove the course from the associated societies
    const societies = await Society.updateMany(
      { course: courseId },
      { $pull: { course: courseId } }
    );

    // Delete the course
    await Course.findByIdAndDelete(courseId);

    res.json({ msg: "Course deleted successfully" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// society_apis.js

// ... (existing imports)

societyRouter.post("/api/login_society", async (req, res) => {
  try {
    const { email, password } = req.body;

    // Find the society by email
    const society = await Society.findOne({ email });

    if (!society) {
      return res.status(404).json({ msg: "Society not found" });
    }

    // Check if the provided password is correct
    const isPasswordValid = await bcryptjs.compare(password, society.password);

    if (!isPasswordValid) {
      return res.status(401).json({ msg: "Invalid password" });
    }

    res.json({ msg: "Society logged in successfully" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// ... (existing code)


// Login Society with jwt
//societyRouter.post("/api/login_society", async (req, res) => {
//  try {
//    const { email, password } = req.body;
//
//    // Find the society by email
//    const society = await Society.findOne({ email });
//
//    if (!society) {
//      return res.status(404).json({ msg: "Society not found" });
//    }
//
//    // Check if the provided password is correct
//    const isPasswordValid = await bcryptjs.compare(password, society.password);
//
//    if (!isPasswordValid) {
//      return res.status(401).json({ msg: "Invalid password" });
//    }
//
//    // Generate and send an authentication token (you might want to use JWT)
//    const authToken = generateAuthToken(society._id);
//
//    res.json({ msg: "Society logged in successfully", authToken });
//  } catch (e) {
//    res.status(500).json({ error: e.message });
//  }
//});
//
//// Helper function to generate an authentication token (using JWT)
//function generateAuthToken(societyId) {
//  // You need to implement the logic to generate and sign a JWT token here
//  // Example using a fictional library
//  const authToken = fictionalJWTLibrary.sign({ societyId }, "your-secret-key", { expiresIn: "1h" });
//
//  return authToken;
//}



module.exports = societyRouter;

