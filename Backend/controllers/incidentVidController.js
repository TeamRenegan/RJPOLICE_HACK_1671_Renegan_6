const Video = require('../models/IncidentVid');
const moment = require('moment');

// Get all videos
const getIncidentVideos = async (req, res) => {
  try {
    const videos = await IncidentVideo.find().populate('cameraId');
    res.status(200).json(videos);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

//get video by cameraId 
const getIncidentVideobycameraId = async (req , res) => {

  try {
    const videos = await IncidentVideo.find({ cameraId: req.params.cameraId }).populate('cameraId');
    console.log("list of videos ",videos);
    if (videos.length === 0) {
      return res.status(404).json({ message: 'No videos found for the specified cameraId' });
    }
    res.status(200).json(videos);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Get video by ID - mongo db default 
const getIncidentVideoById = async (req, res) => {
  try {
    const video = await IncidentVideo.findById(req.params.id);
    if (!video) {
      return res.status(404).json({ message: 'Video not found' });
    }
    res.status(200).json(video);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

const getIncidentVideoByDate = async (req, res) => {
  try {
    const videos = await IncidentVideo.find({ dateTime: req.params.dateTime }).populate('cameraId');
    if (videos.length === 0) {
      return res.status(404).json({ message: 'No videos found for the specified dateTime' });
    }
    res.status(200).json(videos);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}

// Create a new video
const createIncidentVideo = async (req, res) => {
  try {
    const { cameraId, locationData, resolution, format, fileSize, duration, frameRate, videoUrl } = req.body;
    const newIncidentVideo = new IncidentVideo({
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

    const savedIncidentVideo = await newIncidentVideo.save();
    res.status(201).json(savedIncidentVideo);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

// Update video by ID
const updateIncidentVideo = async (req, res) => {
  try {
    const updatedIncidentVideo = await IncidentVideo.findByIdAndUpdate(
      req.params.id,
      req.body,
      { new: true }
    );
    res.status(200).json(updatedIncidentVideo);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Delete video by ID
const deleteIncidentVideo = async (req, res) => {
  try {
    await IncidentVideo.findByIdAndDelete(req.params.id);
    res.status(200).json({ message: 'Video deleted' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

module.exports = {
  getIncidentVideos,
  getIncidentVideobycameraId,
  getIncidentVideoById,
  getIncidentVideoByDate,
  createIncidentVideo,
  updateIncidentVideo,
  deleteIncidentVideo
};
