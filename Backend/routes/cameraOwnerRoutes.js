const express = require('express');
const router = express.Router();
const {
  getCameraOwners,
  getCameraOwnerById,
  createCameraOwner,
  updateCameraOwner,
  deleteCameraOwner
} = require('../controllers/cameraOwnerController');

// Define routes for camera owner metadata
router.get('/', getCameraOwners);
router.get('/:id', getCameraOwnerById);
router.post('/', createCameraOwner);
router.put('/:id', updateCameraOwner);
router.delete('/:id', deleteCameraOwner);

module.exports = router;
