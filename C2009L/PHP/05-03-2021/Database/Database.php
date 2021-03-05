<?php
const SERVER_NAME = "localhost";
const DB_NAME = "abc12";
const DB_USERNAME = "root";
const DB_PASSWORD = "";
class Database {
    
    private $connection;
    //ham khoi tao
    public function __construct(){
        try {
            //$connectionString = "mysql:host=".SERVER_NAME.";dbname=".DB_NAME;
            $connectionString = "mysql:host=".SERVER_NAME;
            $this->connection = new PDO($connectionString, DB_USERNAME, DB_PASSWORD);
            //echo "<h1>Connect DB successfully</h1>";
            $this->createDatabaseAndTables();
        }catch(PDOException $exception) {
            //echo "Error connect to DB: ".$exception->getMessage();
            $connectionString = NULL;
        }
        //
    }
    //ham tao table
    public function createDatabaseAndTables(){
        //Gui cau lenh SQL 
        try {
            $sql = "CREATE DATABASE IF NOT EXISTS ".DB_NAME;
            $this->connection->exec($sql);
            $sql = "use ".DB_NAME;
            $this->connection->exec($sql);
            $sql = "CREATE TABLE IF NOT EXISTS abc12users (".
                "USERNAME VARCHAR(200) NOT NULL UNIQUE,".
                "PASSWORD_HASH CHAR(100) NOT NULL,".
                "PHONE VARCHAR(10)".
            ");";
            $this->connection->exec($sql);
            //echo "createDatabaseAndTables success";
            //exec = execute
        }catch(PDOException $exception) {
            echo "Error createDatabaseAndTables: ".$exception->getMessage();
        }
    }
    public function registerUser($username, $password, $phone){
        //dang ky thanh cong => tra ve true
        //neu ko thanh cong, tra ve false
        try {
            //check ton tai
            $sql = "SELECT COUNT(*) AS numberOfUsers FROM abc12users".
                   " WHERE USERNAME = :username";
            $stmt = $this->connection->prepare($sql);
            $stmt->bindParam(':username', $username);
            $stmt->setFetchMode(PDO::FETCH_ASSOC);
            $stmt->execute();
            $resultSet = $stmt->fetchAll();
            foreach ($resultSet as $row) {
                $count = intval($row["numberOfUsers"]);
                if($count > 0) {
                    //echo "The user exists";
                    //return FALSE;//tra ve ket qua(true / false) VA "tai sao loi"
                    //ham se tra ve 3 gia tri ?
                    //Cach 1:
                    //tra ve 1 object co 3 thuoc tinh: result: true/false
                    //errorMessage: "The user exists"
                    //errorCode: 300, 301, do ta tu dinh nghia
                    //goi doi tuong nay la Response
                    //Cach 2: cho cac thuoc tinh errorMessage,errorCode, result vao 1 
                    //associative array (json object)
                    
                    //return new Response(FALSE, 300, "User exists");//cach 1
                    //Cach 2: dung associative array
                    return array(   "result" => FALSE, 
                                    "errorCode" => 300, 
                                    "errorMessage" => "User exists" 
                    );
                }     
            }
                
            $sql = "INSERT INTO abc12users(USERNAME, PASSWORD_HASH, PHONE)".
                    " VALUES(:username, :password, :phone)";
            $stmt = $this->connection->prepare($sql);
            $stmt->bindParam(':username', $username);
            $stmt->bindParam(':password', $password);
            $stmt->bindParam(':phone', $phone);
            $stmt->execute();
            
            //echo "register user successful";
            //exec = execute                        
            //return new Response(TRUE, 200, "Insert user successfully");//cach 1
            //cach 2: 
            return array(   "result" => TRUE, 
                             "errorCode" => 200, 
                             "errorMessage" => "Insert user successfully"
                    );
        }catch(PDOException $exception) {
            //echo "Error createDatabaseAndTables: ".$exception->getMessage();
            //return new Response(FALSE, 300, $exception->getMessage());//cach 1
            //cach 2
            return array("result" => FALSE, 
                        "errorCode" => 300, 
                        "errorMessage" => $exception->getMessage()
                    );
        }
    }
}
?>