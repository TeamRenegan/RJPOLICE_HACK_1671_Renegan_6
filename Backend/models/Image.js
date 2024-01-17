const mongoose = require('mongoose');
const moment = require('moment');

const imageSchema = new mongoose.Schema({
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
  imgUrl: { type: String, required: true }
});

const Image = mongoose.model('Image', imageSchema);

module.exports = Image;
