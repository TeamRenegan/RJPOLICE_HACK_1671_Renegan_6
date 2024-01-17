const mongoose = require('mongoose');

const notifyAdminSchema = new mongoose.Schema({
  
    Camera: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Camera', 
    required: true,
    
  },
  cameraOwner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'CameraOwner', 
    required: true,
  },
  message :{
    type : String ,
    default: ""
  }

});

const NotifyAdmin = mongoose.model('NotifyAdmin', notifyAdminSchema);

module.exports = NotifyAdmin;
