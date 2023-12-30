const mongoose = require('mongoose');

const videoSchema = new mongoose.Schema({
    dateTime: { type: Date, required: true },
    cameraId: { type: String, required: true },
    locationData: {
      latitude: { type: Number, required: true },
      longitude: { type: Number, required: true }
    },
    resolution: { type: String, required: true },
    format: { type: String, required: true },
    fileSize: { type: Number, required: true },
    duration: { type: Number, required: true },
    frameRate: { type: Number, required: true },
    videoUrl: { type: String, required: true }
  });

const Video = mongoose.model('Video', videoSchema);

module.exports = Video;
