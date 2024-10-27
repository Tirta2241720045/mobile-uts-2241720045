import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar_widget.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildProfileHeader(),
          SizedBox(height: 16),
          Container(
            color: Colors.grey[200],
            child: Column(
              children: [
                _buildProfileMenuItem('Account Type', 'FULL SERVICE', true),
                _buildDivider(),
                _buildProfileMenuItem('Account Settings', '', true),
                _buildDivider(),
                _buildProfileMenuItem('LinkAja Syariah', 'Not Active', true),
                _buildDivider(),
                _buildProfileMenuItem('Payment Method', '', true),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            color: Colors.grey[200],
            child: Column(
              children: [
                _buildProfileMenuItem(
                    'Email', '2241720045@student.polinema.ac.id', true),
                _buildDivider(),
                _buildProfileMenuItem('Security Question', 'Set', true),
                _buildDivider(),
                _buildProfileMenuItem('PIN Settings', '', true),
                _buildDivider(),
                _buildProfileMenuItem('Language', 'English', true),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            color: Colors.grey[200],
            child: Column(
              children: [
                _buildProfileMenuItem('Terms of Service', '', true),
                _buildDivider(),
                _buildProfileMenuItem('Privacy Policy', '', true),
                _buildDivider(),
                _buildProfileMenuItem('Help Center', '', true),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            color: Colors.grey[200],
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 16),
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  // Handle log out
                },
                child: Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'LinkAja v.4.37.1',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
        ],
      ),
      bottomNavigationBar: BottomNavBarWidget(
        currentIndex: 4,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey[300],
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tirta Nurrochman Bintang Prawira',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '+6285732290931',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/profile.png'),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileMenuItem(String title, String value, bool showArrow) {
    return Container(
      color: Colors.white,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold, // Menambahkan style bold
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (value.isNotEmpty)
              Text(
                value,
                style: TextStyle(color: Colors.grey),
              ),
            if (showArrow)
              Icon(
                Icons.chevron_right,
                color: Colors.red,
              )
            else
              Icon(
                Icons.chevron_right,
                color: Colors.red,
              ),
          ],
        ),
        onTap: () {
          // Handle menu item tap
        },
      ),
    );
  }
}
