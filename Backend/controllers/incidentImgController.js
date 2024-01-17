const IncidentImage = require('../models/IncidentImg');
const moment = require('moment');

// Get all images
const getIncidentImages = async (req, res) => {
  try {
    const incidentimages = await IncidentImage.find().populate('cameraId');
    res.status(200).json(incidentimages);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// get the image by the cameraId field
const getIncidentImagebycameraId = async (req , res) => {

  try {
    const images = await IncidentImage.find({ cameraId: req.params.cameraId }).populate('cameraId');
    if (images.length === 0) {
      return res.status(404).json({ message: 'No images found for the specified cameraId' });
    }
    res.status(200).json(images);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Get image by ID (_id) - mongodb default
const getIncidentImageById = async (req, res) => {
  try {
    const image = await IncidentImage.findById(req.params.id).populate('cameraId');
    if (!image) {
      return res.status(404).json({ message: 'Image not found' });
    }
    res.status(200).json(image);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

const getIncidentImageByDate = async (req, res) => {
  try {
    const images = await IncidentImage.find({ dateTime: req.params.dateTime }).populate('cameraId');
    if (images.length === 0) {
      return res.status(404).json({ message: 'No images found for the specified dateTime' });
    }
    res.status(200).json(images);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}

// Create a new image
const createIncidentImage = async (req, res) => {
  try {
    const { cameraId, locationData, resolution, format, fileSize, imgUrl } = req.body;
    const newIncidentImage = new IncidentImage({
      dateTime: moment().format('YYYY-MM-DD HH:mm:ss'),
      cameraId,
      locationData,
      resolution,
      format,
      fileSize,
      imgUrl
    });

    const savedIncidentImage = await newIncidentImage.save();
    res.status(201).json(savedIncidentImage);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

// Update image by ID
const updateIncidentImage = async (req, res) => {
  try {
    const updatedIncidentImage = await IncidentImage.findByIdAndUpdate(
      req.params.id,
      req.body,
      { new: true }
    );
    res.status(200).json(updatedIncidentImage);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Delete image by ID
const deleteIncidentImage = async (req, res) => {
  try {
    await IncidentImage.findByIdAndDelete(req.params.id);
    res.status(200).json({ message: 'Image deleted' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

module.exports = {
  getIncidentImages,
  getIncidentImagebycameraId,
  getIncidentImageById,
  getIncidentImageByDate,
  createIncidentImage,
  updateIncidentImage,
  deleteIncidentImage
};
