const NotifyAdmin = require('../models/NotifyAdmin');


// Get all notifications
const getNotifications = async (req, res) => {
  try {
    const notifications = await NotifyAdmin.find();
    res.status(200).json(notifications);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Get notification by Camera ID
const getNotificationByCamera = async (req, res) => {
  try {
    const notifications = await NotifyAdmin.find({ Camera: req.params.cameraId })
      .populate('Camera')
      .populate('cameraOwner');
    if (notifications.length === 0) {
      return res.status(404).json({ message: 'No notifications found for the specified Camera ID' });
    }
    res.status(200).json(notifications);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Get notification by CameraOwner ID
const getNotificationByCameraOwner = async (req, res) => {
  try {
    const notifications = await NotifyAdmin.find({ cameraOwner: req.params.cameraOwnerId })
      .populate('Camera')
      .populate('cameraOwner');
    if (notifications.length === 0) {
      return res.status(404).json({ message: 'No notifications found for the specified Camera Owner ID' });
    }
    res.status(200).json(notifications);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Create a new notification
const createNotification = async (req, res) => {
  try {
    const { Camera, cameraOwner, message } = req.body;
    const newNotification = new NotifyAdmin({
      Camera,
      cameraOwner,
      message,
    });

    const savedNotification = await newNotification.save();
    res.status(201).json(savedNotification);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

// Update notification by ID
const updateNotification = async (req, res) => {
  try {
    const updatedNotification = await NotifyAdmin.findByIdAndUpdate(
      req.params.id,
      req.body,
      { new: true }
    );
    res.status(200).json(updatedNotification);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

const getNotificationById = async (req, res) => {
    try {
      const notification = await NotifyAdmin.findById(req.params.id)
        .populate('Camera')
        .populate('cameraOwner');
      if (!notification) {
        return res.status(404).json({ message: 'Notification not found' });
      }
      res.status(200).json(notification);
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  };


// Delete notification by ID
const deleteNotification = async (req, res) => {
  try {
    await NotifyAdmin.findByIdAndDelete(req.params.id);
    res.status(200).json({ message: 'Notification deleted' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};



module.exports = {
  getNotifications,
  getNotificationByCamera,
  getNotificationByCameraOwner,
  getNotificationById,
  createNotification,
  updateNotification,
  deleteNotification,
  
};
