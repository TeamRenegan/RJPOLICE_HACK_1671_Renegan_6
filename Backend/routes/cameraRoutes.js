const express = require('express');
const router = express.Router();
const { 
  getCameras,
  getCameraById,
  createCamera,
  updateCamera,
  deleteCamera
} = require('../controllers/cameraController');

// Define your routes for camera metadata
router.get('/cameras', getCameras);
router.get('/cameras/:id', getCameraById);
router.post('/cameras', createCamera);
router.put('/cameras/:id', updateCamera);
router.delete('/cameras/:id', deleteCamera);

module.exports = router;
