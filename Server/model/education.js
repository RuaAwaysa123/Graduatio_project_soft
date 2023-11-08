//// education.js
//const mongoose = require("mongoose");
//
//const educationSchema = mongoose.Schema({
//  schoolName: String,
//  startDate: Date,
//  endDate: Date,
//});
//
//module.exports = mongoose.model("EducationInfo", educationSchema);
//
//// certificate.js
//const mongoose = require("mongoose");
//
//const certificateSchema = mongoose.Schema({
//  certificateName: String,
//  certificateURL: String,
//  issueOrganization: String,
//});
//
//module.exports = mongoose.model("CertificateInfo", certificateSchema);
//
//// skill.js
//const mongoose = require("mongoose");
//
//const skillSchema = mongoose.Schema({
//  skillName: String,
//  rating: Number,
//});
//
//module.exports = mongoose.model("SkillInfo", skillSchema);
//
//// interest.js
//const mongoose = require("mongoose");
//
//const interestSchema = mongoose.Schema({
//  title: String,
//  description: String,
//});
//
//module.exports = mongoose.model("Interest", interestSchema);



const mongoose = require("mongoose");

const educationSchema = new mongoose.Schema({
  schoolName: {
    type: String,
    required: true,
  },
  startDate: {
    type: Date,
    required: true,
  },
  endDate: {
    type: Date,
    required: true,
  },
});

const EducationInfo = mongoose.model("EducationInfo", educationSchema);
module.exports = EducationInfo;
