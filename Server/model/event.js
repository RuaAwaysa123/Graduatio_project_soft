const mongoose = require("mongoose");

const event = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  topics: [String],
  majors: [String],
  location: String,
  isOnline: {
    type: Boolean,
    default: false,
  },
  dateTime: {
    type: Date,
    required: true,
  },
  price: {
    type: Number,
    default: 0,
  },
  organizers: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'Society',
    },
  ],
  interestedStudents: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User',
    },
  ],
  audience: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User',
    },
  ],
  description: {
    type: String,
  },
  image: Buffer
});
//const eventSchema = mongoose.model("eventSchema", eventSchema);
module.exports = event;
