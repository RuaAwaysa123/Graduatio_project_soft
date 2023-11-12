//////Creating an instance of the Express application:
////const express = require("express");//The Express framework for creating the server.
////const User = require("../model/user");
////const bcryptjs = require("bcryptjs"); // Import bcryptjs
////const authRouter = express.Router();
////
////// sign up routes
////authRouter.post("/api/signup" ,async(req , res ) => {
////try{
////const {name , email , password} = req.body;
////const existingUser = await User.findOne({ email });
////
////if (existingUser) {
////    return res
////      .status(400)
////      .json({ msg: "User with this email is already exist!" });
////  }
//////   const hashedPassword = await bcryptjs.hashedPassword(password)
////  const hashedPassword = await bcryptjs.hash(password , 8);
////let user = new User ({
////email ,
////password :hashedPassword ,
////name  ,
////});
////user = await user.save();
////// we save it and the mongoDB add to it Id and number show how many time this user has been updated
////res.json(user);
////
//// } catch(e){
////res.status(500).json({error : e.message}) ;
////}
////});
////
////module.exports = authRouter ;
//const express = require("express");
//const bcryptjs = require("bcryptjs"); // Import bcryptjs
//const User = require("../model/user");
//const jwt = require("jsonwebtoken");
//
//const authRouter = express.Router();
//
//// sign up routes
//authRouter.post("/api/signup", async (req, res) => {
//  try {
//    const { name, email, password } = req.body;
//    const existingUser = await User.findOne({ email });
//
//    if (existingUser) {
//      return res
//        .status(400)
//        .json({ msg: "User with this email already exists!" });
//    }
//
//    const hashedPassword = await bcryptjs.hash(password, 8); // Use bcryptjs
//    let user = new User({
//      email,
//      password: hashedPassword,
//      name,
//    });
//    user = await user.save();
//    res.json(user);
//  } catch (e) {
//    res.status(500).json({ error: e.message });
//  }
//});
////-----------------------------------------------------------------------------------------
//// signin (login) routes
//authRouter.post("/api/Login", async (req, res) => {
//  try {
//    const {email, password } = req.body;
//   const user = await User.findOne({ email });
//
//    if (!user) {
//      return res
//        .status(400)
//        .json({ msg: "User with this email doesn't  exists signup first!" });
//    }
//
////    const hashedPassword = await bcryptjs.hash(password, 8); // Use bcryptjs
//    const isMatch = await bcryptjs.compare(password , user.password);
//    if (!isMatch) {
//        return res.status(400).json({ msg: "Incorrect password." });
//      }
//      const token = jwt.sign({ id: user._id }, "passwordKey");
//         res.json({ token, ...user._doc });
//
//  } catch (e) {
//    res.status(500).json({ error: e.message });
//  }
//});
//
//
//
//module.exports = authRouter;
//
//

// Import required modules and models
// Import required modules and models
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

const authRouter = express.Router();
const cors = require("cors");
app.use(cors());

// Sign up (register) route for a student
authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password, about, location, phoneNumber, major, university } = req.body;
    const existingUser = await User.findOne({ email });

    if (existingUser) {
      return res.status(400).json({ msg: "User with this email already exists!" });
    }

    const hashedPassword = await bcryptjs.hash(password, 8);

    const user = new User({

      email,
      password: hashedPassword,

    });

    // Save the user
    await user.save();

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
      password,
      phoneNumber,
      firstName,
      lastName,
      location,
      universityNumber,
      major,
      year,
    } = req.body;

    const existingUser = await User.findOne({ email });

    if (!existingUser) {
      return res.status(400).json({ msg: "User with this email Dosn't exisit " });
    }

    const hashedPassword = await bcryptjs.hash(password, 8);

    const user = new User({
      email,
      password: hashedPassword,
      phoneNumber,
      firstName,
      lastName,
      location,
      universityNumber,
      major,
      year,
    });

    // Save the user
    await user.save();

    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});




// Sign in (login) route for a student
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

    res.json({ token, user: { name: user.name, email: user.email } });
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
module.exports = authRouter;
