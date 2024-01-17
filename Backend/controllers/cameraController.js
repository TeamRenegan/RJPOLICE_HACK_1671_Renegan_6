const Camera = require('../models/Camera.js');
const { addImage } = require("../utils/awsS3upload");
const CameraOwner=require('../models/CameraOwner.js');


const {sendVerificationEmail}=require('../utils/email.js');

// Get all cameras
const getCameras = async (req, res) => {
  try {
    const cameras = await Camera.find().populate('cameraOwner');
    res.status(200).json(cameras);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Get Camera by cameraId 
const getCamerabycameraId=async (req,res) =>{
  try {
    const camera = await Camera.findOne({ cameraId: req.params.cameraId }).populate('cameraOwner');
    if (!camera) {
      return res.status(404).json({ message: 'Camera not found' });
    }
    res.status(200).json(camera);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};


// Get camera by ID (mongo db default )
const getCameraById = async (req, res) => {
  try {
    console.log(req.params.id);
    const camera = await Camera.findById(req.params.id).populate('cameraOwner');
    if (!camera) {
      return res.status(404).json({ message: 'Camera not found' });
    }
    res.status(200).json(camera);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// get camera according to the verification date
const getCamerabyVerifyDate = async (req,res) =>{
  try {
    const camera = await Camera.findOne({ verifyDate: req.params.verifyDate }).populate('cameraOwner');
    if (!camera) {
      return res.status(404).json({ message: 'Camera not found' });
    }
    res.status(200).json(camera);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

const getApprovedVerifiedCameras = async (req, res) => {
  try {
    // Find cameras where both isApproved and isVerified are true
    const cameras = await Camera.find({ isApproved: true, isVerified: true }).populate('cameraOwner');

    res.status(200).json({ cameras });
  } catch (error) {
    console.error('Error getting cameras:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

const getRejectedVerifiedCameras = async (req, res) => {
  try {
    // Find cameras where both isApproved and isVerified are true
    const cameras = await Camera.find({ isApproved: false, isVerified: true }).populate('cameraOwner');

    res.status(200).json({ cameras });
  } catch (error) {
    console.error('Error getting cameras:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

const getNotVerifiedCameras = async (req, res) => {
  try {
    // Find cameras where both isApproved and isVerified are true
    const cameras = await Camera.find({  isVerified: false }).populate('cameraOwner');

    res.status(200).json({ cameras });
  } catch (error) {
    console.error('Error getting cameras:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

//===========================================
// Create a new camera
const createCamera = async (req, res) => {

  console.log(req)
  
  try {
    // const {
    //   cameraId, resolution, frameRate, visibilityRange, location,
    //   model, approvedBy, verifyDate, ipAddress, rtspUrl, cameraOwner,
    // } = req.body;

    const {
      cameraId, resolution, frameRate, visibilityRange, location,
      model,  ipAddress, rtspUrl, cameraOwner,
    } = req.body;
    console.log(req.files);
    // Access files from req.files object
    const camreq = req.files[0];
    const recreq = req.files[1];

    let camlink , reclink=null;
    
    if (camreq) {
        console.log("Cam img exists");
        if (camreq.size > 5 * 1024 * 1024) {
          return res
            .status(400)
            .send({ message: "File size too large, max 5MB allowed" });
        }
    
        camlink = await addImage(camreq);
        console.log("camlink returned ",camlink);
      }
      //camera img link
      let camimg = camlink ;
        
      if (recreq) {
        console.log("Rec img exists");
        if (recreq.size > 5 * 1024 * 1024) {
          return res
            .status(400)
            .send({ message: "File size too large, max 5MB allowed" });
        }
    
        reclink = await addImage(recreq);
        console.log("reclink returned ",reclink);
      }
      //receipt img link
     let recimg = reclink ;

    const newCamera = new Camera({
      cameraId, resolution, frameRate, visibilityRange, location,
      model,  ipAddress, rtspUrl,camimg,recimg, cameraOwner
      
    });

    const savedCamera = await newCamera.save();
    

    // const toEmail = 'teamrenegan@gmail.com';
    // const subject = 'New Camera Registration - Verification Required';
    // const camOwnobj =await CameraOwner.findById(req.cameraOwner).populate('user');
    
    // sendVerificationEmail(toEmail, subject, cameraId, camOwnobj.user.name, "Verification Needed ", "");


    res.status(201).json(savedCamera);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};




//===========================================

const approveCamera = async (req, res) => {
  try {
    const { appr_person } = req.body;
    const filter = { isApproved: false, isVerified: false };
    
    const updateDocument = {
      $set: {
        approvedBy: appr_person,
        verifyDate: moment().format('YYYY-MM-DD HH:mm:ss'),
      },
    };

    const updatedCamera = await Camera.updateMany(filter, updateDocument);
    res.status(200).json(updatedCamera);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};


// Update camera by ID
const updateCamera = async (req, res) => {
  try {
    const updatedCamera = await Camera.findByIdAndUpdate(
      req.params.id,
      req.body,
      { new: true }
    );
    res.status(200).json(updatedCamera);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Delete camera by ID
const deleteCamera = async (req, res) => {
  try {
    await Camera.findByIdAndDelete(req.params.id);
    res.status(200).json({ message: 'Camera deleted' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

module.exports = {
  getCameras,
  getCamerabycameraId,
  getCameraById,
  getCamerabyVerifyDate,
  getApprovedVerifiedCameras,
  getRejectedVerifiedCameras,
  getNotVerifiedCameras,
  createCamera,
  updateCamera,
  deleteCamera,
  approveCamera
};
