from datetime import datetime, timedelta
import random
import db

def insert_100k_records():
    conn = db.create_connection()
    cursor = conn.cursor()

    # Kiểm tra số lượng bản ghi hiện có trong bảng
    cursor.execute('SELECT COUNT(*) FROM quotes')
    row = cursor.fetchone()
    count = row[0]
    if count >= 100000:
        print('Đã có đủ 100000 bản ghi.')
        return

    # Thêm 100000 bản ghi fake
    start_date = datetime(2019, 1, 1)
    end_date = datetime(2022, 3, 31)
    delta = end_date - start_date
    for i in range(100000):
        stock_id = random.randint(1, 28)
        price = round(random.uniform(1, 100), 2)
        change = round(random.uniform(-10, 10), 2)
        percent_change = round(change / price * 100, 2)
        volume = random.randint(1000, 1000000)
        time_stamp = start_date + timedelta(days=random.randint(0, delta.days))
        sql = "INSERT INTO quotes (stock_id, price, change, percent_change, volume, time_stamp) VALUES (?, ?, ?, ?, ?, ?)"
        values = (stock_id, price, change, percent_change, volume, time_stamp)
        cursor.execute(sql, values)

    conn.commit()
    print('Thêm dữ liệu thành công.')

def insert_random_quotes(conn_str):
    conn = db.create_connection()
    cursor = conn.cursor()

    while True:
        stock_id = random.randint(1, 28)
        price = round(random.uniform(100, 1000), 2)
        change = round(random.uniform(-50, 50), 2)
        percent_change = round(random.uniform(-5, 5), 2)
        volume = random.randint(1000, 10000)
        time_stamp = datetime.now()

        query = f"INSERT INTO quotes(stock_id, price, change, percent_change, volume, time_stamp) VALUES ({stock_id}, {price}, {change}, {percent_change}, {volume}, '{time_stamp}')"
        cursor.execute(query)
        conn.commit()

        time.sleep(5)