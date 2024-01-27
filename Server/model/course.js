const mongoose = require("mongoose");
const course = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  topics: [String],
  prequests:[String],
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
//  price: {
//    type: Number,
//    default: 0,
//  },
  trainer: String,
  description: String,
  applicants: [
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
//  rate: {
//    type: Number,
//    default: 0.0,
//  },
  isSociety: {
    type: Boolean,
    default: false,
  },

  organization:
      {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Society',
      },
       sessions: [
          {
            sessionDate: {
              type: Date,
              required: true,
            },
            attendance: [
              {
                userId: {
                  type: mongoose.Schema.Types.ObjectId,
                  ref: 'User',
                },
                attended: {
                  type: Boolean,
                  default: false,
                },
              },
            ],
          },
        ],

        ratings: [
          {
            societyId: {
              type: mongoose.Schema.Types.ObjectId,
              ref: 'Society',
            },
            rating: {
              type: Number,
              default: 0,
            },
          },
        ],
         startTime: {
            type: String,
            required: true,
          },
          endTime: {
            type: String,
            required: true,
          },
          days: [String],

// image: Buffer,
image: String,
 maxnumofstudent :Number
});
const Course = mongoose.model("Course", course);
module.exports = Course;