import 'package:flutter/material.dart';

class CarsScreen extends StatefulWidget {
  const CarsScreen({super.key});

  @override
  State<StatefulWidget> createState() => CarsScreenState();
}

class CarsScreenState extends State<CarsScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  final List _cars = [];

  void _addCar(String car) {
    setState(() {
      if (car.trim().isNotEmpty) {
        _cars.add(car);
      }
    });
  }

  void _removeCar(int index) {
    setState(() {
      _cars.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red, title: Text("Машины")),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              focusNode: _focusNode,
              onSubmitted: (value) {
                _addCar(value);
                _controller.clear();
                FocusScope.of(context).requestFocus(_focusNode);
              },
              decoration: InputDecoration(
                hintText: "Введите название машины",
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _addCar(_controller.text);
                    _controller.clear();
                    FocusScope.of(context).requestFocus(_focusNode);
                  },
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1),
                ),
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _cars
                      .map(
                        (car) => Card(
                          elevation: 2,
                          child: ListTile(
                            title: Text(car),
                            trailing: IconButton(
                              icon: Icon(Icons.delete_forever),
                              onPressed: () => _removeCar(_cars.indexOf(car)),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
