const express = require('express');
const router = express.Router();
const {
  getImages,
  getImagebycameraId,
  getImageById,
  getImageByDate,
  createImage,
  updateImage,
  deleteImage
} = require('../controllers/imageController');

// Define routes for image metadata
router.get('/', getImages);
router.get('/:cameraId',getImagebycameraId);
router.get('/:id', getImageById);
router.get('/:dateTime',getImageByDate);
router.post('/', createImage);
router.put('/:id', updateImage);
router.delete('/:id', deleteImage);

module.exports = router;
