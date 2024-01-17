const mongoose=require("mongoose");
const validator=require("validator");
const bcrypt = require("bcryptjs");
const jwt= require("jsonwebtoken");
const SECRET_KEY=process.env.SECRET_KEY;

const userSchema=new mongoose.Schema({
    name:{
        type:String,
        require:true,
        trim:true
    },
    email:{
        type: String,
        require:true,
        unique:true
    },
    contactNo: {
        type: String,
        require: true
      },
    password:{
        type:String,
        require:true,
        minlength:6
    },
    role:{
        type:String,
        require:true,
        default:""
    },
    location: {
        latitude: { type: Number, required: true },
        longitude: { type: Number, required: true },
      },
    tokens:[
        {
            token:
            { 
                type:String,
                require:true,
            }
        }
    ]

});

userSchema.pre("save",async function (next){
    if(this.isModified("password")){
        this.password=await bcrypt.hash(this.password,12);
    }
    next();
});

userSchema.methods.generateAuthtoken = async function(){
    try {

        let newtoken = jwt.sign({_id:this._id},SECRET_KEY,{expiresIn:'1d'});

        this.tokens=this.tokens.concat({token:newtoken});
        await this.save();
        return newtoken;
        
    } catch (error) {
        res.status(400).json(error);
    }
}
const users=new mongoose.model("users",userSchema);


module.exports=users;