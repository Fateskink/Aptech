import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _showHeader = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              // Đây là nơi xử lý khi bấm nút Signout
              // Ví dụ: đăng xuất và quay lại màn hình đăng nhập
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            setState(() {
              _showHeader = scrollNotification.scrollDelta! < 0;
            });
          }
          return true;
        },
        child: ListView(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              color: Colors.deepPurple,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      // Hiển thị form cho phép upload ảnh
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Tên người dùng',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email: example@example.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Số điện thoại: 0123456789'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Địa chỉ: Hà Nội, Việt Nam'),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Ngày sinh: 01/01/2000'),
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Mật khẩu'),
              subtitle: Text('********'),
              onTap: () {
                // Điều hướng đến trang đổi mật khẩu
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Signout'),
              onTap: () {
                // Đây là nơi xử lý khi bấm nút Signout
                // Ví dụ: đăng xuất và quay lại màn hình đăng nhập
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
