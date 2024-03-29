const Video = require('../models/Video');
const moment = require('moment');

// Get all videos
const getVideos = async (req, res) => {
  try {
    const videos = await Video.find().populate('cameraId');
    res.status(200).json(videos);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

//get video by cameraId 
const getVideobycameraId = async (req , res) => {

  try {
    const videos = await Video.find({ cameraId: req.params.cameraId }).populate('cameraId');
    if (videos.length === 0) {
      return res.status(404).json({ message: 'No videos found for the specified cameraId' });
    }
    res.status(200).json(videos);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Get video by ID - mongo db default 
const getVideoById = async (req, res) => {
  try {
    const video = await Video.findById(req.params.id);
    if (!video) {
      return res.status(404).json({ message: 'Video not found' });
    }
    res.status(200).json(video);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

const getVideoByDate = async (req, res) => {
  try {
    const videos = await Video.find({ dateTime: req.params.dateTime }).populate('cameraId');
    if (videos.length === 0) {
      return res.status(404).json({ message: 'No videos found for the specified dateTime' });
    }
    res.status(200).json(videos);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}

// Create a new video
const createVideo = async (req, res) => {
  try {
    const { cameraId, locationData, resolution, format, fileSize, duration, frameRate, videoUrl } = req.body;
    const newVideo = new Video({
      dateTime: moment().format('YYYY-MM-DD HH:mm:ss'),
      cameraId,
      locationData,
      resolution,
      format,
      fileSize,
      duration,
      frameRate,
      videoUrl
    });

    const savedVideo = await newVideo.save();
    res.status(201).json(savedVideo);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

// Update video by ID
const updateVideo = async (req, res) => {
  try {
    const updatedVideo = await Video.findByIdAndUpdate(
      req.params.id,
      req.body,
      { new: true }
    );
    res.status(200).json(updatedVideo);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Delete video by ID
const deleteVideo = async (req, res) => {
  try {
    await Video.findByIdAndDelete(req.params.id);
    res.status(200).json({ message: 'Video deleted' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

module.exports = {
  getVideos,
  getVideobycameraId,
  getVideoById,
  getVideoByDate,
  createVideo,
  updateVideo,
  deleteVideo
};
