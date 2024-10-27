import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar_widget.dart';
import '../widgets/history_card_widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int _currentIndex = 1; // Index for Bottom Navigation Bar

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110.0),
          child: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 1.0),
              child: Text(
                'Transaction History',
                style: TextStyle(
                  fontWeight: FontWeight.w600, // Semi-bold
                  fontSize: 18,
                ),
              ),
            ),
            centerTitle: true,
            bottom: TabBar(
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: Colors.red, // Active tab border color
                  width: 4.0, // Border width
                ),
                insets:
                    EdgeInsets.symmetric(horizontal: 128), // Tab border insets
              ),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  child: Text(
                    'Pending',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Tab(
                  child: Text(
                    'Done',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Color.fromARGB(255, 243, 243, 243),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/content1.png', // Ensure the asset path is correct
                      height: 150,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'All transactions are completed!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Any Pending transactions will appear in this page',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFBDBDBD),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 243, 243, 243),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [
                    TransactionCard(
                      title: 'Pay Merchant',
                      date: '15 Sep 2024 17:32 WIB',
                      amount: 'Rp 45.400',
                      status: 'Success',
                      description: 'Indomaret_purchase',
                    ),
                    TransactionCard(
                      title: 'Pay Merchant',
                      date: '15 Sep 2024 17:28 WIB',
                      amount: 'Rp 55.000',
                      status: 'Success',
                      description: 'Indomaret_purchase',
                    ),
                    TransactionCard(
                      title: 'Top Up from Bank',
                      date: '15 Sep 2024 17:26 WIB',
                      amount: 'Rp 100.000',
                      status: 'Success',
                      description:
                          'Top Up artajasa B_001145615163862752 6285755730905',
                    ),
                    TransactionCard(
                      title: 'Pay QRIS',
                      date: '31 Aug 2024 11:49 WIB',
                      amount: 'Rp 21.000',
                      status: 'Success',
                      description: 'SBY- MOG TP S1',
                    ),
                    TransactionCard(
                      title: 'Pay Merchant',
                      date: '26 Oct 2024 20:30',
                      amount: 'Rp 10.000',
                      status: 'Fail',
                      description: 'Mandiri',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBarWidget(
          currentIndex: 1,
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Update the current index
            });
          },
        ),
      ),
    );
  }
}
