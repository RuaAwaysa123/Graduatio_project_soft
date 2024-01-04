const mongoose = require("mongoose");


const userSchema = mongoose.Schema({

  email: {
    required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
      },
      message: "Invalid email",
    },
  },
  password: {
    required: true,
    type: String,
  },
   fullName: {
    type: String,
   },

//   firstName: {
//      type: String,
//    },
//    lastName: {
//      type: String,
//    },
  phoneNumber: {
    type: String, // You can choose to store it as a string
  },
  major: {
    type: String,
  },
  university: {
    type: String,
  },
 about: {
    type: String,
  },

  location: {
      type: String,
    },

     universityNumber: {
        type: String,
      },


  interests: [
    {
// _intid: mongoose.Schema.Types.ObjectId,
      title: String,
      description: String,
    },
  ],
  certificates: [
    {
     //_cerid: mongoose.Schema.Types.ObjectId,
      certificateName: String,
      certificateURL: String,
      issueOrganization: String,
    },
  ],
  skills: [
    {
      skillName: String,
      rating: Number,
    },
  ],
  education: [
      {
        // _eduid: mongoose.Schema.Types.ObjectId,
        schoolName: String,
        startDate: Date,
        endDate: Date,
      },
    ],


 imgUrl: {
     type: String,
 },

 UserType : {
                type: String,
            },
posts: [{
  type: mongoose.Schema.Types.ObjectId,
  ref: 'Post',
}],
});

const User = mongoose.model("User", userSchema);
module.exports = User;
