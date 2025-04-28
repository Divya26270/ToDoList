import 'package:flutter/material.dart';
import 'package:login_api/Category.dart';
import 'package:login_api/cart.dart';
import 'package:login_api/home.dart';
import 'package:login_api/profile.dart';
import 'package:login_api/wishList.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;

  bool jewel = false;
  bool gold = false;
  bool diamond = false;
  bool silver = false;
  bool platinum = false;
  bool gifts = false;
  final List<Widget> _screens = const [
    HomePage(),
    CategoryPage(),
    Wishlist(),
    Cart(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Sparkle Cart',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.green),
      ),
      body: _screens[currentIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text(
                  "abc",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              accountName: Text("Divya S"),
              accountEmail: Text("divya123@gmail.com"),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 21, 96, 55),
              ),
            ),
            ListTile(
              title:
                  const Text('All Jewellery', style: TextStyle(fontSize: 14)),
              trailing: Icon(jewel ? Icons.expand_more : Icons.chevron_right),
              onTap: () {
                setState(() {
                  jewel = !jewel;
                });
              },
            ),
            if (jewel)
              const Padding(
                padding: EdgeInsets.only(left: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gender',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Ocassion',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ListTile(
              title: const Text('Gold', style: TextStyle(fontSize: 14)),
              trailing: Icon(gold ? Icons.expand_more : Icons.chevron_right),
              onTap: () {
                setState(() {
                  gold = !gold;
                });
              },
            ),
            if (gold)
              const Padding(
                padding: EdgeInsets.only(left: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Earrings',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Necklace',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Nosepin',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ListTile(
              title: const Text('Diamond', style: TextStyle(fontSize: 14)),
              trailing: Icon(diamond ? Icons.expand_more : Icons.chevron_right),
              onTap: () {
                setState(() {
                  diamond = !diamond;
                });
              },
            ),
            if (diamond)
              const Padding(
                padding: EdgeInsets.only(left: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chains',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Bracelets',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Bangles',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ListTile(
              title: const Text('Silver', style: TextStyle(fontSize: 14)),
              trailing: Icon(silver ? Icons.expand_more : Icons.chevron_right),
              onTap: () {
                setState(() {
                  silver = !silver;
                });
              },
            ),
            if (silver)
              const Padding(
                padding: EdgeInsets.only(left: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Silver Articles',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Anklets',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Toe Rings',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Pendants',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ListTile(
              title: const Text('Platinum', style: TextStyle(fontSize: 14)),
              trailing:
                  Icon(platinum ? Icons.expand_more : Icons.chevron_right),
              onTap: () {
                setState(() {
                  platinum = !platinum;
                });
              },
            ),
            if (platinum)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text('Earrings', style: TextStyle(fontSize: 12)),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    ListTile(
                      title: Text('Pendants', style: TextStyle(fontSize: 12)),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    ListTile(
                      title: Text('Rings', style: TextStyle(fontSize: 12)),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    ListTile(
                      title: Text('Bangles & Bracelets',
                          style: TextStyle(fontSize: 12)),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 14,
                      ),
                    ),
                  ],
                ),
              ),
            const ListTile(
              title: Text('Solitaire', style: TextStyle(fontSize: 14)),
            ),
            ListTile(
              title: const Text('Gift & Coins', style: TextStyle(fontSize: 14)),
              trailing: Icon(gifts ? Icons.expand_more : Icons.chevron_right),
              onTap: () {
                setState(() {
                  gifts = !gifts;
                });
              },
            ),
            if (gifts)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text('Gold Coins', style: TextStyle(fontSize: 12)),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    ListTile(
                      title:
                          Text('Gift Voucher', style: TextStyle(fontSize: 12)),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    ListTile(
                      title: Text('Silver Articles',
                          style: TextStyle(fontSize: 12)),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    ListTile(
                      title:
                          Text('Silver Coins', style: TextStyle(fontSize: 12)),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 14,
                      ),
                    ),
                  ],
                ),
              ),
            const ListTile(
              title: Text('Offers', style: TextStyle(fontSize: 14)),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined), label: 'Wishlist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_checkout_outlined),
              label: 'Your Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile')
        ],
        onTap: (int itemIndex) {
          setState(() {
            currentIndex = itemIndex;
          });
        },
      ),
    );
  }
}
