const express = require("express");
const router  = express.Router();
const tacGiaController = require('../controllers/admin/TacGia.Controller');
router.get('/',tacGiaController.index);
router.post('/store/',tacGiaController.store);
router.get('/getTacGias',tacGiaController.getTacGias);
router.post('/update/:id',tacGiaController.update);
router.get('/:id',tacGiaController.info);


module.exports = router;