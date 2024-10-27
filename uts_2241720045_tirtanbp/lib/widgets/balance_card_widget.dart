import 'package:flutter/material.dart';
import 'dart:async';

class BalanceCardWidget extends StatefulWidget {
  @override
  _BalanceCardWidgetState createState() => _BalanceCardWidgetState();
}

class _BalanceCardWidgetState extends State<BalanceCardWidget> {
  String payLaterText = "Belanja Dulu";
  Timer? timer;

  @override
  void initState() {
    super.initState();
    // Start the timer to change the text every 5 seconds
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) {
      setState(() {
        payLaterText =
            payLaterText == "Belanja Dulu" ? "Bayar Nanti" : "Belanja Dulu";
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      margin: const EdgeInsets.only(right: 4, left: 4, top: 70),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 224, 24, 24),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(children: [
            SizedBox(width: 5),
            Text('Hi!, Tirta Nurrochman Bintang Prawira 2241720045',
                style: TextStyle(fontSize: 15, color: Colors.white))
          ]),
          SizedBox(height: 10),
          Row(
            children: [
              _buildCard('Your Balance', 'Rp 9.747', Icons.arrow_forward),
              SizedBox(width: 10),
              _buildBonusBalanceCard(),
              SizedBox(width: 10),
              _buildMyPaylaterSection(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String balance, IconData icon) {
    return InkWell(
      onTap: () {
        // Action when tapped
        print('Your Balance tapped');
      },
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5)
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontSize: 12,
                        color: const Color.fromARGB(255, 85, 75, 75))),
                SizedBox(height: 2),
                Row(
                  children: [
                    Text(balance,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(width: 5),
                    _buildArrowIcon(), // Add arrow icon here
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBonusBalanceCard() {
    return InkWell(
      onTap: () {
        // Action when tapped
        print('Bonus Balance tapped');
      },
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5)
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bonus Balance',
                    style: TextStyle(
                        fontSize: 12,
                        color: const Color.fromARGB(255, 85, 75, 75))),
                SizedBox(height: 2),
                Row(
                  children: [
                    Icon(Icons.access_time_filled, color: Colors.yellow),
                    SizedBox(width: 5),
                    Text('0',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(width: 5),
                    _buildArrowIcon(), // Add arrow icon here
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMyPaylaterSection() {
    return InkWell(
      onTap: () {
        // Action when tapped
        print('My Paylater tapped');
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5)
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('MyPaylater',
                    style: TextStyle(fontSize: 12, color: Colors.black)),
                SizedBox(height: 2),
                Row(
                  children: [
                    Text(payLaterText,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red)),
                    SizedBox(width: 5),
                    _buildArrowIcon(), // Add arrow icon here
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArrowIcon() {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      child: Icon(Icons.arrow_forward, color: Colors.white, size: 15),
    );
  }
}
