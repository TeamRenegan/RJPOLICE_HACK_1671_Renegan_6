const express = require('express');
const router = express.Router();
const {
  getImages,
  getImageById,
  createImage,
  updateImage,
  deleteImage
} = require('../controllers/imageController');

// Define routes for image metadata
router.get('/', getImages);
router.get('/:id', getImageById);
router.post('/', createImage);
router.put('/:id', updateImage);
router.delete('/:id', deleteImage);

module.exports = router;
