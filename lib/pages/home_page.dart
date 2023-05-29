import 'package:flutter/material.dart';
import 'package:walletappui/util/my_button.dart';
import 'package:walletappui/util/my_list_tile.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../util/my_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // pagecontroller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: const Icon(
          Icons.monetization_on,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  size: 32,
                  color: Colors.pink[200],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  size: 32,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // app bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'My',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Cards',
                          style: TextStyle(fontSize: 28),
                        ),
                      ],
                    ),
      
                    // plus button
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
      
              const SizedBox(height: 25),
      
              // cards
              Container(
                height: 200,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  children: [
                    MyCard(
                      balance: 5250.20,
                      cardNumber: 12345678,
                      expiryMonth: 10,
                      expiryYear: 24,
                      color: Colors.deepPurple[300],
                    ),
                    MyCard(
                      balance: 342.23,
                      cardNumber: 12345678,
                      expiryMonth: 11,
                      expiryYear: 23,
                      color: Colors.green[300],
                    ),
                    MyCard(
                      balance: 420.42,
                      cardNumber: 12345678,
                      expiryMonth: 8,
                      expiryYear: 22,
                      color: Colors.yellow[300],
                    ),
                  ],
                ),
              ),
      
              const SizedBox(height: 25),
      
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.grey.shade800,
                ),
              ),
              const SizedBox(height: 20),
      
              // 3 buttons -> send + pay + bills
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    // send button
                    MyButton(
                      iconImagePath: 'lib/icons/send-money.png',
                      buttonText: 'Send',
                    ),
      
                    // pay button
                    MyButton(
                      iconImagePath: 'lib/icons/credit-card.png',
                      buttonText: 'Pay',
                    ),
      
                    //bills button
                    MyButton(
                      iconImagePath: 'lib/icons/bill.png',
                      buttonText: 'Bills',
                    ),
                  ],
                ),
              ),
      
              const SizedBox(height: 40),
      
              // column -> stats + transaction
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: const [
                    // statistics
                    MyListTile(
                      iconImagePath: 'lib/icons/statistics.png',
                      titleTitle: 'Statistics',
                      titleSubTitle: 'Payment and Income',
                    ),
      
                    // tarnsactions
                    MyListTile(
                      iconImagePath: 'lib/icons/transactional.png',
                      titleTitle: 'Transactions',
                      titleSubTitle: 'Transactions History',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
