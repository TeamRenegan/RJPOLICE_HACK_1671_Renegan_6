const mongoose = require('mongoose');
const moment = require('moment');

const IncidentImageSchema = new mongoose.Schema({
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
  imgUrl: { type: String, required: true },
  desc: { type: String, required: true, default: "" }
});

const IncidentImage = mongoose.model('IncidentImage', IncidentImageSchema);

module.exports = IncidentImage;
