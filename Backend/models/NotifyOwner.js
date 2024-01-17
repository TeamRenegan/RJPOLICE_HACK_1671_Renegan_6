const mongoose = require('mongoose');

const notifyOwnerSchema = new mongoose.Schema({
  
    Camera: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Camera', 
    required: true,
    
  },
  message :{
    type : String ,
    default: ""
  }

});

const NotifyOwner = mongoose.model('NotifyOwner', notifyOwnerSchema);

module.exports = NotifyOwner;
