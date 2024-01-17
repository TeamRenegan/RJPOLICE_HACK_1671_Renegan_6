const mongoose = require('mongoose');
const moment = require('moment');

const IncidentVideoSchema = new mongoose.Schema({
  dateTime: {
    type: String,
    required: true,
    default: () => moment().format('YYYY-MM-DD HH:mm:ss'),
  },
  cameraId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Camera', 
    required: true,
  },
  duration: { type: Number, required: true },
  videoUrl: { type: String, required: true },
  desc: { type: String, required: true, default: "" } 
});

const Video = mongoose.model('IncidentVideo', IncidentVideoSchema);

module.exports = Video;
