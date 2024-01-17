const mongoose = require('mongoose');

const verifyStatusSchema = new mongoose.Schema({
  
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
  isApproved:{

    type: Boolean, required : true  
  },
  message :{

    type : String ,
    default: ""
  }

});

const verifyStatus = mongoose.model('verifyStatus', verifyStatusSchema);

module.exports = verifyStatus;
