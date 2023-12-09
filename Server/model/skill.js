const mongoose = require("mongoose");

const skillSchema = new mongoose.Schema({
 _id: mongoose.Schema.Types.ObjectId,
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
