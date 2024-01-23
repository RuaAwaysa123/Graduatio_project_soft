const mongoose = require("mongoose");
// Course center Schema
const courseCenter = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  phoneNum: {
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
  AboutUs: String,
//  courses: [course],
  course: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: 'course',
  }],
  //workshops: [workshopSchema],
  recommendedTopics: [String],

  rate: {
    type: Number,
    default: 0,
  },
  image: Buffer,

});

const CourseCenter = mongoose.model("CourseCenter", courseCenter);
module.exports = CourseCenter;

