CREATE DATABASE QuanLyThongTinDoDungTheThao
WITH ENCODING 'UTF8'
LC_COLLATE='en_US.UTF-8'
LC_CTYPE='en_US.UTF-8'
TEMPLATE=template0;

-- Bảng Loại đồ dùng thể thao
CREATE TABLE LoaiDoDung (
    MaLoai SERIAL PRIMARY KEY,
    TenLoai VARCHAR(100) NOT NULL UNIQUE,
    MoTa TEXT
);

-- Bảng Đồ dùng thể thao 
CREATE TABLE DoDungTheThao (
    MaDoDung SERIAL PRIMARY KEY,
    TenDoDung VARCHAR(100) NOT NULL,
    MaLoai INT REFERENCES LoaiDoDung(MaLoai),
    ThuongHieu VARCHAR(100),
    Gia DECIMAL(10, 2),
    SoLuong INT DEFAULT 0,
    MoTa TEXT,
    HinhAnh VARCHAR(255)
);

-- Bảng Khách hàng
CREATE TABLE KhachHang (
    MaKhachHang SERIAL PRIMARY KEY,
    HoTen VARCHAR(100),
    SoDienThoai VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    DiaChi TEXT
);

-- Cập nhật cấu trúc bảng HoaDon
CREATE TABLE HoaDon (
    MaHoaDon SERIAL PRIMARY KEY,
    MaKhachHang INT REFERENCES KhachHang(MaKhachHang),
    MaDoDung INT REFERENCES DoDungTheThao(MaDoDung),
    SoLuong INT NOT NULL,
    GiaTien DECIMAL(10, 2) NOT NULL,
    TongTien DECIMAL(10, 2) GENERATED ALWAYS AS (SoLuong * GiaTien) STORED,
    NgayTao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Thêm loại đồ dùng thể thao
INSERT INTO LoaiDoDung (TenLoai, MoTa)
VALUES
('Bóng đá', 'Các sản phẩm liên quan đến bóng đá.'),
('Bóng rổ', 'Các sản phẩm liên quan đến bóng rổ.'),
('Cầu lông', 'Các sản phẩm liên quan đến cầu lông.');

-- Thêm đồ dùng thể thao 
INSERT INTO DoDungTheThao (TenDoDung, MaLoai, ThuongHieu, Gia, SoLuong, MoTa, HinhAnh)
VALUES
('Quả bóng đá Adidas', 1, 'Adidas', 350000, 100, 'Quả bóng đá tiêu chuẩn FIFA.', 'https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/9668e7240f094da6bb4f226f252a0a8f_9366/bong-vong-loai-ucl-pro-24-25.jpg'),
('Giày bóng đá Nike', 1, 'Nike', 1200000, 50, 'Giày đá bóng chính hãng.', 'https://bizweb.dktcdn.net/thumb/grande/100/180/757/products/1508242giay-bong-da-nike-jpeg.jpg'),
('Quả bóng rổ Spalding', 2, 'Spalding', 500000, 30, 'Quả bóng rổ chuyên dụng.', 'https://bizweb.dktcdn.net/thumb/grande/100/180/757/products/qua-bong-ro-spalding.jpg'),
('Vợt cầu lông Yonex', 3, 'Yonex', 800000, 20, 'Vợt cầu lông cao cấp.', 'https://product.hstatic.net/200000264441/product/sb126855ea26e460bb0eec7b26a036f8bq_5f770e26eb55414588a79f6bc4d5cd4f_1024x1024.jpg');

-- Thêm khách hàng
INSERT INTO KhachHang (HoTen, SoDienThoai, Email, DiaChi)
VALUES
('Nguyễn Văn A', '0901234567', 'nguyenvana@example.com', '123 Đường ABC, Hà Nội'),
('Trần Thị B', '0912345678', 'tranthib@example.com', '456 Đường XYZ, TP.HCM');

-- Chèn dữ liệu vào bảng HoaDon
INSERT INTO HoaDon (MaKhachHang, MaDoDung, SoLuong, GiaTien)
VALUES
(1, 1, 2, 350000), -- Nguyễn Văn A mua 2 quả bóng đá Adidas
(1, 2, 1, 1200000), -- Nguyễn Văn A mua 1 đôi giày bóng đá Nike
(2, 3, 1, 500000), -- Trần Thị B mua 1 quả bóng rổ Spalding
(2, 4, 2, 800000); -- Trần Thị B mua 2 vợt cầu lông Yonex

	SELECT * FROM LoaiDoDung;
	SELECT * FROM DoDungTheThao;
	SELECT * FROM KhachHang;
	SELECT * FROM HoaDon; 