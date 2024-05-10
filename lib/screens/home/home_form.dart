import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/home/categories.dart';

class HomeForm extends StatefulWidget {
  @override
  _HomeFormState createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> categories = [
    "All",
    "Amazing",
    "Moderate",
    "General"
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: categories.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child:  Text(
            'Model',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: categories.map((String category) {
            return Tab(
              child: Text(
                category,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: categories.map((String category) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: CategoryView(category: category),
          );
        }).toList(),
      ),
    );
  }
}
