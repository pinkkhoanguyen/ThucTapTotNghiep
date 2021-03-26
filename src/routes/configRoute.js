const { Router } = require("express");
const express = require("express");
const router = express.Router();


router.get('/',(req,res)=>{
    res.render('web/index.ejs');
});

/// LOGIN ADMIN
router.get('/admin',(req,res)=>{
    res.render('admin/login.ejs');
});
router.get('/admin/index',(req,res)=>{
    res.render('admin/index.ejs');
});

const truyenRouting = require('./Truyen.router');
router.use('/admin/truyen',truyenRouting);

const theLoaiRouting = require('./TheLoai.router');
router.use('/admin/the-loai/',theLoaiRouting);

/// routing for tac-gia page
const tacGiaRouting = require('./TacGia.router');
router.use('/admin/tac-gia/',tacGiaRouting);


//// routing for api 'nguoi-dung

const nguoiDungRouting = require('./NguoiDung.Router');
router.use('/admin/nguoi-dung',nguoiDungRouting);


module.exports = router;