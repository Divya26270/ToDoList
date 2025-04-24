import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          ListTile(
            title: Text('Account Details', style: TextStyle(fontSize: 14)),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 14,
            ),
          ),
          SizedBox(height: 4),
          ListTile(
            title: Text('Order History', style: TextStyle(fontSize: 14)),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 14,
            ),
          ),
          SizedBox(height: 4),
          ListTile(
            title: Text('My Wishlist', style: TextStyle(fontSize: 14)),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 14,
            ),
          ),
          SizedBox(height: 4),
          ListTile(
            title:
                Text('My Reviews and Ratings', style: TextStyle(fontSize: 14)),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 14,
            ),
          ),
          SizedBox(height: 4),
          ListTile(
            title: Text('Purchase Plan', style: TextStyle(fontSize: 14)),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 14,
            ),
          ),
          SizedBox(height: 4),
          ListTile(
            title: Text('Account Deletion', style: TextStyle(fontSize: 14)),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 14,
            ),
          ),
          SizedBox(height: 4),
          ListTile(
            title: Text('Account Details', style: TextStyle(fontSize: 14)),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 14,
            ),
          ),
        ],
      ),
    );
  }
}
