const express = require("express");
const router  = express.Router();

const truyenController = require('../controllers/admin/Truyen.controller');




router.get('/',truyenController.index);
router.get('/create',truyenController.create);
router.post('/store',truyenController.store);
module.exports = router;