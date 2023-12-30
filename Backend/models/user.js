const mongoose=require("mongoose");
const validator=require("validator");
const bcrypt = require("bcryptjs");
const jwt= require("jsonwebtoken");
const SECRET_KEY=process.env.SECRET_KEY;

const userSchema=new mongoose.Schema({
    fname:{
        type:String,
        require:true,
        trim:true
    },
    lname:{
        type:String,
        require:true,
        trim:true
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
    password:{
        type:String,
        require:true,
        minlength:6
    },
    location:{
        type:String,
        require:true,
        trim:true
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