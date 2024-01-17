const mongoose = require('mongoose');
const moment = require('moment');

const cameraSchema = new mongoose.Schema({
  cameraId: { type: String, required: true },
  resolution: { type: String, required: true },
  frameRate: { type: Number, required: true },
  visibilityRange: { type: String, required: true },
  location: {
    latitude: { type: Number, required: true },
    longitude: { type: Number, required: true },
  },
  model: { type: String, required: true },
  isVerified: { type: Boolean, default: false },
  isApproved: { type: Boolean, default: false },

  approvedBy: { type: String, default: "" },
  verifyDate: { type: String, default: moment().format('YYYY-MM-DD HH:mm:ss') },
  ipAddress: { type: String, required: true },

  rtspUrl: { type: String, default: "" },
  camimg: { type: String, default: "" },
  recimg: { type: String, default: "" },

  cameraOwner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'CameraOwner', // Ensure reference to the correct model if used
    required: true,
  },
});

const Camera = mongoose.model('Camera', cameraSchema);

module.exports = Camera;
