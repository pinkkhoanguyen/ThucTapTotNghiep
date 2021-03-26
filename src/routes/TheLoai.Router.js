const express = require("express");
const router  = express.Router();
const theLoaiController = require('../controllers/admin/TheLoai.Controller');
router.get('/',theLoaiController.index);
router.post('/store',theLoaiController.store);
router.get('/create',theLoaiController.create);
router.get('/edit/:id',theLoaiController.edit);
router.post('/update/:id',theLoaiController.update);

module.exports = router;