const CameraOwner = require('../models/CameraOwner');

// Get all camera owners
const getCameraOwners = async (req, res) => {
  try {
    const cameraOwners = await CameraOwner.find();
    res.status(200).json(cameraOwners);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Get camera owner by ID
const getCameraOwnerById = async (req, res) => {
  try {
    const cameraOwner = await CameraOwner.findById(req.params.id);
    if (!cameraOwner) {
      return res.status(404).json({ message: 'Camera owner not found' });
    }
    res.status(200).json(cameraOwner);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Create a new camera owner
const createCameraOwner = async (req, res) => {
  const { name, address, email, contactNo } = req.body;
  const newCameraOwner = new CameraOwner({
    name,
    address,
    email,
    contactNo
  });

  try {
    const savedCameraOwner = await newCameraOwner.save();
    res.status(201).json(savedCameraOwner);
  } catch (error) {
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
  createCameraOwner,
  updateCameraOwner,
  deleteCameraOwner
};
