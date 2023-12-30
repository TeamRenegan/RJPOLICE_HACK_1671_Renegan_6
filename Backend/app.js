
<<<<<<< HEAD


=======
>>>>>>> 2900e9e1f1263426f9676d8a8176f2d21d1e4b14
const express = require('express');
const app = express();
const cors=require("cors");


// Middleware to parse JSON in requests
// app.use(express.json());
app.use(express.json());
app.use(cors());
app.use(express.urlencoded({ extended: true }));
// Routes
const signupRoutes = require('./routes/signupRoutes');
const passwordChangeRoutes = require('./routes/passwordChangeRoutes');
const loginRoutes=require('./routes/loginRoutes');
const cameraRoutes = require('./routes/cameraRoutes');
const cameraOwnerRoutes = require('./routes/cameraOwnerRoutes');
const imageRoutes = require('./routes/imageRoutes');
const videoRoutes = require('./routes/videoRoutes');

// Use defined routes
app.use('/api/signup', signupRoutes);
app.use('/api/passwordchange', passwordChangeRoutes);
app.use('/api/login',loginRoutes);
app.use('/api/cameras', cameraRoutes);
app.use('/api/cameraowners', cameraOwnerRoutes);
app.use('/api/images', imageRoutes);
app.use('/api/videos', videoRoutes);



// Export the app
module.exports = app;
