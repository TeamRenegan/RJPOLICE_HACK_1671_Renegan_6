const express = require('express');
const multer = require('multer');

const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

const router = express.Router();
const { 
  getCameras,
  getCamerabycameraId,
  getCameraById,
  getCamerabyVerifyDate,
  getApprovedVerifiedCameras,
  getRejectedVerifiedCameras,
  getNotVerifiedCameras,
  createCamera,
  updateCamera,
  deleteCamera,
  approveCamera
} = require('../controllers/cameraController');

// Define your routes for camera metadata
router.get('/cameras', getCameras);
router.get('/cameras/:cameraId',getCamerabycameraId);
router.get('/cameras/:id', getCameraById);
router.get('/cameras/:verifyDate',getCamerabyVerifyDate);
router.get('/cameras/approved_verified',getApprovedVerifiedCameras);
router.get('/cameras/rejected_verified',getRejectedVerifiedCameras);
router.get('/cameras/not_verified',getNotVerifiedCameras);

router.post('/cameras',upload.array('files'), createCamera);
router.put('/cameras/:id', updateCamera);
router.delete('/cameras/:id', deleteCamera);
router.put('/camera/approve',approveCamera);

module.exports = router;
