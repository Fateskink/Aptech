import pyodbc

def create_connection():
    server = 'localhost,1434'
    database = 'StockApp'
    username = 'sa'
    password = 'Abc123456789@'
    driver= '{SQL Server}'
    connection = pyodbc.connect(f'DRIVER=SQL Server;SERVER={server};DATABASE={database};UID={username};PWD={password}')
    return connection
