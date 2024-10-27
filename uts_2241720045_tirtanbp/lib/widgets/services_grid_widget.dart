import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Services Grid',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Services Grid Example'),
        ),
        body: Center(
          child: ServicesGridWidget(),
        ),
      ),
    );
  }
}

class ServicesGridWidget extends StatelessWidget {
  final List<IconData> icons = [
    Icons.phone_android,
    Icons.electric_bolt,
    Icons.tv,
    Icons.credit_card,
    Icons.church,
    Icons.question_answer,
    Icons.redeem,
    Icons.more_horiz,
  ];

  final List<String> labels = [
    'Pulsa/Data',
    'Electricity',
    'Cable TV\n& Internet',
    'Kartu Uang\nElektronik',
    'Gereja',
    'Infaq',
    'Other\nDonations',
    'More',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5), // Grey color with 50% opacity
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: icons.length,
        itemBuilder: (context, index) {
          return _buildServiceItem(context, icons[index], labels[index]);
        },
      ),
    );
  }

  Widget _buildServiceItem(BuildContext context, IconData icon, String label) {
    return MouseRegion(
      onEnter: (_) {
        // Optional: You can add a hover effect here if needed
      },
      onExit: (_) {
        // Optional: Reset hover effect here
      },
      child: GestureDetector(
        onTap: () async {
          // Simulate a network call or heavy computation
          await Future.delayed(Duration(milliseconds: 200)); // Simulate delay
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Clicked on $label')),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, // Center the items
          children: [
            Container(
              width: 50, // Set width for the background circle
              height: 50, // Set height for the background circle
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red.withOpacity(0.2), // Background color
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: Colors.red,
                  size: 28, // Set the size of the icon
                ),
              ),
            ),
            SizedBox(height: 8), // Increased spacing between icon and text
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 2, // Limit to 2 lines
              overflow: TextOverflow.ellipsis, // Handle overflow
              style: TextStyle(
                fontSize: 12, // Increase font size
                fontWeight: FontWeight.bold, // Make text bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
