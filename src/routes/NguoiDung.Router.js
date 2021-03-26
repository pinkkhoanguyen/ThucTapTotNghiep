const express = require("express");
const router  = express.Router();
const controller = require('../controllers/admin/NguoiDung.Controller');
///router.get('/',controller.index);

// API NGUOIDUNG
router.post('/login',controller.login);
module.exports = router;