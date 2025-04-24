import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryState();
}

class _CategoryState extends State<CategoryPage> {
  List<Map<String, String>> items = [
    {'image': 'assets/j2.jpeg', 'name': 'Necklace'},
    {'image': 'assets/j3.jpeg', 'name': 'Necklace'},
    {'image': 'assets/j4.jpeg', 'name': 'Bangle'},
    {'image': 'assets/j5.jpeg', 'name': 'Earrings'},
    {'image': 'assets/j6.jpeg', 'name': 'Bangle'},
    {'image': 'assets/j8.jpeg', 'name': 'Ring'},
    {'image': 'assets/j9.jpeg', 'name': 'Chain'},
    {'image': 'assets/j10.jpeg', 'name': 'Necklace'},
    {'image': 'assets/j11.jpeg', 'name': 'Necklace'},
    {'image': 'assets/j12.jpeg', 'name': 'Bangle'},
    {'image': 'assets/j13.jpeg', 'name': 'Necklace'},
    {'image': 'assets/j14.png', 'name': 'Necklace'},
    {'image': 'assets/j15.png', 'name': 'Necklace'},
    {'image': 'assets/j16.png', 'name': 'Chain'},
    {'image': 'assets/j17.jpg', 'name': 'Earrings'},
    {'image': 'assets/j18.jpeg', 'name': 'Bangle'},
    {'image': 'assets/j19.jpeg', 'name': 'Chain'},
    {'image': 'assets/j20.jpeg', 'name': 'Earrings'},
    {'image': 'assets/j21.jpeg', 'name': 'Necklace'},
    {'image': 'assets/j22.jpeg', 'name': 'Ring'},
    {'image': 'assets/j23.jpeg', 'name': 'Ring'},
    {'image': 'assets/j24.jpeg', 'name': 'Bracelet'},
    {'image': 'assets/j25.jpeg', 'name': 'Chain'},
    {'image': 'assets/j26.jpeg', 'name': 'Ring'},
    {'image': 'assets/j27.jpeg', 'name': 'Necklace'},
    {'image': 'assets/j28.jpeg', 'name': 'Necklace'},
  ];
  List<Map<String, String>> filteredItems = [];

  void filterItems(String query) {
    setState(() {
      filteredItems = items
          .where((item) =>
              item['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    filteredItems = items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      // Search bar
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: filterItems,
          cursorColor: Colors.green,
          decoration: const InputDecoration(
            labelText: 'Search',
            labelStyle: TextStyle(color: Colors.green),
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.search, color: Colors.green),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 2.0),
            ),
          ),
        ),
      ),

      Expanded(
        child: filteredItems.isEmpty
            ? const Center(
                child: Text(
                  'No item found',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: kIsWeb ? 2 : 1,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1,
                ),
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(10)),
                              child: kIsWeb
                                  ? Image.network(
                                      item['image']!,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    )
                                  : Image.asset(
                                      item['image']!,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item['name']!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    ]));
  }
}
