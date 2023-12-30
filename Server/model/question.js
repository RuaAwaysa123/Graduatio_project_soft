const mongoose = require("mongoose");

const questionSchema = mongoose.Schema({
  question: String,
  content: String,
  votes: Number,
  isVoted: Boolean,
  topics: [String],
  repliesCount: Number,
  views: Number,
  created_at: {
    type: Date,
    default: Date.now,
  },
  author: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
  },
  replies: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Reply",
    },
  ],
});

const Question = mongoose.model("Question", questionSchema);

module.exports = Question;
