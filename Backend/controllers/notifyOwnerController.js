const NotifyOwner = require('../models/notifyOwnerModel');

// Controller to create a notification for a camera owner
const createNotification = async (req, res) => {
  try {
    
    const { cameraId, message } = req.body;

    const notification = new NotifyOwner({
      camera: cameraId,
      message: message || '',
    });

    const savedNotification = await notification.save();

    res.status(201).json(savedNotification);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

// Controller to get all notifications for a camera owner
const getNotificationsForCameraOwner = async (req, res) => {
  try {
    const { cameraId } = req.params;

    const notifications = await NotifyOwner.find({ camera: cameraId });

    res.status(200).json(notifications);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

// Controller to update a notification
const updateNotification = async (req, res) => {
  try {
    const { id } = req.params;
    const { message } = req.body;

    const updatedNotification = await NotifyOwner.findByIdAndUpdate(
      id,
      { message: message || '' },
      { new: true }
    );

    if (!updatedNotification) {
      return res.status(404).json({ message: 'Notification not found' });
    }

    res.status(200).json(updatedNotification);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

// Controller to delete a notification
const deleteNotification = async (req, res) => {
  try {
    const { id } = req.params;

    const deletedNotification = await NotifyOwner.findByIdAndDelete(id);

    if (!deletedNotification) {
      return res.status(404).json({ message: 'Notification not found' });
    }

    res.status(204).end();
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

module.exports = {
  createNotification,
  getNotificationsForCameraOwner,
  updateNotification,
  deleteNotification,
};
zz