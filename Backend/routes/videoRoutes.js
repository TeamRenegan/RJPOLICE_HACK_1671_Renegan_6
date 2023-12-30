const express = require('express');
const router = express.Router();
const {
  getVideos,
  getVideoById,
  createVideo,
  updateVideo,
  deleteVideo
} = require('../controllers/videoController');

// Define routes for video metadata
router.get('/', getVideos);
router.get('/:id', getVideoById);
router.post('/', createVideo);
router.put('/:id', updateVideo);
router.delete('/:id', deleteVideo);

module.exports = router;
