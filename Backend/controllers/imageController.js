const Image = require('../models/Image');

// Get all images
const getImages = async (req, res) => {
  try {
    const images = await Image.find();
    res.status(200).json(images);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Get image by ID
const getImageById = async (req, res) => {
  try {
    const image = await Image.findById(req.params.id);
    if (!image) {
      return res.status(404).json({ message: 'Image not found' });
    }
    res.status(200).json(image);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Create a new image
const createImage = async (req, res) => {
  const { dateTime, cameraId, locationData, resolution, format, fileSize, imgUrl } = req.body;
  const newImage = new Image({
    dateTime,
    cameraId,
    locationData,
    resolution,
    format,
    fileSize,
    imgUrl
  });

  try {
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
  getImageById,
  createImage,
  updateImage,
  deleteImage
};
