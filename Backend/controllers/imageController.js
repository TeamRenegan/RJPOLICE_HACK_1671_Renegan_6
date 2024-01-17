const Image = require('../models/Image');
const moment = require('moment');

// Get all images
const getImages = async (req, res) => {
  try {
    const images = await Image.find().populate('cameraId');
    res.status(200).json(images);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// get the image by the cameraId field
const getImagebycameraId = async (req , res) => {

  try {
    const images = await Image.find({ cameraId: req.params.cameraId }).populate('cameraId');
    if (images.length === 0) {
      return res.status(404).json({ message: 'No images found for the specified cameraId' });
    }
    res.status(200).json(images);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Get image by ID (_id) - mongodb default
const getImageById = async (req, res) => {
  try {
    const image = await Image.findById(req.params.id).populate('cameraId');
    if (!image) {
      return res.status(404).json({ message: 'Image not found' });
    }
    res.status(200).json(image);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

const getImageByDate = async (req, res) => {
  try {
    const images = await Image.find({ dateTime: req.params.dateTime }).populate('cameraId');
    if (images.length === 0) {
      return res.status(404).json({ message: 'No images found for the specified dateTime' });
    }
    res.status(200).json(images);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}

// Create a new image
const createImage = async (req, res) => {
  try {
    const { cameraId, locationData, resolution, format, fileSize, imgUrl } = req.body;
    const newImage = new Image({
      dateTime: moment().format('YYYY-MM-DD HH:mm:ss'),
      cameraId,
      locationData,
      resolution,
      format,
      fileSize,
      imgUrl
    });

    const savedImage = await newImage.save();
    res.status(201).json(savedImage);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

// Update image by ID
const updateImage = async (req, res) => {
  try {
    const updatedImage = await Image.findByIdAndUpdate(
      req.params.id,
      req.body,
      { new: true }
    );
    res.status(200).json(updatedImage);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Delete image by ID
const deleteImage = async (req, res) => {
  try {
    await Image.findByIdAndDelete(req.params.id);
    res.status(200).json({ message: 'Image deleted' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

module.exports = {
  getImages,
  getImagebycameraId,
  getImageById,
  getImageByDate,
  createImage,
  updateImage,
  deleteImage
};
