

-- Tạo bảng User1 (Người dùng)
CREATE TABLE User1 (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    fullname NVARCHAR(255),
    email NVARCHAR(255) UNIQUE NOT NULL,
    phonenum NVARCHAR(20),
    avatar NVARCHAR(255),
    role TINYINT NOT NULL DEFAULT 2,  -- Mặc định là 2 (Customer)
    password NVARCHAR(255) NOT NULL,
    address NVARCHAR(MAX)
);

-- Tạo bảng Category1 (Loại keo)
CREATE TABLE Category1 (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL
);

-- Tạo bảng Product1 (Sản phẩm keo dán)
CREATE TABLE Product1 (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    cid INT FOREIGN KEY REFERENCES Category1(id) ON DELETE CASCADE,
    image NVARCHAR(255),
    describe NVARCHAR(MAX)
);

-- Tạo bảng Order1 (Đơn hàng)
CREATE TABLE Order1 (
    id INT IDENTITY(1,1) PRIMARY KEY,
    date DATETIME DEFAULT GETDATE(),
    cid INT FOREIGN KEY REFERENCES User1(id) ON DELETE CASCADE,
    totalmoney DECIMAL(10,2) NOT NULL
);

-- Tạo bảng OrderLine1 (Chi tiết đơn hàng)
CREATE TABLE OrderLine1 (
    oid INT FOREIGN KEY REFERENCES Order1(id) ON DELETE CASCADE,
    pid INT FOREIGN KEY REFERENCES Product1(ID) ON DELETE CASCADE,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (oid, pid)  -- Đảm bảo không có sản phẩm trùng trong một đơn hàng
);

-- insert 
INSERT INTO User1 (name, fullname, email, phonenum, avatar, password, address) VALUES 
(N'tamnguyen', N'Nguyễn Tâm', 'tam@gmail.com', '0987654321', 'user1.jpg', '123456', N'Hà Nội'),
(N'nguyentam', N'Tấm Nguyễn', 'huong@gmail.com', '0987654321', 'user2.jpg', '654321', N'Hà Nội');
INSERT INTO User1 (name, fullname, email, phonenum, avatar, role, password, address) VALUES 
(N'admin', N'Quản trị viên', 'admin@keodan.com', '0909090909', 'admin.jpg', 1, 'admin', N'Hà Nội');
INSERT INTO Category1 (name) VALUES 
(N'Keo dán sắt'),
(N'Keo dán gỗ'),
(N'Keo dán nhựa'),
(N'Keo dán gạch');
INSERT INTO Product1 (name, price, cid, image, describe) VALUES 
(N'Keo dán sắt 502', 25000, 1, 'vn-11134207-7qukw-lhzm55kkjqmdf1.jpg', N'Keo dán siêu chắc cho kim loại.'),
(N'Keo dán gỗ Titebond', 120000, 2, 'Keo-sua-dan-go-Titebond-500ml-1200x992.jpg', N'Keo chuyên dụng cho gỗ, chịu nước.'),
(N'Keo dán nhựa đa năng', 35000, 3, '1154-1135314344_1473199604.jpg', N'Keo phù hợp cho nhựa PVC, ABS.')
