<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
        require "./Employee.php";
        require "./Settings.php";
        echo "<h1>tim hieu ve variables</h1>";
        function doSomething() {
            //global $x;
            $GLOBALS["x"] = 10;
            $GLOBALS["y"] = 20;
            // print_r($GLOBALS["x"]);
        }
        doSomething();
        // print_r($GLOBALS["x"]);
        //in ca doi tuong $GLOBALS ra
        print_r($GLOBALS);
        echo "base salary of mr Aaa= ".Employee::$BASE_SALARY;
        $employeeA = new Employee("nv a", 18);
        $employeeB = new Employee("nv b", 19);
        
        //neu muon them doi tuong => employeeA, B, C....1000 nhan vien
        //1000 nhan vien nay co thuoc tinh BASE_SALARY giong nhau 

        echo "server's name = ".Settings::SERVER_NAME.", port is : ".Settings::PORT;
    ?>
</body>
</html>