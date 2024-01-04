//const mongoose = require("mongoose");
//
//const courseSchema = new mongoose.Schema({
//  name: String,
//  description: String,
//  instructor: String,
//});
//const Post = mongoose.model("posts", postSchema);
//module.exports = Post;

const mongoose = require("mongoose");

const course = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  topics: [String],
  prequests: {
    type: Number,
    default: 0,
  },
  majors: [String],
  location: String,
  isOnline: {
    type: Boolean,
    default: false,
  },
  startDate: {
    type: Date,
    required: true,
  },
  endDate: {
    type: Date,
    required: true,
  },
  time: String,
  credential: String,
  price: {
    type: Number,
    default: 0,
  },
  trainer: String,
  description: String,
  applicants: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User',
    },
  ],
  acceptedApplicants: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User',
    },
  ],
  rejectedApplicants: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User',
    },
  ],
  rate: {
    type: Number,
    default: 0,
  },
  isSociety: {
    type: Boolean,
    default: false,
  },
  image: Buffer
});
const course = mongoose.model("course", course);
module.exports = course;
