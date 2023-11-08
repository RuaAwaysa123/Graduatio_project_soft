const mongoose = require("mongoose");

const certificateSchema = new mongoose.Schema({
  certificateName: {
    type: String,
    required: true,
  },
  certificateURL: {
    type: String,
    required: true,
  },
  issueOrganization: {
    type: String,
    required: true,
  },
});

const CertificateInfo = mongoose.model("CertificateInfo", certificateSchema);
module.exports = CertificateInfo;
