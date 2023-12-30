
const mongoose = require('mongoose');

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
  approvedBy: { type: String, required: true },
  approvalDate: { type: Date, required: true },
  ipAddress: { type: String, required: true },
  cameraOwner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'CameraOwner', // Ensure reference to the correct model if used
    required: true,
  },
});

const Camera = mongoose.model('Camera', cameraSchema);

module.exports = Camera;
