const mongoose = require('mongoose');

const imageSchema = new mongoose.Schema({
    dateTime: { type: Date, required: true },
    cameraId: { type: String, required: true },
    locationData: {
      latitude: { type: Number, required: true },
      longitude: { type: Number, required: true }
    },
    resolution: { type: String, required: true },
    format: { type: String, required: true },
    fileSize: { type: Number, required: true },
    imgUrl: { type: String, required: true }
  });

const Image = mongoose.model('Image', imageSchema);

module.exports = Image;
