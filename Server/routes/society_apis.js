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

societyRouter.post("/api/create_course/:societyId", upload.single("image"), async (req, res) => {
  try {
    const { societyId } = req.params;
    const {
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
      startTime,
      endTime,
      days,
      image, // Assuming you want to upload an image for the course
      maxnumofstudent,
    } = req.body;

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
      price,
      endDate,
      time,
      credential,
//      price,
//price: parseInt(price),
      trainer,
      description,
      isSociety: true,
      organization: societyId, // Assuming the society is the organizer
      sessions: [],
      ratings: [],
      startTime,
      endTime,
      days,
       image: req.file.buffer, // Assuming you want to upload an image for the course
      maxnumofstudent,
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
    const { name, topics, prequests, majors, location, isOnline, startDate, time, credential, trainer, description,price } = req.body;

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

    res.json({ msg: "Society logged in successfully" ,society });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
societyRouter.post("/api/upload_event_image/:eventId", upload.single("image"), async (req, res) => {
  try {
    const { eventId } = req.params;
    const event = await Event.findById(eventId);

    if (!event) {
      return res.status(404).json({ msg: "Event not found" });
    }

    // Check if an image file is provided
    if (!req.file) {
      return res.status(400).json({ msg: "No image file provided" });
    }

    // Save the image data to the event
    event.image = {
      data: req.file.buffer,
      contentType: req.file.mimetype,
    };

    await event.save();

    res.json({ msg: "Event image uploaded successfully" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

societyRouter.get("/api/get_society/:societyId", async (req, res) => {
  try {
    const { societyId } = req.params;

    const society = await Society.findById(societyId)
      .populate('members')
      .populate('followers')
      .populate('events')
      .populate('course');

    if (!society) {
      return res.status(404).json({ msg: "Society not found" });
    }

    res.json({ society });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
// Define a route to handle user membership application
societyRouter.post("/api/join_society/:societyId", async (req, res) => {
  try {
    const { societyId } = req.params;
    const { userId, paymentAmount } = req.body;

    // Find the society by ID
    const society = await Society.findById(societyId);

    if (!society) {
      return res.status(404).json({ msg: "Society not found" });
    }

    // Check if the membership application period is open
    const currentDate = new Date();
    if (
      !society.membershipRequestsOpenDate ||
      currentDate < society.membershipRequestsOpenDate
    ) {
      return res.status(403).json({ msg: "Membership application period is not open" });
    }

    // Create a membership request
    const membershipRequest = {
      user: userId,
      paymentAmount,
      status: "Pending", // You can set the initial status to "Pending"
    };

    // Add the membership request to the society's membershipRequests array
    society.membershipRequests.push(membershipRequest);

    // Save the updated society
    await society.save();

    res.json({ msg: "Membership request submitted successfully" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Define a route to accept or reject a user's membership request
societyRouter.put("/api/process_membership_request/:societyId", async (req, res) => {
  try {
    const { societyId } = req.params;
    const { userId, isAccepted } = req.body;

    // Find the society by ID
    const society = await Society.findById(societyId);

    if (!society) {
      return res.status(404).json({ msg: "Society not found" });
    }

    // Check if the user has a pending membership request
    const membershipRequest = society.membershipRequests.find(
      (request) => request.user.toString() === userId && request.status === "Pending"
    );

    if (!membershipRequest) {
      return res.status(404).json({ msg: "No pending membership request found for the user" });
    }

    // Update the status of the membership request based on the decision
    membershipRequest.status = isAccepted ? "Accepted" : "Rejected";

    // If accepted, add the user to the society's members array
    if (isAccepted) {
      society.members.push(userId);
    }

    // Remove the processed membership request from the array
    society.membershipRequests = society.membershipRequests.filter(
      (request) => request.user.toString() !== userId
    );

    // Save the updated society
    await society.save();

    res.json({ msg: `Membership request ${isAccepted ? 'accepted' : 'rejected'} successfully` });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// society_apis.js

// Define a route to set the membership application period
societyRouter.post("/api/set_membership_application_period/:societyId", async (req, res) => {
  try {
    const { societyId } = req.params;
    const { openDate, closeDate } = req.body;

    // Find the society by ID
    const society = await Society.findById(societyId);

    if (!society) {
      return res.status(404).json({ msg: "Society not found" });
    }

    // Update the membership application period
    society.membershipRequestsOpenDate = openDate;
    society.membershipRequestsCloseDate = closeDate;

    // Save the updated society
    await society.save();

    res.json({ msg: "Membership application period set successfully" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
// society_apis.js

// Define a route to get the membership application period
societyRouter.get("/api/get_membership_application_period/:societyId", async (req, res) => {
  try {
    const { societyId } = req.params;

    // Find the society by ID
    const society = await Society.findById(societyId);

    if (!society) {
      return res.status(404).json({ msg: "Society not found" });
    }

    const membershipApplicationPeriod = {
      membershipRequestsOpenDate: society.membershipRequestsOpenDate,
      membershipRequestsCloseDate: society.membershipRequestsCloseDate,
    };

    res.json({ membershipApplicationPeriod });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
// Define a route to update the membership application period dates
societyRouter.put("/api/update_membership_application_period/:societyId", async (req, res) => {
  try {
    const { societyId } = req.params;
    const { openDate, closeDate } = req.body;

    // Find the society by ID
    const society = await Society.findById(societyId);

    if (!society) {
      return res.status(404).json({ msg: "Society not found" });
    }

    // Validate the dates
    const currentDate = new Date();

    // Check if openDate is greater than the current date
    if (openDate && new Date(openDate) <= currentDate) {
      return res.status(400).json({ msg: "Open date must be greater than the current date" });
    }

    // Check if closeDate is greater than openDate
    if (closeDate && openDate && new Date(closeDate) <= new Date(openDate)) {
      return res.status(400).json({ msg: "Close date must be greater than open date" });
    }

    // Update the membership application period dates
    if (openDate) {
      society.membershipRequestsOpenDate = openDate;
    }

    if (closeDate) {
      society.membershipRequestsCloseDate = closeDate;
    }

    // Save the updated society
    await society.save();

    res.json({ msg: "Membership application period dates updated successfully" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
societyRouter.post("/api/upload_course_image/:courseId", upload.single("image"), async (req, res) => {
  try {
    const { courseId } = req.params;
    const course = await Course.findById(courseId);

    if (!course) {
      return res.status(404).json({ msg: "Course not found" });
    }

    // Check if an image file is provided
    if (!req.file) {
      return res.status(400).json({ msg: "No image file provided" });
    }

    // Save the image data to the course
    course.image = req.file.buffer;

    await course.save();

    res.json({ msg: "Course image uploaded successfully" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

societyRouter.get("/api/get_all_courses", async (req, res) => {
  try {
    // Retrieve all courses from the Course model
    const allCourses = await Course.find();

    res.json({ courses: allCourses });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
// society_apis.js

// ... (existing imports)

// Define a route to get filtered courses
societyRouter.get("/api/get_filtered_courses", async (req, res) => {
  try {
    // Extract filtering parameters from the query string
    const { location, majors, isOnline } = req.query;

    // Build the filter object based on the provided parameters
    const filter = {};

    if (location) {
      filter.location = location;
    }

    if (majors) {
      filter.majors = { $in: majors.split(",") };
    }

    if (isOnline !== undefined) {
      filter.isOnline = isOnline === "true";
    }

    // Retrieve filtered courses from the Course model
    const filteredCourses = await Course.find(filter);

    res.json({ courses: filteredCourses });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = societyRouter;
