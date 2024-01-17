const express = require('express');
const router = express.Router();
const {
  getVideos,
  getVideobycameraId,
  getVideoById,
  getVideoByDate,
  createVideo,
  updateVideo,
  deleteVideo
} = require('../controllers/videoController');

// Define routes for video metadata
router.get('/', getVideos);
router.get('/:cameraId',getVideobycameraId);
router.get('/:id', getVideoById);
router.get('/:dateTime',getVideoByDate);
router.post('/', createVideo);
router.put('/:id', updateVideo);
router.delete('/:id', deleteVideo);

module.exports = router;
