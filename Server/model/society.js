const mongoose = require("mongoose");
//const eventSchema = require("./model/course.js"); // Import the correct eventSchema file path

// Society Schema
const societySchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  email: {
    type: String,
    required: true,
    unique: true,
    validate: {
      validator: (value) => {
        const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
      },
      message: "Invalid email",
    },
  },
  password: {
    type: String,
    required: true,
  },
  members: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User',
    },
  ],
  followers: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User',
    },
  ],
  //events: [event], // Use the correct eventSchema
events: [{
  type: mongoose.Schema.Types.ObjectId,
  ref: 'event',
}],

  location: String,
  mission: String,
  vision: String,
//  courses: [course],
  course: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: 'course',
  }],
  //workshops: [workshopSchema],
  recommendedTopics: [String],
  joinRequestsOpenDate: Date,
  membershipRequestsOpenDate: Date,
  rate: {
    type: Number,
    default: 0,
  },
  image: Buffer
});

const Society = mongoose.model("Society", societySchema);
module.exports = Society;
