
const mongoose = require("mongoose");

const educationSchema = new mongoose.Schema({

_id: mongoose.Schema.Types.ObjectId,

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
