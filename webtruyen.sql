-- create database webtruyen
-- use webtruyen

create table TacGia(
	id int primary key AUTO_INCREMENT,
    ten_TG nvarchar(50) not null,
    gioiThieu text(1000)
);

-- Them DL

insert into TacGia(ten_TG, gioiThieu)
	values(N'Đường Gia Tam Thiếu', N'Ông là tác giả cho nhiều bộ truyện tiên hiệp');
insert into TacGia(ten_TG, gioiThieu)
	values(N'Thiên Tàm Thổ Đậu', N'Ông là tác giả cho nhiều bộ truyện dị giới, huyền huyễn');
insert into TacGia(ten_TG, gioiThieu)
	values(N'Mạc Mặc', N'Ông là tác giả cho nhiều bộ truyện kiếm hiệp');

create table NguoiDung(
	id int primary key auto_increment,
    ten_ND nvarchar(50) not null,
    matKhau varchar(10) not null,
    email varchar(100) not null,
    sdt varchar(10),
    ngayTao varchar(20) not null,
    ngayCapNhat varchar(20) not null
);

-- Them DL

insert into NguoiDung(ten_ND, matKhau, email, sdt, ngayTao, ngayCapNhat)
	values(N'admin', 'admin', 'admin@gmail.com', '123456', '25/03/2021', '25/03/2021');
insert into NguoiDung(ten_ND, matKhau, email, sdt, ngayTao, ngayCapNhat)
	values(N'mod', 'mod', 'mod@gmail.com', '132456', '25/03/2021', '25/03/2021');
insert into NguoiDung(ten_ND, matKhau, email, sdt, ngayTao, ngayCapNhat)
	values(N'member', 'member', 'member@gmail.com', '123465', '25/03/2021', '25/03/2021');
 

create table ChucVu(
	id int primary key auto_increment,
    ten_CV nvarchar(50) not null,
    tenHienThi nvarchar(50) not null
);

-- Them DL

insert into ChucVu(ten_CV, tenHienThi)
	values(N'Quản trị viên', N'admin');
insert into ChucVu(ten_CV, tenHienThi)
	values(N'Người kiểm duyệt', N'mod');
insert into ChucVu(ten_CV, tenHienThi)
	values(N'Thành viên', N'member');

create table NguoiDung_ChucVu(
    id_ND int,
    id_CV int,
    foreign key (id_ND) references NguoiDung(id),
    foreign key (id_CV) references ChucVu(id),
	constraint id primary key (id_ND, id_CV)
);

-- Them DL 

insert into NguoiDung_ChucVu(id_ND, id_CV)
	values(1, 1);
insert into NguoiDung_ChucVu(id_ND, id_CV)
	values(2, 2);
insert into NguoiDung_ChucVu(id_ND, id_CV)
	values(3, 3);

create table Quyen(
	id int primary key auto_increment,
    ten_Q nvarchar(50) not null,
    tenHT nvarchar(50) not null
);

-- Them DL

insert into Quyen(ten_Q, tenHT)
	values(N'Thêm bình luận', N'ThêmBL');
insert into Quyen(ten_Q, tenHT)
	values(N'Xóa bình luận', N'XóaBL');
insert into Quyen(ten_Q, tenHT)
	values(N'Sửa bình luận', N'SửaBL');
insert into Quyen(ten_Q, tenHT)
	values(N'Xóa bài đăng', N'XóaBĐ');
insert into Quyen(ten_Q, tenHT)
	values(N'Ban thành viên', N'BanTV');
insert into Quyen(ten_Q, tenHT)
	values(N'Sửa thông tin tành viên', N'SửaTT');
insert into Quyen(ten_Q, tenHT)
	values(N'Xóa thành viên', N'XoáTV');
insert into Quyen(ten_Q, tenHT)
	values(N'Cấp quyền cho thành viên', N'Cấp Quyền');

create table ChucVu_Quyen(
    id_CV int,
    id_Q int,
    foreign key (id_CV) references ChucVu(id),
    foreign key (id_Q) references Quyen(id),
    constraint id primary key (id_CV, id_Q)
);

-- Them DL

insert into ChucVu_Quyen(id_CV, id_Q)
	values(1, 1);
insert into ChucVu_Quyen(id_CV, id_Q)
	values(1, 2);
insert into ChucVu_Quyen(id_CV, id_Q)
	values(1, 3);
insert into ChucVu_Quyen(id_CV, id_Q)
	values(1, 4);
insert into ChucVu_Quyen(id_CV, id_Q)
	values(1, 5);
insert into ChucVu_Quyen(id_CV, id_Q)
	values(1, 6);
insert into ChucVu_Quyen(id_CV, id_Q)
	values(1, 7);
insert into ChucVu_Quyen(id_CV, id_Q)
	values(1, 8);
insert into ChucVu_Quyen(id_CV, id_Q)
	values(2, 1);
insert into ChucVu_Quyen(id_CV, id_Q)
	values(2, 2);
insert into ChucVu_Quyen(id_CV, id_Q)
	values(2, 3);
insert into ChucVu_Quyen(id_CV, id_Q)
	values(2, 4);
insert into ChucVu_Quyen(id_CV, id_Q)
	values(2, 5);
insert into ChucVu_Quyen(id_CV, id_Q)
	values(3, 1);
insert into ChucVu_Quyen(id_CV, id_Q)
	values(3, 3);

create table TheLoai(
	id int primary key auto_increment,
    tenTheLoai nvarchar(50) not null,
    moTa text(1000) not null
);

-- Them DL

insert into TheLoai(tenTheLoai, moTa)
	values(N'Huyền huyễn', N'Thới giới phép thuật');
insert into TheLoai(tenTheLoai, moTa)
	values(N'Tiên hiệp', N'Thới giới tu tiên');
insert into TheLoai(tenTheLoai, moTa)
	values(N'Kiếm hiệp', N'Thới giới võ lâm');

create table Truyen(
	id int primary key auto_increment,
    ten_Tr nvarchar(100) not null,
   
    tinhTrang enum('Đang tiến hành','Đã hoàn thành'),
    tomTat text(1000) not null,
    moKhoa bit,
    anhBia varchar(500),
    
    ngayDang varchar(50) not null,
    id_ND int,
    id_TG int,
    foreign key (id_ND) references NguoiDung(id),
    foreign key (id_TG) references TacGia(id)
);

-- Them DL

insert into Truyen(ten_Tr, tinhTrang, tomTat, moKhoa, anhBia, ngayDang, id_ND, id_TG)
	values(N'Đấu phá thương khung', 'Đã hoàn thành', N'Truyện hay', 1, '', '25/03/2021', 1, 2);
insert into Truyen(ten_Tr, tinhTrang, tomTat, moKhoa, anhBia, ngayDang, id_ND, id_TG)
	values(N'Đấu la đại lục', 'Đã hoàn thành', N'Truyện hay', 1, '', '25/03/2021', 1, 1);
insert into Truyen(ten_Tr, tinhTrang, tomTat, moKhoa, anhBia, ngayDang, id_ND, id_TG)
	values(N'Võ luyện đỉnh phong', 'Đang tiến hành', N'Truyện hay', 1, '', '25/03/2021', 1, 3);

create table Truyen_TheLoai(
	id_Tr int,
    id_TL int,
    foreign key (id_Tr) references Truyen(id),
    foreign key (id_TL) references TheLoai(id),
    constraint id primary key (id_Tr, id_TL)
);

-- Them DL

insert into Truyen_TheLoai(id_Tr, id_TL)
	values(2, 1);
insert into Truyen_TheLoai(id_Tr, id_TL)
	values(2, 2);
insert into Truyen_TheLoai(id_Tr, id_TL)
	values(3, 1);
insert into Truyen_TheLoai(id_Tr, id_TL)
	values(3, 3);
insert into Truyen_TheLoai(id_Tr, id_TL)
	values(4, 1);
insert into Truyen_TheLoai(id_Tr, id_TL)
	values(4, 2);
insert into Truyen_TheLoai(id_Tr, id_TL)
	values(4, 3);

create table Chuong(
	id int primary key auto_increment,
    ten_C nvarchar(100) not null,
    noiDung text(5000) not null,
    id_Tr int,
    foreign key (id_Tr) references Truyen(id)
);

-- Them DL

insert into Chuong(ten_C, noiDung, id_Tr)
	values(N'Chương 1: Thiên tài rơi rụng',  N'"Đấu lực, ba đoạn"

Nhìn năm chữ to lớn có chút chói mắt trên trắc nghiệm ma thạch, thiếu niên mặt không chút thay đổi, thần sắc tự giễu, nắm chặt tay, bởi vì dùng lực quá mạnh làm móng tay đâm thật sâu vào trong lòng bàn tay, mang đến từng trận trận đau đớn trong tâm hồn...

"Tiêu Viêm, đấu lực, ba đoạn! Cấp bậc: Cấp thấp!".

Bên cạnh trắc nghiệm ma thạch, một vị trung niên nam tử, thoáng nhìn tin tức trên bia, ngữ khí hờ hững công bố…

Trung niên nam tử vừa nói xong, không có gì ngoài ý muốn, đám người trên quảng trường lại nổi lên trận trận châm chọc tao động

"Ba đoạn? Hắc hắc, quả nhiên không ngoài dự đoán của ta, ""Thiên tài" này một năm rồi vẫn dậm chân tại chỗ a!"

"Ai, phế vật này thật sự làm mất hết cả mặt mũi gia tộc."
"Nếu tộc trưởng không phải phụ thân của hắn. Loại phế vật này sớm đã bị đuổi khỏi gia tộc, tự sinh tự diệt rồi, làm gì còn có cơ hội ở gia tộc ăn không uống không."

"Ai..., thiên tài thiếu niên năm đó của Văn Ô Thản thành, tại sao hôm nay lại lạc phách thành bộ dáng này cơ chứ?"

"Ai mà biết được? Có lẽ do làm việc gì đó trái với lương tâm, làm thần linh nổi giận đó mà…"

Chung quanh truyền đến cười nhạo cùng thanh âm tiếc hận, dừng ở trong tai của thiếu niên, tựa như một chiếc dao nhọn hung hăng đâm vào tim hắn, khiến hô hấp của thiếu niên trở nên có chút dồn dập.
Thiếu niên chậm rãi ngẩng đầu, lộ ra khuôn mặt thanh tú non nớt, con ngươi đen nhánh nhẹ nhàng đảo qua đám bạn cùng lứa tuổi đang trào phúng chung quanh, khóe miệng thiếu niên tự giễu, tựa hồ trở nên càng thêm chua xót.

"Những người này, đều thừa hơi như vậy sao? Có lẽ vì ba năm trước bọn họ từng trước mặt mình lộ ra bộ mặt tươi cười nhún nhường, cho nên hiện tại muốn đòi trở về đây mà…" Mỉm cười chua xót, Tiêu Viêm chán nản xoay người, im lặng đi tới cuối hàng, thân ảnh cô đơn cùng thế giới xung quanh trở nên có chút lạc lõng.

"Người tiếp theo, Tiêu Mị"

Nghe người tiến hành trắc nghiệm gọi tên, một thiếu nữ rất nhanh từ trong đám người đi ra, tiếng nghị luận ở xung quanh trở nên nhỏ đi rất nhiều, từng đạo ánh mắt nóng bỏng tập trung lên trên khuôn mặt của thiếu nữ…

Thiếu nữ tuổi không quá mười bốn, dù chưa thể coi là tuyệt sắc, nhưng khuôn mặt non nớt kia cũng ẩn chứa trong đó một tia vũ mị nhàn nhạt, thanh thuần cùng vũ mị, một tập hợp mâu thuẫn, càng khiến nàng trở thành tiêu điểm của toàn trường…

Thiếu nữ nhanh chóng đi lên, tay vuốt ve ma thạch bi quen thuộc, sau đó chậm rãi nhắm mắt…

Tại lúc thiếu nữ nhắm mắt, ma thạch bi đen nhánh lại hiện lên quang mang…

"Đấu khí: Bảy đoạn!"

"Tiêu Mị, Đấu khí: Bảy đoạn! Cấp bậc: Cao cấp"

"Da!" Nghe trắc ngiệm viên đọc lên thành tích, thiếu nữ ngẩng mặt lên đắc ý cười…

"Sách sách, bảy đoạn đấu khí, cứ theo tiến độ như vậy, chỉ sợ không quá ba năm thời gian, nàng có thể trở thành một đấu giả chính thức rồi…"
"Không hổ là hạt giống của gia tộc a…"

Nghe đám người truyền đến trận trận thanh âm hâm mộ, thiếu nữ tươi cười lại rạng rỡ thêm vài phần, tâm hư vinh, là thứ mà rất nhiều cô gái đều không thể kháng cự…

Nhớ đến ngày thường hay cùng mấy tỷ muội đàm tiếu, tầm mắt Tiêu Mị bỗng nhiên xuyên qua đám người, dừng trên một đạo thân ảnh cô đơn…

Nhíu mày suy nghĩ một chút, Tiêu Mị vứt bỏ ý niệm trong đầu, hiện tai hai người đã không còn cùng một giai tầng, lấy biểu hiện của Tiêu Viêm mấy năm này, sau khi trưởng thành, nhiều nhất cũng chỉ có thể làm nhân viên hạ tầng của gia tộc mà thôi, mà thiên phú vĩ đại như nàng, sẽ trở thành trọng điểm bồi dưỡng của gia tộc, có thể nói là tiền đồ không thể hạn lượng.

"Ai…" Khẽ thở dài một tiếng, trong đầu Tiêu Mị bỗng hiện ra hình ảnh một thiếu niên ý khí phong phát ba năm trước đây, bốn tuổi luyện khí, mười tuổi có chín đoạn đấu khí, mười một tuổi đột phá mười đoạn đấu khí, ngưng tụ thành công đấu khí toàn, trở thành đấu giả trẻ nhất trong vòng trăm năm của gia tộc!

Thiếu niên trước kia, bộ dáng tự tin lại thêm tiềm lực không thể hạn lượng, không biết đã làm bao cô gái động xuân tâm, đương nhiên trong đó cũng có cả Tiêu Mị.

Nhưng con đường của thiên tài, từ trước đến giờ luôn luôn trắc trở, ba năm trước, khi danh vọng của thiếu niên thiên tài đạt tới đỉnh cao nhất, cũng là lúc đột ngột phải thừa nhận đả kích tàn khốc nhất, không chỉ có vừa vất vả khổ tu ngưng tụ đấu khí toàn trong một đêm biến mất, mà đấu khí theo thời gian trôi qua lại càng trở nên càng ngày càng ít đi một cách quỷ dị.

Kết quả của đấu khí biến mất, đó chính là thực lực không ngừng giảm đi.

Từ thiên tài, một đêm trở thành một thứ mà ngay cả người bình thường cũng không bằng, loại đả kích này, khiến thiếu niên từ đó thất hồn lạc phách, cái tên thiên tài, cũng dần dần bị khinh thường cùng châm chọc thay thế.

Trèo càng cao, ngã càng đau, lần ngã này có lẽ sẽ không còn cơ hội đứng dậy nữa.

"Người tiếp theo, Tiêu Huân Nhi!"

Trong âm thanh huyên náo của đám người, thanh âm của trắc nghiệm viên lại vang lên.

Theo đó là một cái tên thanh nhã vang lên, đám người bỗng trở nên im lặng, ánh mắt đều dịch chuyển.

Tại nơi ánh mắt tụ hội, một thiếu nữ áo tím đang đạm nhã đứng đó, khuôn mặt non nớt bình tĩnh, không vì bị mọi người chú ý mà thay đổi chút nào.

Thiếu nữ khí chất lãnh đạm tựa như đóa sen mới nở, tuổi nhỏ đã có khí chất thoát tục, khó có thể tưởng tượng sau này lớn lên, thiếu nữ này sẽ khuynh quốc khuynh thành đến mức độ nào…

Tử y thiếu nữ này, nói về mỹ mạo cùng khí chất, so với Tiêu Mị trước đó lại càng hơn vài phần, khó trách mọi người đều có động tác như vậy.

Khẽ bước tới, thiếu nữ tên Tiêu Huân Nhi đi tới phía trước ma thạch bi, bàn tay nhỏ bé đưa lên, ống tay áo theo đó mà chảy xuống, lộ ra da thịt trắng nõn nà, sau đó đặt nhẹ tay lên bia đá…

Sau một khoảng trầm tĩnh, trên thạch bia hiện lên ánh sáng chói mắt.

"Đấu khí: Chín đoạn! Cấp bậc: Cao cấp!"

Nhìn mấy chữ trên thạch bia, giữa sân trở nên tĩnh lặng.

"…Đã tới chín đoạn rồi, thật là khủng bố mà! Người đứng đầu trong giới trẻ của gia tộc, chỉ sợ không ai ngoài Huân Nhi tiểu thư a." Yên tĩnh qua đi, các thiếu niên xung quanh đều không tự chủ được nuốt một ngụm nước miếng, ánh mắt tràn ngập kính sợ…

Đấu khí, con đường bắt buộc phải đi qua của mỗi đấu giả, sơ giai đấu khí chia từ một đến mười đoạn, đấu khí trong cơ thể đạt tới mười đoạn, là có thể ngưng tụ đấu khí toàn, trở thành một đấu giả được người khác tôn trọng.

Trong đám người, Tiêu Mị nhíu mày nhìn cô gái áo tím đứng trước bia đá, trên mặt hiện lên một tia ghen tị…

Nhìn tin tức trên thạch bia, khuôn mặt hờ hững của trung niên trắc nghiệm viên bên cạnh cũng lộ ra một tia mỉm cười hiếm hoi, đối với cô gái thoáng dùng âm thanh cung kính nói: "Huân Nhi tiểu thư, nửa năm sau, tiểu thư hẳn sẽ có thể ngưng tụ đấu khí toàn, nếu thành công, mười bốn tuổi trở thành một đấu giả chân chính, tiểu thư sẽ là người thứ hai của Tiêu gia trong trăm năm nay!"

Đúng vậy, người thứ hai, người thứ nhất đó chính là thiên tài đã mất đi ánh hào quang - Tiêu Viêm.

"Cám ơn." Thiếu nữ khẽ gật đầu, khuôn mặt bình thản không vì được hắn khích lệ mà vui sướng, im lặng xoay người, dưới ánh mắt nóng bỏng của mọi người, chậm rãi đi đến cuối đám người, tới trước mặt thiếu niên đang suy sụp…

"Tiêu Viêm ca ca." Tại lúc đến bên cạnh thiếu niên, thiếu nữ dừng chân, đối với Tiêu Viêm cung kính cúi người, trên khuôn mặt xinh đẹp, cư nhiên lộ ra nụ cười thanh nhã khiến các cô gái chung quanh cũng phải trở nên ghen tị.

"Huynh bây giờ còn có tư cách để muội gọi như vậy sao?" Nhìn trước mặt đã trở thành khỏa minh châu sáng nhất trong gia tộc kia, Tiêu Viêm chua xót nói, sau khi bản thân hắn tụt dốc nàng chính là một trong số cực ít những người vẫn bảo trì tôn kính đối với hắn.

"Tiêu Viêm ca ca, trước kia huynh đã từng nói với Huân Nhi, có thể buông, mới có thể cầm lấy, thu phóng tự nhiên mới là người tự tại!" Tiêu Huân Nhi mỉm cười ôn nhu nói, giọng nói non nớt, khiến người tâm đã chết cũng cảm thấy ấm lòng.

"Ha, ha, người tự tại sao? Huynh cũng chỉ biết nói mà thôi, muội xem bộ dáng hiện tại của huynh đi, giống một người tự tại sao? Hơn nữa… thế giới này, cơ bản cũng không phải là thế giới của huynh." Tiêu Viêm cười tự giễu nói.

Đối với sự suy sụp của Tiêu Viêm, Tiêu Huân Nhi khẽ cau mày, thật lòng nói: "Tiêu Viêm ca ca, tuy muội cũng không biết huynh vì sao lại bị như vậy, bất quá, Huân Nhi tin tưởng, huynh sẽ lại đứng dậy, lấy lại vinh quang và tôn nghiêm của huynh…" Kết thúc câu nói, khuôn mặt trắng nõn của thiếu nữ lần đầu tiên hiện lên nét ửng đỏ nhàn nhạt: "Tiêu viêm ca ca năm đó, thực ra rất hấp dẫn…"

"A a…" Đối với lời nói thẳng thắn của thiếu nữ, thiếu niên xấu hổ cười một tiếng, nhưng lại không nói gì, người không phong lưu phí hoài tuổi trẻ, nhưng hắn hiện tại thực sự đã không còn tư cách cùng tâm tình đó nữa, yên lặng xoay người, chậm rãi đi ra khỏi quảng trường…

Đứng tại chỗ nhìn theo bóng lưng cô độc của thiếu niên, Tiêu Huân Nhi trù trừ một thoáng, sau đó bỏ lại tiêng sói tru tiếng ghen tị tại phía sau, bước nhanh theo, cùng thiếu niên sóng vai bước đi…
', 2);
insert into Chuong(ten_C, noiDung, id_Tr)
	values(N'Chương 1: Khởi đầu', N'Ba Thục còn có mỹ danh Thiên Phủ Chi Quốc, trong đó nổi danh nhất chính là Đường Môn

Đường Môn là một thần bí địa phương, rất nhiều người chỉ biết đó là một địa điểm giữa sườn núi, mà đỉnh núi nơi Đường Môn tọa lạc lại có một cái tên làm kẻ khác đảm chiến kinh tâm - Quỷ Kiến Sầu.

Từ đỉnh Quỷ Kiến Sầu mà ném ra một hòn đá, phải đến 19 mới nghe được tiếng vang của hòn đá va chạm dưới chân núi, có thể thấy được núi cao thế nào, cũng bởi vì mười chín giây này, vượt qua mười tám tầng địa ngục một bậc, nên mới có cái tên này.

Một gã hôi y (áo xám) thanh niên đang đứng trên đỉnh núi Quỷ Kiến Sầu, gió núi mãnh liệt không làm thân thể hắn di động chút nào, từ trên ngực hắn ngực có một chữ Đường lớn có thể nhận ra, hắn đến từ Đường Môn, áo xám đại biểu là Đường Môn ngoại môn đệ tử.

Hắn năm nay hai mươi chín tuổi, xuất sanh không lâu thì tiến vào Đường Môn, trong ngoại môn bài danh đệ tam, bởi vậy ngoại môn đệ tử xưng hắn một tiếng Tam Thiếu. Đương nhiên, tới miệng nội môn đệ tử miệng, tựu biến thành Đường Tam.

Đường Môn từ khi thành lập thì bắt đầu chia làm nội ngoại nhị môn, ngoại môn đệ tử đều là ngoại tính (họ khác) hoặc được thụ dư (ban cho) Đường tính (họ Đường), mà nội môn là Đường Môn trực hệ gia tộc truyền thừa.

Lúc này, vẻ mặt Đường Tam rất phong phú, khi thì cười, khi thì khóc, nhưng vô luận thế nào, đều không thể che dấu hưng phấn phát ra từ nội tâm.

Hai mươi chín năm, hai mươi chín năm trước hắn được ngoại môn trưởng lão Đường Lam thái gia nhặt về Đường Môn từ lúc còn nằm trong tã, Đường Môn chính là nhà hắn, mà Đường Môn ám khí chính là tất cả của hắn.
Đột nhiên, Đường Tam sắc mặt chợt biến đổi, nhưng rất nhanh trở lại bình thường, có chút khổ sáp đích tự nhủ: "Cái gì phải tới cuối cùng sẽ tới. "

Mười bảy đạo thân ảnh, mười bảy đạo bạch sắc thân ảnh, tựa như ánh sao toát ra từ sườn núi hướng đỉnh núi mà đến, chủ nhân mười bảy đạo thân ảnh này, tuổi nhỏ nhất cũng ngoại ngũ tuần (hơn 50), mỗi người đều thần sắc ngưng trọng, bọn họ mặc bạch y đại biểu chính là nội môn, mà chữ Đường màu vàng trước ngực là tượng trưng cho Đường Môn trưởng lão.

Đường Môn nội môn trưởng lão đường kể cả chưởng môn Đường Đại tiên sinh tổng cộng có mười bảy vị trưởng lão, lúc này đăng sơn (lên núi) cũng là mười bảy vị. Cho dù là võ lâm đại hội cũng không thể kinh động toàn bộ Đường Môn trưởng lão đồng thời xuất động, phải biết rằng, trong số Đường Môn trưởng lão, người lớn tuổi nhất đã vượt qua hai giáp (hơn 120 tuổi).

Đường Môn trưởng lão tu vi, không ai không đạt tới cực cảnh, chỉ trong chớp mắt, bọn họ cũng đã đi tới đỉnh núi.
Ngoại môn đệ tử nhìn thấy nội môn trưởng lão, chỉ có thể quỳ xuống nghênh đón, nhưng lúc này, Đường Tam bất động, chỉ lẳng lặng nhìn các trưởng lão sắc mặt ngưng trọng đi tới trước mặt, ngăn lại tất cả đường đi, mà sau lưng hắn là Quỷ Kiến Sầu.

Buông ba đóa Phật Nộ Đường Liên, Đường Tam cuối cùng cúi đầu, ánh mắt lưu luyến không thôi, khóe miệng toát ra một nụ cười vui mừng, hắn dù sao cũng đã thành công, cố gắng hai mươi năm, hắn rốt cục hoàn thành chế tạo Đường gia ngoại môn ám khí đỉnh phong, cái loại thỏa mãn về thành tựu này không thể dùng ngôn ngữ hình dung được.

Giờ phút này, Đường Tam có cảm giác đối với chính mình mà nói, tất cả đều đã không còn trọng yếu, vi bối môn quy cũng được, sanh tử tồn vong cũng được, tựa hồ tất cả đều theo ba đóa Đường Liên đang nở rộ trước mắt mà kết thúc, Phật Nộ Đường Liên, loại ám khí bá đạo nhất thế gian này đản sinh trong chính tay mình, còn gì có thể làm Đường Tam hưng phấn hơn loại ám khí có tẩm dâm dược này?

"Ta biết, trộm nhập nội môn, học trộm bổn môn tuyệt học tội không thể tha thứ. Môn quy bất dung, nhưng Đường Tam có thể hướng lên trời mà thề, tuyệt không đem một điểm nào của bổn môn tuyệt học mà ta hoc trộm được tiết lộ ra bên ngoài. Ta nói điều này, cũng không phải hy vọng được các trưởng lão khoan dung, chỉ là muốn nói cho các trưởng lão, Đường Tam chưa bao giờ quên nguồn cội. Trước kia không có, sau này cũng không có. "

Đường Tam lúc này tâm tình rất tỉnh táo, có lẽ đây là lúc hắn tỉnh táo nhất trong đời. Nhìn đại viện cổ xưa của Đường Môn trên sườn núi, cảm thụ không khí thuộc về Đường Môn, Đường Tam mắt đã ươn ướt. Từ khi hắn bắt đầu hiểu chuyện, có thể nói, hắn chính là vì Đường Môn mà sinh, mà lúc này, cũng nên vì điều mà chính mình theo đuổi suốt cuộc đời lại vì Đường Môn mà đi.

Các trưởng lão đều không nói gì, bọn họ lúc này còn chưa thể tỉnh táo sau khi chứng kiến Phật Nộ Đường Liên xuất hiện. Hai trăm năm, suốt hai trăm năm, Phật Nộ Đường Liên dĩ nhiên xuất hiện trong tay một ngoại môn đệ tử, điều có ý nghĩa gì? Phách tuyệt thiên hạ, tuyệt thế ám khí mà ngay cả người của chính Đường Môn cũng không thể ngăn cản đại biểu tuyệt đối là thời kì đỉnh phong của Đường Môn đã tới.

Nhìn các trưởng lão cúi đầu không nói, Đường Tam thản nhiên cười, "Đường Tam hết thảy mọi thứ đều là Đường Môn cấp, bất luận là sinh mệnh hay năng lực, đều là Đường Môn phú dư, bất luận lúc nào, Đường Tam sống là người của Đường Môn, chết là quỷ của Đường Môn, ta biết, các trưởng lão sẽ không cho phép thi thể ta, một ngoại môn đệ tử vi bối môn quy ở lại Đường Môn, đã như vật, hãy để xương cốt ta hòa vào tự nhiên Ba Thục đi. "

Thanh âm Đường Tam bình tĩnh, thậm chí có chút hưng phấn rốt cục làm các trưởng lão bừng tỉnh, lúc các trưởng lão ngẩng đầu nhìn về phía hắn, chỉ thấy một tầng "nhũ bạch sắc" (màu kem) khí lưu trong nháy mắt từ hắn trên người tỏa ra.

"Huyền thiên bảo lục, ngươi ngay cả bổn môn tối cao nội công, Huyền Thiên Bảo Lục cũng học rồi? " Đường đại tiên sinh thất thanh nói.

Oanh! Một tiếng nổ vang lên, lúc các vị trưởng lão đồng thời lui về sau để phòng bất trắc, bọn họ cũng thấy Đường Tam xích lõa toàn thân.

Đường Tam cười, hắn tươi cười rất sáng lạn, "xích lõa mà đến, xích lõa mà đi, Phật Nộ Đường Liên xem như lễ vật cuối cùng Đường Tam lưu lại cho bổn môn. Bây giờ, ngoại trừ con người của ta ra, ta không mang đi bất cứ vật gì của Đường Môn, bí tịch tất cả đều nằm trong khối gạch đầu tiên dưới cửa phòng ta. Đường Tam bây giờ đã đem tất cả đều trả lại cho Đường Môn. "
"Ha ha ha ha ha ha ha......" Đường Tam ngửa mặt lên trời cuồng tiếu, bước nhanh về phía sau, lúc này, các vị Đường Môn trưởng lão đột nhiên phát hiện, nhưng cũng không ai kịp ngăn cản hắn, thân thể hắn trong bạch quang bao phủ, như tia chớp phóng về Quỷ Kiến Sầu phía trước, thân hình cao lớn bay vút lên, bay về phía mây mù giữa núi.

"Chờ một chút." Đường đại tiên sinh rốt cục đã phản ứng, nhưng là, lúc này hắn nói cái gì đi nữa cũng đều đã chậm.

Mây mù dày đặc, mang theo trận trận khí ẩm, mang đi ánh mặt trời, cũng mang đi Đường Tam, người đem cả đời cống hiến cho Đường Môn cùng ám khí.

Thời gian tựa hồ "đình trệ" (dừng lại), Đờng Đại tiên sinh hai tay run rẩy nâng ba đóa Đường Liên trước mặt lên, mắt hắn đã ươn ướt, "Đường Tam a Đường Tam, ngươi sao phải khổ như vậy chứ? Ngươi thật sự gây cho chúng ta nhiều kinh ngạc, nhiều lắm......"

"Đại ca." Nhị trưởng lão tiến lên một bước, "Cần gì phải thương xót phản đồ này? "

Đường Đại tiên sinh ánh mắt trong nháy mắt biến lãnh, toàn thân hàn khí đại thịnh, trừng mắt nhìn Nhị trưởng lão, "Ngươi nói ai là phản đồ? Ngươi đã gặp qua một phản đồ sau khi đoạt được bổn môn tối cao bí tịch còn không trốn? Ngươi đã gặp qua một phản đồ dùng cái chết để chứng minh? Ngươi đã gặp qua một người mang tuyệt thế ám khí đủ để hủy diệt tất cả Đường Môn cao thủ nhưng lại lấy đó làm lễ vật cuối cùng cho Đường Môn? Đường Tam không phải phản đồ, hắn là thiên tài xuất sắc nhất bổn môn hai trăm năm qua."

Nhị trưởng lão ngẩn ngơ, "Nhưng là, hắn học trộm bổn môn......"

Đường đại tiên sinh chợt cắt đứt, "Nếu ngươi cũng có thể làm ra Phật Nộ Đường Liên, ngươi trộm cái gì ta cũng có thể bất kể. Ngươi sai rồi, ta cũng sai rồi, một khắc trước, chúng ta dĩ nhiên trơ mắt nhìn cơ hội làm cho Đường Môn tái huy hoàng trước mắt trôi đi. "

Các vị trưởng lão xông tới, bọn họ thần sắc đều rất phức tạp, có nghi hoặc, có thương cảm, có thở dài, nhiều nhất vẫn là tiếc nuối.

"Các ngươi không cần nói gì cả, truyền lệnh ta, lệnh bổn môn đệ tử toàn thể xuất động, dưới Quỷ Kiến Sầu tìm Đường Tam, sống phải gặp người, chết phải thấy xác. Đồng thời, từ giờ khắc này, Đường Tam tấn thăng làm bổn môn nội môn đệ tử, nếu hắn còn sống, là người duy nhất kế thừa ta ngôi vị chưởng môn. "

"Rõ, chưởng môn. " Chúng trưởng lão đồng thời khom người tuân mệnh.

Nếu Đường Tam lúc này còn ở trên vách núi, còn có thể nghe được Đường Đại tiên sinh nói, cho dù chết, hắn cũng nhất định rất vui mừng, cố gắng của hắn cuối cùng không uổng phí. Nhưng là, tất cả đều đã muộn một chút.

Quỷ Kiến Sầu, một tảng đá rơi cũng phải mất hơn mười chín giây, tựa hồ siêu v*** +mười tám tầng địa ngục tồn tại, như thế nào có thể cho phép một người được mây mù phóng thích sống mà về? Đường Tam đi, hắn vĩnh viễn rời khỏi thế giới này, nhưng vận mệnh hắn một lần khác lại vừa mới bắt đầu.

Đấu La Đại Lục, Thiên Đấu đế quốc TâyNam, Pháp Tư Nặc hành tỉnh.

Thánh Hồn thôn, nếu là chỉ nghe kỳ danh, vậy tuyệt đối là một cái tên làm kẻ khác kinh ngạc, nhưng trên thực tế, đây bất quá chỉ là Pháp Tư Nặc hành tỉnh Nặc Đinh thành Nam một cái thôn nhỏ chỉ có hơn ba trăm hộ mà thôi. Sở dĩ tên là Thánh Hồn, là bởi vì trong truyền thuyết, trăm năm trước nơi này từng sinh ra một vị hồn sư đạt đến hồn thánh cấp bậc mà theo đó thành danh. Điều này cũng là Thánh Hồn thôn vĩnh viễn kiêu hãnh.

Bên ngoài Thánh Hồn thôn, là một khi trồng trọt rộng rãi, nơi này xuất sản lương thực cùng thực phẩm, đều cung cấp cho Nặc Đinh thành, Nặc Đinh thành trong Pháp Tư Nặc hành tỉnh mặc dù không coi là đại thành thị, nhưng nơi này dù sao khoảng cách cùng biên giới với một đế quốc khác cũng rất gần, cũng tự nhiên là một trong những nơi đầu tiên mà thương nhân hai đại đế quốc giao dịch, Nặc Đinh thành bởi vậy mà phồn vinh, theo đó làm cho cuộc sống của bình dân trong thôn trang xung quanh thành thị so với địa phương khác tốt hơn nhiều.

Trời mới tờ mờ sáng, xa xa phương đông mọc lên một mảng bạch sắc nhàn nhạt, trên một tòa tiểu sơn cao chỉ hơn trăm thước bên ngoài Thánh Hồn thôn, đã có thêm một đạo thân ảnh nhỏ gầy.

Đó là một hài tử chỉ năm, sáu tuổi, hiển nhiên, hắn thường xuyên thừa nhận sự ấm áp của mặt trời, da tay "tiểu mạch sắc" (màu hơi nâu nâu) khỏe mạnh, hắc sắc đoản phát nhìn qua rất lanh lợi, một thân quần áo mặc dù đơn giản nhưng sạch sẽ.

Đối với một tiểu hài tử như hắn mà nói, trèo lên ngọn núi cao trăm thước này cũng không phải là chuyện dễ dàng gì, nhưng kỳ quái chính là, hắn đi tới đỉnh núi nhưng mặt lại không đỏ, không thở gấp, bộ dáng rất tự đắc.

Nam hài ngồi xuống trên đỉnh núi, hai mắt hắn gắt gao nhìn về phương Đông đang dần sáng lên một màu trắng, mũi chậm rãi hít vào, miệng từ từ thở ra, hít vào liên tục, thở ra nhẹ nhàng, đúng là hình thành vòng tuần hoàn tuyệt vời.

Ngay lúc này, mắt hắn đột nhiên mở to, xa xa nơi chân trời, trong mảng bạch sắc đang sáng dần lên, phảng phất hiện lên một tia tử khí nhàn nhạt, nếu không phải có mục lực kinh người cùng không đủ chuyên chú, là tuyệt đối không cách nào phát hiện nó tồn tại.

Tử khí xuất hiện, làm nam hài tinh thần hoàn toàn tập trung lại, hắn thậm chí không hề thở ra, chỉ là từ từ hít vào rất nhẹ nhàng, đồng thời hai mắt gắt gao nhìn về phía màn tử sắc lúc ẩn lúc hiện.

Thời gian tử khí xuất hiện cũng không dài, khi phương Đông được ánh mặt trời từ từ dâng lên bao trùm thì tử khí đã hoàn toàn biến mất.

Nam hài lúc này mới chậm rãi nhắm hai mắt lại, đồng thời thở ra một hơi thật dài trọc khí trong cơ thể. Một đạo bạch sắc khí lưu giống như từ miệng hắn phun ra, sau đó từ từ tản đi.

Tĩnh tọa một hồi lâu, nam hài mới lại mở mắt, không biết có phải là tử khí triêm nhiễm không, trong đôi mắt hắn lóe lên một tầng nhàn nhạt tử ý, mặc dù tử sắc này tồn tại trong thời gian không dài rồi lặng yên thu liễm, nhưng chính lúc nó tồn tại cũng rất rõ ràng.

Chán nản thở dài, nam hài làm ra một vẻ mặt bất đắc dĩ tuyệt không nên xuất hiện ở tuổi hắn, lắc đầu, lầm bầm nói: "Vẫn không được, Huyền Thiên Công ta như trước không cách nào đột phá đệ nhất trọng bình cảnh. Đã suốt ba tháng, rốt cuộc là tại sao? Cho dù là Tử Cực Ma Đồng phải dựa vào "tử khí đông lai" (khí tím đến từ phía Đông) chỉ có thể tu luyện vào sáng sớm vẫn đang tiến bộ. Huyền Thiên Công không thể đột phá bình cảnh, Huyền Ngọc Thủ cũng vô pháp tăng lên. Lúc đầu ta tu luyện, tại đệ nhất trọng đến đệ nhị trọng, lúc đó tựa hồ cũng không gặp phải tình huống như vậy. Huyền Thiên Công tổng cộng cửu trọng, sao mà đệ nhất trọng này lại phiền toái như vậy? Chẳng lẻ, là bởi vì thế giới này cùng thế giới kia của ta vốn bất đồng sao? "

Đi tới thế giới này đã hơn năm năm, hài tử trước mắt này, đúng là Đường Tam lúc đầu ở Đường Môn "khiêu nhai minh chí" (nhảy vực chứng minh). Khi hắn từ trong hôn mê tỉnh táo lại, phát hiện ngoại trừ cảm giác ấm áp cái gì cũng không làm được. Nhưng cái chết trong dự liệu cũng không có tới, rất nhanh, hắn thông qua một quá trình dồn nén đi tới thế giới này.

Qua một thời gian rất lâu, Đường Tam mới hiểu được chuyện gì xảy ra. Chính mình không chết, nhưng đã không còn là Đường Tam trước đây.

Lúc xuất sanh, Đường Tam dùng đến gần một năm thời gian, mới học được thế giới này ngữ ngôn. Hắn còn nhớ rõ, lúc chính mình xuất sanh, mặc dù vẫn không cách nào mở mắt quan khán, nhưng nghe được một giọng nam nhân hùng hậu đang "tê tâm liệt phế" (cõi lòng tan nát) mà kêu khóc. Khi hắn học xong thế giới này ngữ ngôn, bằng vào trí nhớ hơn người nhớ lại thì, cũng chỉ có thể nhớ, nam nhân kia tựa hồ kêu lên: "Tam muội, đừng bỏ ta." Mà nam nhân kia, chính là cha hắn Đường Hạo. Mẫu thân hắn ở thế giới này, khi đó cũng đã chết trong lúc khó sanh.

Không biết là thiên ý, hay là nhân duyên trùng hợp, vì kỷ niệm thê tử chết đi, Đường Hạo đặt cho hắn một cái tên thần kỳ sao vẫn là Đường Tam.

Những đứa trẻ đồng trang đứa trong thôn thường xuyên hội lấy điều này giễu cợt hắn, nhưng Đường Tam trong lòng lại thập phần hài lòng. Dù sao cái tên này tại thế giới bên kia hắn cũng đã sử dụng gần ba mươi năm. Chỉ riêng chuyện quen thuộc cũng đã làm hắn sớm thích hai chữ này.

Đi tới thế giới này, trải qua bắt đầu là giật mình, sợ hãi, đến sau lại là hưng phấn cùng với bây giờ là bình tĩnh, Đường Tam đã hoàn toàn tiếp nhận sự thật, hắn xem ra, đây là ông trời lại cho hắn một cơ hội nữa. Kiếp trước tâm nguyện lớn nhất, có lẽ có thể trong một đời này thực hiện rồi.

Xích lõa đi tới thế giới này, nhưng Đường Tam đã có lớn nhất tài phú, đó chính là trí nhớ. Thân là Đường Môn ngoại môn xuất sắc nhất thiên tài, Đường Môn các loại "cơ quan loại ám khí" (ám khí dùng cơ quan để phát động) phương pháp chế tạo toàn bộ khắc trong óc hắn. Mà lúc đầu hắn trộm đi Đường Môn nội môn bí tịch, khát vọng trong nhiều năm đạt được, trong quá trình học tập, nội môn tối cao Huyền Thiên Bảo Lục cũng đồng dạng được hắn ghi vào trong tâm. Đường Tam hy vọng, có thể ở thế giới này lại hiện ra Đường Môn huy hoàng.

"Cần phải trở về." Đường Tam nhìn sắc trời, thân thể gầy gò phóng lên, hướng dưới chân núi chạy đi. Nếu lúc này có người thấy hắn, nhất định sẽ kinh ngạc đích mở to hai mắt nhìn, hắn mỗi bước bước ra, cũng có thể gần một trượng, những hố bất không bằng phẳng trên mặt đất đối với hắn mà nói căn bản không có ảnh hưởng gì, dễ dàng né tránh, trong lúc đó cấp tốc bước đi, so với người trưởng thành còn muốn nhanh hơn nhiều.

Đường Môn tinh túy là cái gì? Ám khí, độc dược cùng khinh công. Đường Môn nội môn cùng ngoại môn khác nhau lớn nhất, chính là phương pháp sử dụng ám khí. Ngoại môn lấy cơ quan loại là chính, mà nội môn lại là thủ pháp chân chính. Độc dược bình thường là ngoại môn mới dùng, nội môn đích truyền đệ tử ám khí rất ít dụng độc, bởi vì bọn họ căn bản không cần.
', 3);
insert into Chuong(ten_C, noiDung, id_Tr)
	values(N'Chương 1: Tiểu tư quyets rát', N'Trời mới tờ mờ sáng, Dương Khai đã tỉnh dậy, rửa mặt qua loa rồi cầm cái chổi trong góc bước ra khỏi căn phòng nhỏ đơn độc.

Đứng ở cửa vươn vai một cái, nhìn thấy phía đường chân trời đã hiện lên chút ánh sáng. Hắn nhắm mắt tập trung để hưởng thụ khoảnh khắc thanh tịnh này rồi lại ngay lập tức mở mắt ra bắt đầu cầm chổi quét dọn, chăm chú dọn sạch đám bụi bặm và lá rụng trước mặt.

Y phục màu xanh, giản dị mà sạch sẽ. Màu sắc già dặn của bộ trang phục vô tình làm cho cậu thiếu niên già đi mấy tuổi. Lưng Dương Khai thẳng tắp như cây lao. Mặc dù đang làm công việc thấp hèn nhưng thần sắc trên mặt cũng tỏ rõ sự cẩn thận, tỉ mỉ. Động tác rất trầm ổn, hai tay cầm chổi cũng không dùng nhiều lực, cũng không đong đưa người nhiều, chỉ bằng sự chuyển động của cổ tay, cái chổi kia trở nên dễ dàng sai khiến, đưa đi đưa lại, di chuyển theo từng bước chân hắn. Trên mặt đất, từng đám bụi đất và lá rụng chuyển động một cách thần kỳ, dường như bỗng nhiên mọc thêm đôi chân.

Dương Khai là đệ tử của Lăng Tiêu các, ba năm trước đã gia nhập tông môn bắt đầu tu luyện nhưng cho đến nay vẫn chỉ mới tu luyện đến Thối Thể cảnh tầng ba. Các sư huynh đệ cùng hắn nhập môn đã sớm vượt xa giai đoạn này, có những người còn có được cơ duyên bái nhập các vị cao nhân tọa hạ trong môn phái và thăng tiến rất nhanh. Còn hắn chỉ có thể lực bất tòng tâm.

Ba năm Thối Thể tầng ba, loại tư chất này không thể dùng hai chữ bình thường để hình dung ra được mà phải nói là vô cùng bình thường.

Không còn cách nào khác, Dương Khai chỉ có thể tiếp tục ở lại tông môn quét rác, vừa duy trì kế sinh nhai, vừa khổ sở tu luyện.

Lăng Tiêu các là một môn phái khá đặc biệt. Đặc biệt ở chỗ các đệ tử môn hạ phải cạnh tranh tàn khốc. Trong môn phái này, người có năng lực sẽ được thăng tiến, người không có năng lực sẽ bị đào thải. Quy luật cá lớn nuốt cá bé ở Lăng Tiêu các này diễn ra vô cùng thuần thục.

Các tông môn khác có lẽ còn có chút tình bạn đồng môn hay tình nghĩa thủ túc, nhưng ở Lăng Tiêu các này tuyệt đối không có! Nếu muốn thăng tiến chỉ có một con đường duy nhất là đạp lên vai những người gọi là sư huynh đệ, giẫm lên máu tươi của họ, như vậy mới được coi là có tư cách.

Lăng Tiêu các ra quy định rất nghiêm ngặt, là môn phái danh tiếng lẫy lừng trong Đại Hán triều này. Dù không phải đại môn phái cao siêu gì nhưng sự tranh đấu tàn khốc giữa các môn hạ đệ tử thì đúng là số một, không môn phái nào sánh bằng! Cũng chính vì vậy mà các đệ tử ai nấy đều võ phong dũng mãnh, trên giang hồ không có mấy ai dám trêu chọc.

Lăng Tiêu các có một quy tắc, các đệ tử dưới mười bốn tuổi bất kể là ai, trong ba năm kể từ khi nhập môn được xem như thời gian thí luyện. Trong vòng ba năm này, việc ăn ở đều do tông môn phụ trách, đệ tử chỉ cần tập trung tu luyện. Trong thời gian ba năm, nếu có thể phá được Thối Thể kỳ thì sẽ có tư cách bái nhập các cao thủ trong tông môn làm đồ đệ, được các vị cao thủ này chỉ dạy tu luyện. Đương nhiên cũng có thể không bái sư mà tự mình tu luyện, nhưng con đường tu luyện có lương sư dạy bảo và tự mình tu luyện cũng hoàn toàn khác nhau. Tới một mức độ nào đó mà nói, quy tắc này của Lăng Tiêu các cũng có một chút tự do.
Còn những kẻ trong vòng ba năm vẫn chưa phá được Thối Thể kỳ thì hoặc là bị trục xuất khỏi tông môn, hoặc là bị giáng chức xuống thành đệ tử thí luyện.

Đệ tử thí luyện, đó chính là thân phận hiện tại của Dương Khai! Cũng là nỗi sỉ nhục của Lăng Tiêu các!

Không giống như các đệ tử khác, đệ tử thí luyện sinh tồn trong một môi trường vô cùng hà khắc. Vì đã lâm vào hoàn cảnh này nên tất cả mọi việc ăn mặc ngủ nghỉ đều phải tự làm, tông môn sẽ không tốn thêm bất cứ thứ của cải tu luyện nào cho đệ tử thí luyện nữa. Một khi đã bị giáng xuống làm đệ tử thí luyện thì cuộc đời này vĩnh viễn không thể có ngày nổi danh được nữa rồi. Trừ phi trong khoảng thời gian ngắn có sự tiến bộ cực lớn, các tông môn khác cảm thấy ngươi có đủ điều kiện để gia nhập.

Toàn bộ Lăng Tiêu các có ba nghìn đệ tử mà có mấy đệ tử thí luyện? Số lượng chỉ đếm trên đầu ngón tay! Dương Khai may mắn trở thành một trong số đó!

Đệ tử thí luyện muốn tiếp tục sinh tồn trong Lăng Tiêu các quả thực khó như lên trời. Cứ ví dụ như căn nhỏ mà Dương Khai đang sống bây giờ chính là căn phòng do tự tay hắn dùng từng tấm gỗ dựng nên, mấy cái lỗ trên nóc nhà vẫn chưa có thời gian sửa chữa, mỗi khi trời mưa căn phòng nhỏ liền bị dột, nước không thoát ra được. Y phục cũng là do tự hắn mua, đồ ăn cũng tự hắn làm, tất cả đều tự hắn lo lấy.

Căn phòng nhỏ cũng nằm ở vị trí hẻo lánh nhất trong Lăng Tiêu các, không hề có người hỏi thăm đến.
Sự đãi ngộ tồi tệ như vậy, người bình thường rất khó có thể tiếp tục chịu đựng. Đây cũng là lý do khiến cho số lượng đệ tử thí luyện của Lăng Tiêu các vô cùng ít. Về cơ bản các đệ tử không phá nổi cảnh giới trong Thối Thể kỳ đều chọn con đường rời khỏi Lăng Tiêu các, nhưng Dương Khai lại lưu lại nơi đây.

Đã bị người ta đuổi ra khỏi nhà một lần, lần này sao có thể lại như thế nữa được chứ?

Mấy tháng trước, sau khi bị giáng xuống làm đệ tử thí luyện, Dương Khai liền ở trong tông môn quét rác kiếm sống.

Có thể nói bây giờ Dương Khai là đệ tử thí luyện của Lăng Tiêu các, cũng là tiểu tư quét rác trong Lăng Tiêu các. Nhưng công việc quét rác cũng không làm Dương Khai ấm no được. Hắn khi đói khi no, lúc bị phong hàn cũng không có ai thăm hỏi, sống cuộc sống đau thương sầu khổ đến cô độc. Ngay cả như thế, Dương Khai cũng chưa từng muốn lùi bước. Con người sinh ra trên đời, tính ra có mấy chục năm, bản thân đã lựa chọn con đường này thì sẽ tiếp tục đi đến cùng, bỏ dở giữa chừng là chuyện mà nam nhân không thể làm được.

Dương Khai có bản tính bền bỉ, không gặp ngõ cụt thì quyết không quay đầu lại!

Trời dần sáng, Dương Khai đã quét dọn được một hồi, nơi đây đã sạch sẽ, không còn bụi bẩn nữa.

Quét rác tuy rằng không tiêu hao khí lực gì nhưng sáng sớm chưa ăn gì mà đã phải làm việc lâu như vậy, Dương Khai mệt đến toàn thân mồ hôi đầm đìa. Điều này không phải vì thực lực có vấn đề mà hoàn toàn là vì thể chất quá kém.

Ba bữa cơm thì có hai bữa đói, cho dù ai ở vào trong hoàn cảnh của Dương Khai thì thể chất cũng không thể tốt được.

Dần dần có mấy đệ tử Lăng Tiêu các vây quanh hắn, những đệ tử này đều dậy rất sớm, không đi tu luyện mà lại vây quanh Dương Khai. Rất nhiều người còn hăng hái đánh giá Dương Khai, cũng có những người ánh mắt tham lam xem Dương Khai bây giờ như một mỹ nữ đang trần như nhộng, toàn thân tỏa ra hương thơm như chiếc bánh thơm ngon.

Nhưng trong số những đệ tử vây quanh Dương Khai, cũng có một bầu không khí cạnh tranh căng thẳng đang bao trùm, cảnh giác quan sát các sư huynh đệ bên cạnh, sắc mặt người nào người nấy đều không tốt.

Trong đám đông có một người lộ rõ vẻ không đành lòng, hạ giọng nói:

- Nhiều người như vậy, đúng là có phần quá đáng rồi!

Lập tức liền có người trả lời:

- Nếu ngươi cảm thấy nhiều người thì có thể rời đi, không ai cần ngươi lưu lại.

Một câu khiến cho tên kia ngượng ngùng không nói. Tất cả mọi người đều biết vì sao lại tụ tập ở đây, đều biết vì sao lại nhìn chằm chằm vào Dương Khai. Hiện tại chính là đang chờ đợi thời khắc đó đến. Thời khắc đó đã sắp đến rồi, bây giờ mà bỏ đi chẳng phải là rất đáng tiếc sao? Nếu như có thể đoạt vị trí đứng đầu thì hôm nay đúng là bội thu.

Mọi động tĩnh xung quanh, Dương Khai tất nhiên đều biết, chỉ là thần sắc hắn vẫn luôn không thay đổi. Cứ năm ngày hắn lại trải qua một trận chiến như vậy, một tháng sáu lần. Thực sự bây giờ cũng không có gì đáng kinh ngạc, hơn nữa thấy những người trước mắt cũng có ít đi, chắc là họ chưa đến đủ.
Cho nên hắn vẫn cứ quét rác, mặc kệ không hỏi han đến những người xung quanh, vừa đi vừa quét.

Thời gian cứ trôi qua, số lượng người tụ tập bên cạnh Dương Khai càng ngày càng nhiều, phỏng chừng ít nhất cũng có trên ba bốn mươi người.

Dương Khai đột nhiên dừng lại, cứ ngồi giữa đường như vậy, chậm rãi hít một hơi, khôi phục thể lực hắn đã tiêu hao từ sáng sớm tinh mơ đến giờ.

Vừa thấy động tĩnh này, những kẻ vây quanh Dương Khai liền tản ra, bao vây hắn vào giữa. Bầu không khí cạnh tranh căng thẳng bỗng nhiên vụt đến một cảnh giới mới, dường như ngay cả không khí cũng trở nên đông cứng lại.

Mọi người ai cũng thấy không vừa mắt, tuy nhiên đều nhìn Dương Khai với ánh mắt vô cùng trông đợi.

Nếu để cho người không rõ chân tướng chứng kiến cảnh tượng này, chỉ sợ sẽ nghĩ rằng người đang bị vây bủa trong đám đông kia chính là một tuyệt đại cao thủ, bằng không tại sao lại điều động nhiều người như vậy để đối phó với hắn? Nhưng trên thực tế, Dương Khai chỉ là đệ tử thí luyện của Thối Thể cảnh tầng ba mà thôi, mọi người ở đây đều lợi hại hơn Dương Khai.

- Dương Khai, ngươi đừng phí tâm sức vô ích nữa, đợi lát nữa ngoan ngoãn để ta đánh gục, mọi người cũng tiết kiệm thời gian đúng không nào?

Có người nhìn thấy bộ dạng Dương Khai như vậy lập tức có chút khinh thường nói.

Có mỗi cái Thối Thể tầng ba còn khôi phục làm gì nữa? Dù sao cũng phải thua, chi bằng rõ ràng một chút, hà tất phải kéo dài hơi tàn đó nữa?

- Đúng vậy, đúng vậy. Dương Khai, ngươi cũng nên thông cảm một chút với các chư vị sư huynh đệ, ngươi không giống với chúng ta, đánh xong trận này chúng ta còn phải đi tu luyện nữa.

Lời nói này giống như là Dương Khai nên nhanh chóng bại dưới tay chúng. Như vậy, việc Dương Khai đang khôi phục thể lực cũng tức là một hành động bất kính với họ rồi.

Dương Khai làm lơ, giống như lão tăng ngồi thiền.

Thời gian tiếp tục trôi qua, bỗng nhiên một tiếng chuông du dương mênh mông vang lên, đó là tiếng chuông buổi sáng của Lăng Tiêu các. Tiếng chuông truyền đến tai mọi người, các đệ tử đang vây quanh Dương Khai nhất tề tinh thần chấn động.

Chín tiếng chuông vang lên, mặt trời đã mọc, một ngày mới lại đến!

Hơi thở của mọi người đột nhiên chùng xuống, đôi mắt trông mong nhìn vào Dương Khai đang bị vây ở giữa. Dương Khai chậm rãi đứng dậy, cầm theo cái chổi trên tay, thản nhiên nhìn lướt qua một lượt những người đang vây quanh mình.

- Chọn ta đi Dương sư huynh!

Có người cao giọng nói.

- Ta xuống tay rất nhẹ thôi, cam đoan sẽ không làm ngươi đau!

- Nói xạo! Chọn ta đi, ta sẽ xử lý nhanh thôi, một quyền là xong, tuyệt đối sẽ không lãng phí thời gian của mọi người.

- Chọn ta!

- Chọn ta!

Trong sân ồn ào hẳn lên, giống như các lái thương đang tích cực mời chào rau quả được trồng trong chính vườn nhà mình, lại còn liều mạng so sánh xem của ai tươi ngon hơn.

- Dương Khai, ngươi đừng phá vỡ quy định mà mình đã đặt ra!

Có người lên tiếng nhắc nhở.

Dương Khai khẽ cười, tiện tay ném chổi lên trời. Ánh mắt mọi người đồng loạt hướng lên nhìn, tràn đầy mong chờ, đợi thời điểm cái chổi rơi xuống đất, mọi người trong lòng đều đang cầu nguyện:

- Chọn ta, chọn ta đi!

Thời gian dường như chậm lại, cái chổi xoay vài vòng trên không trung rồi chợt rơi xuống, nảy lên trên mặt đất rồi bất động.

Cán chổi chỉ vào một thiếu niên thân hình khôi ngô cường tráng.

Một loạt những âm thanh oán hận vang lên, tràn đầy u oán và không cam lòng. Ngược lại thiếu niên khôi ngô kia cười ha hả từ trong đám đông kia đi ra, chắp tay làm lễ với mọi người cười nói:

- Chư vị sư huynh đệ, trận đấu ngày hôm nay tiểu đệ đã nắm được rồi, mong rằng các vị sư huynh đệ chớ trách mắng.

- Chết tiệt, chó ngáp phải ruồi!

Có người đố kỵ không ngớt.

- Tại sao lại không chọn ta chứ, cứ năm ngày ta đều tới một lần, đến đây đã tròn một tháng rồi, là Dương Khai ngươi cố ý đúng không?

- Đừng nói nữa, ta đến đây ba tháng rồi, còn chưa được chọn lấy một lần!

- Sư huynh, huynh còn thảm hơn đệ nữa.

- Không thảm không thảm, là xem kịch vui mới đúng.

Hai sư huynh đệ liếc nhau, ngầm hiểu rồi cười.

Giữa sân, những người khác đã tản ra, chỉ để lại Dương Khai và thiếu niên khôi ngô đang nhìn nhau.

- Đệ tử thí luyện Dương Khai, Thối Thể tầng ba!

Dương Khai nhìn đối phương nói.

- Đệ tử phổ thông Chu Định Quân, Thối Thể tầng năm!

Thiếu niên khôi ngô tự giới thiệu.

Các đệ tử Lăng Tiêu các cũng được phân cấp theo trình tự, từ dưới lên trên đó là năm cấp bậc: đệ tử thí luyện, đệ tử phổ thông, đệ tử tọa hạ, đệ tử tinh anh, đệ tử hạch tâm. Chu Định Quân nói hắn là đệ tử phổ thông, đó là do hắn vẫn chưa bái nhập cao thủ môn hạ trong tông môn, tức là chưa được lương sư chỉ dạy. Nếu là phá được Thối Thể kỳ, bái nhập cao thủ môn hạ trong tông môn, tức là một đệ tử tọa hạ. Cao thêm một cấp nữa đó là đệ tử tinh anh, đều là những người xuất chúng, được tuyển chọn từ đệ tử tọa hạ lên.

Còn đệ tử hạch tâm là hy vọng đời sau của Lăng Tiêu các. Trong tông môn, những người này được bồi dưỡng để trở thành người kế nghiệp tương lai.

Chế độ nhiều cấp bậc đệ tử, dường như là không hợp tình hợp lý nhưng lại có thể phát huy tâm huyết và ý chí cạnh tranh của người trẻ tuổi, đây cũng là căn cơ của chế độ tàn khốc trong Lăng Tiêu các.

Còn nguyên nhân cơ bản khiến cho Dương Khai bị vô số người tranh giành lại là một quy tắc khác của Lăng Tiêu các, quy tắc khiêu chiến.
', 1);

create table Chuong_HinhAnh(
	id int primary key auto_increment,
    ten_H varchar(50) not null,
    id_C int,
    foreign key (id_C) references Chuong(id)
);