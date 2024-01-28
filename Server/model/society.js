const mongoose = require("mongoose");
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
        const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@((([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,}|(\d{1,3}\.){3}\d{1,3}(\:\d{1,5})?))$/i;
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
  events: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Event',
  }],
  location: String,
  mission: String,
  vision: String,
  course: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Course',
  }],
  recommendedTopics: [String],
  membershipRequestsOpenDate: Date,
   membershipRequestsCloseDate: Date,
  rate: {
    type: Number,
    default: 0,
  },
  image: String,
   membershipRequests: [{
      user: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
      },
      paymentAmount: Number,
      status: String,
    }],
});

const Society = mongoose.model("Society", societySchema);
module.exports = Society;