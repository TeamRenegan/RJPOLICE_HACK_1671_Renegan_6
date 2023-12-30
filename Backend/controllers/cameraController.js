const Camera = require('../models/Camera.js');

// Get all cameras
const getCameras = async (req, res) => {
  try {
    const cameras = await Camera.find();
    res.status(200).json(cameras);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Get camera by ID
const getCameraById = async (req, res) => {
  try {
    console.log(req.params.id);
    const camera = await Camera.findById(req.params.id);
    if (!camera) {
      return res.status(404).json({ message: 'Camera not found' });
    }
    res.status(200).json(camera);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Create a new camera
const createCamera = async (req, res) => {
  const { cameraId, resolution, frameRate, visibilityRange, location, model, approvedBy, approvalDate, ipAddress, cameraOwner } = req.body;
  const newCamera = new Camera({
    cameraId,
    resolution,
    frameRate,
    visibilityRange,
    location,
    model,
    approvedBy,
    approvalDate,
    ipAddress,
    cameraOwner
  });

  try {
    const savedCamera = await newCamera.save();
    res.status(201).json(savedCamera);
  } catch (error) {
    res.status(400).json({ message: error.message });
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
  getCameraById,
  createCamera,
  updateCamera,
  deleteCamera
};
