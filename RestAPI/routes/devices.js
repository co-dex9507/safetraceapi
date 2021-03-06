/*
    devices registered with api
*/

const router = require('express').Router();
const DevicesController = require('../controllers/devices');
const checkAuth = require('../middleware/check-auth');
const rateLimiting = require('../middleware/rate-limiting');

router.get      ('/', rateLimiting(24, 2), checkAuth, DevicesController.is_device_registered);
router.post     ('/', rateLimiting(24, 2), checkAuth, DevicesController.register_device);
router.delete   ('/', rateLimiting(24, 2), checkAuth, DevicesController.unregister_device);

module.exports = router;