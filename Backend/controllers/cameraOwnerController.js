const CameraOwner = require('../models/CameraOwner');


// Get all camera owners
const getCameraOwners = async (req, res) => {
  try {
    const cameraOwners = await CameraOwner.find().populate('user').populate('cameras');
    res.status(200).json(cameraOwners);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Get camera owner by ID
const getCameraOwnerById = async (req, res) => {
  try {
    const cameraOwner = await CameraOwner.findById(req.params.id).populate('user').populate('cameras');
    if (!cameraOwner) {
      return res.status(404).json({ message: 'Camera owner not found' });
    }
    res.status(200).json(cameraOwner);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// get cameraowner by cameraId 
const getCameraOwnerByCameraId = async (req, res) => {
  try {
    const cameraOwner = await CameraOwner.findOne({ cameras: req.params.cameraId })
      .populate('user') // Populate the 'user' field if needed
      .populate('cameras'); // Populate the 'cameras' array if needed

    if (!cameraOwner) {
      return res.status(404).json({ message: 'Camera owner not found for the specified Camera ID' });
    }

    res.status(200).json(cameraOwner);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};


// Create a new camera owner
const createCameraOwner = async (req, res) => {
  const { user, cameras } = req.body;
 

  try {

    if (!user || !cameras) {
      return res.status(400).json({ message: 'Both user and cameras are required fields' });
    }

    const newCameraOwner = new CameraOwner({
      user,
      cameras,
    });

    const savedCameraOwner = await newCameraOwner.save();
    res.status(201).json(savedCameraOwner);
  } catch (error) {

    if (error.name === 'ValidationError') {
      return res.status(400).json({ message: error.message });
    }

    res.status(400).json({ message: error.message });
  }
};


// Update camera owner by ID
const updateCameraOwner = async (req, res) => {
  try {
    const updatedCameraOwner = await CameraOwner.findByIdAndUpdate(
      req.params.id,
      req.body,
      { new: true }
    );
    res.status(200).json(updatedCameraOwner);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Delete camera owner by ID
const deleteCameraOwner = async (req, res) => {
  try {
    await CameraOwner.findByIdAndDelete(req.params.id);
    res.status(200).json({ message: 'Camera owner deleted' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

module.exports = {
  getCameraOwners,
  getCameraOwnerById,
  getCameraOwnerByCameraId,
  createCameraOwner,
  updateCameraOwner,
  deleteCameraOwner
};
