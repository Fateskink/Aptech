import 'package:flutter/material.dart';
import 'package:foodapp/pages/app_routes.dart';
import 'package:foodapp/services/user_service.dart';
import 'package:foodapp/utils/app_colors.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late UserService userService;
  @override
  void initState() {
    super.initState();
    userService = GetIt.instance<UserService>();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          color: AppColors.primaryColor,
          child: Column(
            children: [
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // Display form for uploading an image
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Username',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.email),
          title: Text('Email: example@example.com', style: Theme.of(context).textTheme.bodyMedium),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Phone Number: 0123456789',style: Theme.of(context).textTheme.bodyMedium),
        ),
        ListTile(
          leading: Icon(Icons.location_on),
          title: Text('Address: Hanoi, Vietnam',style: Theme.of(context).textTheme.bodyMedium),
        ),
        ListTile(
          leading: Icon(Icons.calendar_today),
          title: Text('Date of Birth: 01/01/2000',style: Theme.of(context).textTheme.bodyMedium),
        ),
        ListTile(
          leading: Icon(Icons.lock),
          title: Text('Password', style: Theme.of(context).textTheme.bodyMedium),
          subtitle: Text('********', style: Theme.of(context).textTheme.bodyMedium),
          onTap: () {
            // Navigate to the change password page
          },
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Signout',style: Theme.of(context).textTheme.bodyMedium),
          onTap: () {
            userService.logout();
            context.go('/${AppRoutes.login}');
          },
        ),
      ],
    );
  }
}
