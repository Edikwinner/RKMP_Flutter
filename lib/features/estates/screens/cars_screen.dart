import 'package:flutter/material.dart';
import 'package:flutter_app/features/estates/models/estate_model.dart';
import 'package:flutter_app/features/estates/widgets/estate_table.dart';

class CarsScreen extends StatefulWidget {
  final List<EstateModel> cars;
  final VoidCallback onBack;
  final Function(EstateModel) onAddEstate;
  final Function(int) onDeleteEstate;
  final Function(int) onEstateClick;

  final String tag = "car";

  const CarsScreen({
    super.key,
    required this.cars,
    required this.onBack,
    required this.onAddEstate,
    required this.onDeleteEstate,
    required this.onEstateClick,
  });

  @override
  State<StatefulWidget> createState() => CarsScreenState();
}

class CarsScreenState extends State<CarsScreen> {
  final TextEditingController _nameController = TextEditingController();
  String? _nameErrorText;

  final TextEditingController _costController = TextEditingController();
  String? _costErrorText;

  void _checkAndAdd() {
    final name = _nameController.text.trim();
    final costText = _costController.text.trim();
    final cost = int.tryParse(costText);

    setState(() {
      _nameErrorText = null;
      _costErrorText = null;

      if (name.isEmpty) {
        _nameErrorText = "Введите название";
      }
      if (costText.isEmpty) {
        _costErrorText = "Введите стоимость";
      } else if (cost == null) {
        _costErrorText = "Некорректный ввод";
      }

      if (_nameErrorText == null && _costErrorText == null && cost != null) {
        widget.onAddEstate(EstateModel.create(name, cost, widget.tag));
        _nameController.clear();
        _costController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Машины"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: widget.onBack,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: "Введите название машины",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1),
                          ),
                          errorText: _nameErrorText,
                        ),
                      ),

                      SizedBox(height: 8),

                      Center(
                        child: TextField(
                          controller: _costController,
                          decoration: InputDecoration(
                            hintText: "Введите примерную стоимость машины (₽)",
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                            errorText: _costErrorText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 8),

                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _checkAndAdd();
                  },
                ),
              ],
            ),

            const SizedBox(height: 16),

            Expanded(
              child: EstateTable(
                estateList: widget.cars,
                onRemoveItem: widget.onDeleteEstate,
                onItemClick: widget.onEstateClick,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
