const mongoose = require('mongoose');
const validator=require("validator");

const cameraOwnerSchema = new mongoose.Schema({
  name:{
    type: String,
    require:true,
    trim:true
},
  address:{
    type: String,
    require:true
},
  email:{
    type: String,
    require:true,
    unique:true
    // ,
    // validate(value){
    //     if(!validator.isEmail(value)){
    //         throw new Error("Not valid Email ")
    //     }
    // }
},
  contactNo:{
    type: String,
    require:true
    // ,
    // validate(value){
    //     if(!validator.isMobilePhone(value,'any')){
    //         throw new Error("Not valid Contact No")
    //     }
    // }
},
});

const CameraOwner = mongoose.model('CameraOwner', cameraOwnerSchema);

module.exports = CameraOwner;
