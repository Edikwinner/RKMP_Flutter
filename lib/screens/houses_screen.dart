import 'package:flutter/material.dart';

class HousesScreen extends StatefulWidget {
  const HousesScreen({super.key});

  @override
  State<StatefulWidget> createState() => HousesScreenState();
}

class HousesScreenState extends State<HousesScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  final List houses = [];

  void _addHouse(String house) {
    setState(() {
      if (house
          .trim()
          .isNotEmpty) {
        houses.add(house);
      }
    });
  }

  void _removeHouse(int index) {
    setState(() {
      houses.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber, title: Text("Дома")),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              focusNode: _focusNode,
              onSubmitted: (value) {
                _addHouse(value);
                _controller.clear();
                FocusScope.of(context).requestFocus(_focusNode);
              },
              decoration: InputDecoration(
                hintText: "Введите название дома",
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _addHouse(_controller.text);
                    _controller.clear();
                    FocusScope.of(context).requestFocus(_focusNode);
                  },
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber, width: 1),
                ),
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView.separated(
                itemCount: houses.length,
                itemBuilder: (context, index) =>
                    ListTile(
                      title: Text(houses[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete_forever),
                        onPressed: () => _removeHouse(index),
                      ),
                    ),
                separatorBuilder: (BuildContext context, int index) => const Divider(
                  color: Colors.grey,
                  height: 5,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}