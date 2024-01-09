//const mongoose = require("mongoose");
//
//const event = new mongoose.Schema({
//  name: {
//    type: String,
//    required: true,
//  },
//  topics: [String],
//  majors: [String],
//  location: String,
//  isOnline: {
//    type: Boolean,
//    default: false,
//  },
//  dateTime: {
//    type: Date,
//    required: true,
//  },
//  price: {
//    type: Number,
//    default: 0,
//  },
//  organizers: [
//    {
//      type: mongoose.Schema.Types.ObjectId,
//      ref: 'Society',
//    },
//  ],
//  interestedStudents: [
//    {
//      type: mongoose.Schema.Types.ObjectId,
//      ref: 'User',
//    },
//  ],
//  audience: [
//    {
//      type: mongoose.Schema.Types.ObjectId,
//      ref: 'User',
//    },
//  ],
//  description: {
//    type: String,
//  },
//  image: Buffer
//});
//const event = mongoose.model("event", event);
//module.exports = event;
const mongoose = require("mongoose");

const eventSchema = new mongoose.Schema({
  // Define your event schema here
  name: String,
  topics: [String],
  majors: [String],
  location: String,
  isOnline: Boolean,
  dateTime: Date,
  price: Number,
  organizers: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'Society',
    },
  ],
  description: String,
});

const Event = mongoose.model("Event", eventSchema);

module.exports = Event;
