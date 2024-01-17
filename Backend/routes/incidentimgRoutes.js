const express = require('express');
const router = express.Router();
const {
  getIncidentImages,
  getIncidentImagebycameraId,
  getIncidentImageById,
  getIncidentImageByDate,
  createIncidentImage,
  updateIncidentImage,
  deleteIncidentImage
} = require('../controllers/incidentImgController');

// Define routes for IncidentImage metadata
router.get('/', getIncidentImages);
router.get('/:cameraId',  getIncidentImagebycameraId);
router.get('/:id', getIncidentImageById);
router.get('/:dateTime',getIncidentImageByDate);
router.post('/', createIncidentImage);
router.put('/:id', updateIncidentImage);
router.delete('/:id', deleteIncidentImage);

module.exports = router;
