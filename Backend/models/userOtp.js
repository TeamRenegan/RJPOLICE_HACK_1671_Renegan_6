const mongoose=require("mongoose");
const validator=require("validator");


const userOtpSchma=new mongoose.Schema({
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
    otp:{
        type:String,
        reuire:true
    }
});

const userotp=new mongoose.model("userotps",userOtpSchma);

module.exports = userotp;
