const express = require('express');
const router = express.Router();
const {
  getCameraOwners,
  getCameraOwnerById,
  getCameraOwnerByCameraId,
  createCameraOwner,
  updateCameraOwner,
  deleteCameraOwner
} = require('../controllers/cameraOwnerController');

// Define routes for camera owner metadata
router.get('/', getCameraOwners);
router.get('/:id', getCameraOwnerById);
router.get('/cameraId/:cameraId',getCameraOwnerByCameraId);
router.post('/', createCameraOwner);
router.put('/:id', updateCameraOwner);
router.delete('/:id', deleteCameraOwner);


module.exports = router;
