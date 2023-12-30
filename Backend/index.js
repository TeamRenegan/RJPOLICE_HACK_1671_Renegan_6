

require('dotenv').config(); 

const  connectDB  = require('./db/connection'); 


const app = require('./app');
const PORT = process.env.PORT || 3000;

<<<<<<< HEAD
=======

>>>>>>> 2900e9e1f1263426f9676d8a8176f2d21d1e4b14

connectDB().then(()=>{
  app.listen(PORT,()=>{
    console.log(`Server Running on ${PORT} port and connected to Database`);
  });
}).catch(err=>console.log(err));
