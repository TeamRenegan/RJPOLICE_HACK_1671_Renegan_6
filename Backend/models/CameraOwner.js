const mongoose = require('mongoose');

const cameraOwnerSchema = new mongoose.Schema({
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'users', // Reference to the 'users' model
    required: true,
    unique: true, // Ensure only one CameraOwner per user
  },
  cameras: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Camera', // Reference to the 'Camera' model
  }],
});

const CameraOwner = mongoose.model('CameraOwner', cameraOwnerSchema);

module.exports = CameraOwner;
