const mongoose = require("mongoose");

const skillSchema = new mongoose.Schema({
  skillName: {
    type: String,
    required: true,
  },
  rating: {
    type: Number,
    required: true,
  },
});

const SkillInfo = mongoose.model("SkillInfo", skillSchema);
module.exports = SkillInfo;
