//const mongoose = require("mongoose");
//
//const eventSchema = new mongoose.Schema({
//  name: String,
//  topics: [String],
//  majors: [String],
//  location: String,
//  isOnline: Boolean,
//  dateTime: Date,
//  price: Number,
//  organizers: [
//    {
//      type: mongoose.Schema.Types.ObjectId,
//      ref: 'Society',
//    },
//  ],
//  description: String,
//  image: {
//    data: Buffer,  // Buffer to store the image data
//    contentType: String,  // MIME type of the image
//  },
//});
//
//const Event = mongoose.model("Event", eventSchema);
//
//module.exports = Event;
const mongoose = require("mongoose");
const eventSchema = new mongoose.Schema({
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
  image: {
    data: Buffer,
    contentType: String,
  },
});

const Event = mongoose.model("Event", eventSchema);
module.exports = Event;
