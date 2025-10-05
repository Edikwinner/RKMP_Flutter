import 'package:flutter/material.dart';

class FlatsScreen extends StatefulWidget {
  const FlatsScreen({super.key});

  @override
  State<StatefulWidget> createState() => FlatsScreenState();
}

class FlatsScreenState extends State<FlatsScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  final List flats = [];

  void _addFlat(String flat) {
    setState(() {
      if (flat.trim().isNotEmpty) {
        flats.add(flat);
      }
    });
  }

  void _removeFlat(int index) {
    setState(() {
      flats.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange, title: Text("Квартиры")),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              focusNode: _focusNode,
              onSubmitted: (value) {
                _addFlat(value);
                _controller.clear();
                FocusScope.of(context).requestFocus(_focusNode);
              },
              decoration: InputDecoration(
                hintText: "Введите название квартиры",
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _addFlat(_controller.text);
                    _controller.clear();
                    FocusScope.of(context).requestFocus(_focusNode);
                  },
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 1),
                ),
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: flats.length,
                itemBuilder: (context, index) => Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(flats[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete_forever),
                      onPressed: () => _removeFlat(index),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}