const express = require('express');
const router = express.Router();

const {
    getNotifications,
    getNotificationByCamera,
    getNotificationByCameraOwner,
    getNotificationById,
    createNotification,
    updateNotification,
    deleteNotification
  } = require("../controllers/notifyAdminController");

  router.get('/',getNotifications);
  router.get('/:cameraId',getNotificationByCamera);
  router.get('/:cameraOwner',getNotificationByCameraOwner);
  router.get('/:id',getNotificationById);
  router.post('/',createNotification);
  router.put('/:id',updateNotification);
  router.delete('/:id',deleteNotification);

module.exports = router;