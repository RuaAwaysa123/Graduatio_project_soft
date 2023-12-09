const mongoose = require("mongoose");

const interestSchema = new mongoose.Schema({
 _id: mongoose.Schema.Types.ObjectId,
  title: {
    type: String,
    required: true,
  },
  description: {
    type: String,
    required: true,
  },
});

const Interest = mongoose.model("Interest", interestSchema);
module.exports = Interest;
