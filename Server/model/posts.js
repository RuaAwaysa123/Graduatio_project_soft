const mongoose = require("mongoose");

const postSchema = new mongoose.Schema({
  question: String,
  content: String,
  votes: { type: Number, default: 0 },
  repliesCount: { type: Number, default: 0 },
  views: { type: Number, default: 0 },
  created_at: { type: Date, default: Date.now },
  topics: [String],
  author: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User', // Reference to the User model
  },
  replies: [{
    content: String,
    likes: { type: Number, default: 0 },
    author: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User', // Reference to the User model
    },
  }],
});

const Post = mongoose.model("posts", postSchema);
module.exports = Post;
