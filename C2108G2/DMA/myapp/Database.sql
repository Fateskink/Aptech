-- Users table (Bảng người dùng)
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT, -- ID người dùng
    username NVARCHAR(50) UNIQUE NOT NULL, -- Tên đăng nhập
    password NVARCHAR(255) NOT NULL, -- Mật khẩu
    email NVARCHAR(255) UNIQUE NOT NULL, -- Email
    phone NVARCHAR(20) NOT NULL, -- Số điện thoại
    full_name NVARCHAR(255), -- Họ và tên
    date_of_birth DATE, -- Ngày sinh
    country NVARCHAR(255) -- Quốc gia
);

-- Stocks table (Bảng cổ phiếu)
CREATE TABLE stocks (
    stock_id INT PRIMARY KEY AUTO_INCREMENT, -- ID cổ phiếu
    symbol NVARCHAR(10) UNIQUE NOT NULL, -- Mã cổ phiếu
    company_name NVARCHAR(255) NOT NULL, -- Tên công ty
    market_cap DECIMAL(18, 2), -- Vốn hóa thị trường
    sector NVARCHAR(100), -- Ngành
    industry NVARCHAR(100) -- Lĩnh vực
);

-- Watchlists table (Bảng danh sách theo dõi)
CREATE TABLE watchlists (
    user_id INT FOREIGN KEY REFERENCES users(user_id), -- ID người dùng
    stock_id INT FOREIGN KEY REFERENCES stocks(stock_id) -- ID cổ phiếu
);

-- Orders table (Bảng đơn hàng)
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT, -- ID đơn hàng
    user_id INT FOREIGN KEY REFERENCES users(user_id), -- ID người dùng
    stock_id INT FOREIGN KEY REFERENCES stocks(stock_id), -- ID cổ phiếu
    order_type NVARCHAR(20), -- Loại đơn hàng (ví dụ: market, limit, stop)
    direction NVARCHAR(20), -- Hướng (ví dụ: buy, sell)
    quantity INT, -- Số lượng
    price DECIMAL(18, 4), -- Giá
    status NVARCHAR(20), -- Trạng thái (ví dụ: pending, executed, canceled)
    order_date DATETIME -- Ngày đặt hàng
);

-- Order types available values (Giá trị có sẵn của loại đơn hàng)
-- "market", "limit", "stop"

-- Order directions available values (Giá trị có sẵn của hướng đơn hàng)
-- "buy", "sell"

-- Order statuses available values (Giá trị có sẵn của trạng thái đơn hàng)
-- "pending", "executed", "canceled"

-- Portfolios table (Bảng danh mục đầu tư)
CREATE TABLE portfolios (
    user_id INT FOREIGN KEY REFERENCES users(user_id), -- ID người dùng
    stock_id INT FOREIGN KEY REFERENCES stocks(stock_id), -- ID cổ phiếu
    quantity INT, -- Số lượng
    purchase_price DECIMAL(18, 4), -- Giá mua
    purchase_date DATETIME -- Ngày mua
);

-- Notifications table (Bảng thông báo)
CREATE TABLE notifications (
    notification_id INT PRIMARY KEY AUTO_INCREMENT, -- ID thông báo
    user_id INT FOREIGN KEY REFERENCES users(user_id), -- ID người dùng
    notification_type NVARCHAR(50), -- Loại thông báo (ví dụ: order_executed, price_alert, news_event)
    content TEXT NOT NULL, -- Nội dung thông báo
    is_read BOOLEAN DEFAULT 0, -- Đánh dấu đã đọc hay chưa đọc (1: đã đọc, 0: chưa đọc)
    created_at DATETIME -- Thời điểm tạo thông báo
);

-- Notification types available values (Giá trị có sẵn của loại thông báo)
-- "order_executed", "price_alert", "news_event"
-- Educational resources table (Bảng tài liệu giáo dục)
CREATE TABLE educational_resources (
    resource_id INT PRIMARY KEY AUTO_INCREMENT, -- ID tài liệu
    title NVARCHAR(255) NOT NULL, -- Tiêu đề
    content TEXT NOT NULL, -- Nội dung
    category NVARCHAR(100), -- Danh mục (ví dụ: đầu tư, chiến lược giao dịch, quản lý rủi ro)
    date_published DATETIME -- Ngày xuất bản
);

-- Educational resource categories available values (Giá trị có sẵn của danh mục tài liệu)
-- "đầu tư", "chiến lược giao dịch", "quản lý rủi ro"

-- Linked bank accounts table (Bảng tài khoản ngân hàng liên kết)
CREATE TABLE linked_bank_accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT, -- ID tài khoản
    user_id INT FOREIGN KEY REFERENCES users(user_id), -- ID người dùng
    bank_name NVARCHAR(255) NOT NULL, -- Tên ngân hàng
    account_number NVARCHAR(50) NOT NULL, -- Số tài khoản
    routing_number NVARCHAR(50), -- Số định tuyến
    account_type NVARCHAR(50) -- Loại tài khoản (ví dụ: checking, savings)
);

-- Linked bank account types available values (Giá trị có sẵn của loại tài khoản ngân hàng)
-- "checking", "savings"

-- Transactions table (Bảng giao dịch)
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT, -- ID giao dịch
    user_id INT FOREIGN KEY REFERENCES users(user_id), -- ID người dùng
    linked_account_id INT FOREIGN KEY REFERENCES linked_bank_accounts(account_id), -- ID tài khoản liên kết
    transaction_type NVARCHAR(50), -- Loại giao dịch (ví dụ: deposit, withdrawal)
    amount DECIMAL(18, 2), -- Số tiền
    transaction_date DATETIME -- Ngày giao dịch
);

-- Transaction types available values (Giá trị có sẵn của loại giao dịch)
-- "deposit", "withdrawal"
