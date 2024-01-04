const express = require("express");
const app = express();

const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
const User = require("../model/user");
const EducationInfo = require("../model/education");
const CertificateInfo = require("../model/certificate");
const SkillInfo = require("../model/skill");
const Interest = require("../model/interest");
//const authRouter = require("./routes/app");
const mongoose = require("mongoose");
const Post = require("../model/posts");
const authRouter = express.Router();
const multer = require('multer');
const upload = multer({ dest: 'uploads/' }); // Adjust the destination folder as needed

// Import necessary modules
const path = require('path');

// ...

// Set up multer storage
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads/profile'); // Set the destination folder for profile pictures
  },
  filename: function (req, file, cb) {
    const ext = path.extname(file.originalname);
    cb(null, 'profile-' + Date.now() + ext); // Set the filename (you can customize this)
  },
});

// Create multer middleware
const profilePictureUpload = multer({ storage: storage });

// ...

// Add a new API endpoint for uploading profile picture
authRouter.post("/api/uploadProfilePicture/:userId", upload.single('profilePicture'), async (req, res) => {
  try {
    const userId = req.params.userId;
    const user = await User.findById(userId);

    if (!user) {
      return res.status(404).json({ msg: `User not found with ID: ${userId}` });
    }

    // Check if a file was provided in the request
    if (!req.file) {
      return res.status(400).json({ msg: 'No file uploaded' });
    }

    // Update user's profile picture information
    user.imgUrl = req.file.path; // Assuming you want to store the file path

    // Save the updated user
    const updatedUser = await user.save();

    res.json(updatedUser);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

const cors = require("cors");
app.use(cors());


authRouter.post("/api/signup", async (req, res) => {
  try {
    const { fullName, email, password } = req.body;

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with same email already exists!" });
    }

    const hashedPassword = await bcryptjs.hash(password, 8);

    let user = new User({
      email,
      password: hashedPassword,
      fullName,
    });
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//regestration page 2
authRouter.post("/api/signup_continue", async (req, res) => {
  try {
    const {
      email,
//      password,
      phoneNumber,
      location,
      universityNumber,
      major,
      year,
    } = req.body;

    // Check if the user already exists
    const existingUser = await User.findOne({ email });

    if (!existingUser) {
      return res.status(400).json({ msg: "User with this email does not exist. Please sign up first!" });
    }

    // Update user information
    existingUser.phoneNumber = phoneNumber;
//    existingUser.firstName = firstName;
//    existingUser.lastName = lastName;
    existingUser.location = location;
    existingUser.universityNumber = universityNumber;
    existingUser.major = major;
    existingUser.year = year;
    existingUser.UserType = "1";
    existingUser.imgUrl = "assets/images/default-user-icon-8.jpg";
    existingUser.about = "New user" ;

    // Save the updated user
    await existingUser.save();

    res.json(existingUser);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Update the login route for a student
authRouter.post("/api/login", async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email });

    if (!user) {
      return res.status(400).json({ msg: "User with this email doesn't exist. Please sign up first!" });
    }

    const isMatch = await bcryptjs.compare(password, user.password);

    if (!isMatch) {
      return res.status(400).json({ msg: "Incorrect password." });
    }

    const token = jwt.sign({ id: user._id }, "your-secret-key");

    res.json({ token, userId: user._id }); // Include the user ID in the response
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Add Education Information route
authRouter.post("/api/addEducation", async (req, res) => {
  try {
    const { userId, schoolName, startDate, endDate } = req.body;
    const user = await User.findById(userId);

    if (!user) {
      return res.status(404).json({ msg: `User not found with ID: ${userId}` });
    }

    const education = new EducationInfo({ schoolName, startDate, endDate });
    user.education.push(education);

    // Save the updated user
    await user.save();

    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Add Certificate Information route
authRouter.post("/api/addCertificate", async (req, res) => {
  try {
    const { userId, certificateName, certificateURL, issueOrganization } = req.body;
    const user = await User.findById(userId);

    if (!user) {
      return res.status(404).json({ msg: `User not found with ID: ${userId}` });
    }

    const certificate = new CertificateInfo({ certificateName, certificateURL, issueOrganization });
    user.certificates.push(certificate);

    // Save the updated user
    await user.save();

    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Add Skill Information route
authRouter.post("/api/addSkill", async (req, res) => {
  try {
    const { userId, skillName, rating } = req.body;
    const user = await User.findById(userId);

    if (!user) {
      return res.status(404).json({ msg: `User not found with ID: ${userId}` });
    }

    const skill = new SkillInfo({ skillName, rating });
    user.skills.push(skill);

    // Save the updated user
    await user.save();

    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});



authRouter.post("/api/addInterest", async (req, res) => {
  try {
    const { userId, title, description } = req.body;

    // Convert userId to ObjectId
    const userIdObjectId = mongoose.Types.ObjectId.createFromHexString(userId);

    const user = await User.findById(userIdObjectId);

    if (!user) {
      return res.status(404).json({ msg: `User not found with ID: ${userId}` });
    }

    const interest = new Interest({ title, description });

    user.interests.push(interest);

    // Save the updated user
    const updatedUser = await user.save();

    res.json(updatedUser);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


// Add this route to authRouter in index.js
authRouter.get("/api/user/:userId", async (req, res) => {
  try {
    const userId = req.params.userId;
    const user = await User.findById(userId);

    if (!user) {
      return res.status(404).json({ msg: `User not found with ID: ${userId}` });
    }

    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


// Add this route to authRouter in index.js

// Get Education Information for a specific student
authRouter.get("/api/getEducation/:userId", async (req, res) => {
  try {
    const userId = req.params.userId;
    const user = await User.findById(userId);

    if (!user) {
      return res.status(404).json({ msg: `User not found with ID: ${userId}` });
    }

    const educationInfo = user.education;
    res.json(educationInfo);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Get Certificate Information for a specific student
authRouter.get("/api/getCertificates/:userId", async (req, res) => {
  try {
    const userId = req.params.userId;
    const user = await User.findById(userId);

    if (!user) {
      return res.status(404).json({ msg: `User not found with ID: ${userId}` });
    }

    const certificateInfo = user.certificates;
    res.json(certificateInfo);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Get Interest Information for a specific student
authRouter.get("/api/getInterests/:userId", async (req, res) => {
  try {
    const userId = req.params.userId;
    const user = await User.findById(userId);

    if (!user) {
      return res.status(404).json({ msg: `User not found with ID: ${userId}` });
    }

    const interestInfo = user.interests;
    res.json(interestInfo);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Get Skill Information for a specific student
authRouter.get("/api/getSkills/:userId", async (req, res) => {
  try {
    const userId = req.params.userId;
    const user = await User.findById(userId);

    if (!user) {
      return res.status(404).json({ msg: `User not found with ID: ${userId}` });
    }

    const skillInfo = user.skills;
    res.json(skillInfo);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Add this route to authRouter in index.js

// Update About Information for a specific user
authRouter.put("/api/updateAbout/:userId", async (req, res) => {
  try {
    const userId = req.params.userId;
    const { about } = req.body;

    // Check if the user exists
    const user = await User.findById(userId);

    if (!user) {
      return res.status(404).json({ msg: `User not found with ID: ${userId}` });
    }

    // Update the about field
    user.about = about;

    // Save the updated user
    const updatedUser = await user.save();

    res.json(updatedUser);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//Update certificate
authRouter.put("/api/updateCertificate/:userId/:certificateId", async (req, res) => {
  try {
    const { userId, certificateId } = req.params;
    const { certificateName, certificateURL, issueOrganization } = req.body;

    const user = await User.findById(userId);

    if (!user) {
      return res.status(404).json({ msg: `User not found with ID: ${userId}` });
    }

    const certificateIndex = user.certificates.findIndex(cert => cert._id == certificateId);

    if (certificateIndex === -1) {
      return res.status(404).json({ msg: `Certificate not found with ID: ${certificateId}` });
    }

    const certificate = user.certificates[certificateIndex];
    certificate.certificateName = certificateName;
    certificate.certificateURL = certificateURL;
    certificate.issueOrganization = issueOrganization;

    await user.save();

    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//Delete Certificate:
authRouter.delete("/api/deleteCertificate/:userId/:certificateId", async (req, res) => {
  try {
    const { userId, certificateId } = req.params;

    const user = await User.findById(userId);

    if (!user) {
      return res.status(404).json({ msg: `User not found with ID: ${userId}` });
    }

    user.certificates = user.certificates.filter(cert => cert._id != certificateId);

    await user.save();

    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Update skill
authRouter.put("/api/updateSkill/:userId/:skillId", async (req, res) => {
  try {
    const { userId, skillId } = req.params;
    const { skillName, rating } = req.body;

    const user = await User.findById(userId);

    if (!user) {
      return res.status(404).json({ msg: `User not found with ID: ${userId}` });
    }

    const skillIndex = user.skills.findIndex(skill => skill._id == skillId);

    if (skillIndex === -1) {
      return res.status(404).json({ msg: `Skill not found with ID: ${skillId}` });
    }

    const skill = user.skills[skillIndex];
    skill.skillName = skillName;
    skill.rating = rating;

    await user.save();

    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//Delete Skill
authRouter.delete("/api/deleteSkill/:userId/:skillId", async (req, res) => {
  try {
    const { userId, skillId } = req.params;

    const user = await User.findById(userId);

    if (!user) {
      return res.status(404).json({ msg: `User not found with ID: ${userId}` });
    }

    user.skills = user.skills.filter(skill => skill._id != skillId);

    await user.save();

    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Update Interest
authRouter.put("/api/updateInterest/:userId/:interestId", async (req, res) => {
  try {
    const { userId, interestId } = req.params;
    const { title, description } = req.body;

    const user = await User.findById(userId);

    if (!user) {
      return res.status(404).json({ msg: `User not found with ID: ${userId}` });
    }

    const interestIndex = user.interests.findIndex(interest => interest._id == interestId);

    if (interestIndex === -1) {
      return res.status(404).json({ msg: `Interest not found with ID: ${interestId}` });
    }

    const interest = user.interests[interestIndex];
    interest.title = title;
    interest.description = description;

    await user.save();

    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
//Delete Interest Api
authRouter.delete("/api/deleteInterest/:userId/:interestId", async (req, res) => {
  try {
    const { userId, interestId } = req.params;

    const user = await User.findById(userId);

    if (!user) {
      return res.status(404).json({ msg: `User not found with ID: ${userId}` });
    }

    user.interests = user.interests.filter(interest => interest._id != interestId);

    await user.save();

    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//Update Education
authRouter.put("/api/updateEducation/:userId/:educationId", async (req, res) => {
  try {
    const { userId, educationId } = req.params;
    const { schoolName, startDate, endDate } = req.body;

    const user = await User.findById(userId);

    if (!user) {
      return res.status(404).json({ msg: `User not found with ID: ${userId}` });
    }

    const educationIndex = user.education.findIndex(edu => edu._id == educationId);

    if (educationIndex === -1) {
      return res.status(404).json({ msg: `Education not found with ID: ${educationId}` });
    }

    const education = user.education[educationIndex];
    education.schoolName = schoolName;
    education.startDate = startDate;
    education.endDate = endDate;

    await user.save();

    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
// Delete Education
authRouter.delete("/api/deleteEducation/:userId/:educationId", async (req, res) => {
  try {
    const { userId, educationId } = req.params;

    const user = await User.findById(userId);

    if (!user) {
      return res.status(404).json({ msg: `User not found with ID: ${userId}` });
    }

    user.education = user.education.filter(edu => edu._id != educationId);

    await user.save();

    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
authRouter.post("/api/createPost/:userId", async (req, res) => {
  try {
    const userId = req.params.userId;
    const user = await User.findById(userId);

    if (!user) {
      return res.status(404).json({ msg: `User not found with ID: ${userId}` });
    }

    const { question, content, topics } = req.body;

    const post = new Post({
      question,
      content,
      topics,
      author: user._id,
    });

    await post.save();

    // Associate the post with the user
    user.posts.push(post._id);
    await user.save();

    res.json(post);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Get all posts for a specific user
authRouter.get("/api/getUserPosts/:userId", async (req, res) => {
  try {
    const userId = req.params.userId;
    const user = await User.findById(userId).populate('posts');

    if (!user) {
      return res.status(404).json({ msg: `User not found with ID: ${userId}` });
    }

    res.json(user.posts);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Delete a post
authRouter.delete("/api/deletePost/:postId", async (req, res) => {
  try {
    const postId = req.params.postId;

    // Remove post reference from the user
    await User.updateOne({ posts: postId }, { $pull: { posts: postId } });

    // Delete the post
    await Post.findByIdAndDelete(postId);

    res.json({ msg: "Post deleted successfully" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


module.exports = authRouter;
