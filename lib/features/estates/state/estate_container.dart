import 'package:flutter/material.dart';
import 'package:flutter_app/features/estates/models/estate_model.dart';

import '../screens/cars_screen.dart';
import '../screens/flats_screen.dart';
import '../screens/garages_screen.dart';
import '../screens/main_screen.dart';
import '../screens/houses_screen.dart';
import '../screens/money_screen.dart';

enum Screen { Main, Cars, Flats, Houses, Garages, Money }

class EstateContainer extends StatefulWidget {
  const EstateContainer({super.key});

  @override
  State<EstateContainer> createState() => _EstateContainerState();
}

class _EstateContainerState extends State<EstateContainer> {
  final List<EstateModel> estates = [];
  Screen _currentScreen = Screen.Main;

  void _showMain() {
    setState(() => _currentScreen = Screen.Main);
  }

  void _showCar() {
    setState(() => _currentScreen = Screen.Cars);
  }

  void _showFlats() {
    setState(() => _currentScreen = Screen.Flats);
  }

  void _showHouses() {
    setState(() => _currentScreen = Screen.Houses);
  }

  void _showGarages() {
    setState(() => _currentScreen = Screen.Garages);
  }

  void _showMoney() {
    setState(() => _currentScreen = Screen.Money);
  }

  void _addEstate(EstateModel estate) {
    setState(() => estates.add(estate));
  }

  void _deleteEstate(int id) {
    setState(() => estates.removeWhere((estate) => estate.id == id));
  }

  void _onEstateClick(int id) {}

  @override
  Widget build(BuildContext context) {
    switch (_currentScreen) {
      case Screen.Main:
        return MainScreen(
          estates: estates,
          onCar: _showCar,
          onFlat: _showFlats,
          onHouse: _showHouses,
          onGarage: _showGarages,
          onMoney: _showMoney,
        );
      case Screen.Cars:
        return CarsScreen(
          cars: estates.where((estate) => estate.tag == "car").toList(),
          onBack: _showMain,
          onAddEstate: _addEstate,
          onDeleteEstate: _deleteEstate,
          onEstateClick: _onEstateClick,
        );
      case Screen.Flats:
        return FlatsScreen(
          flats: estates.where((estate) => estate.tag == "flat").toList(),
          onBack: _showMain,
          onAddEstate: _addEstate,
          onDeleteEstate: _deleteEstate,
          onEstateClick: _onEstateClick,
        );
      case Screen.Houses:
        return HousesScreen(
          houses: estates.where((estate) => estate.tag == "house").toList(),
          onBack: _showMain,
          onAddEstate: _addEstate,
          onDeleteEstate: _deleteEstate,
          onEstateClick: _onEstateClick,
        );
      case Screen.Garages:
        return GaragesScreen(
          garages: estates.where((estate) => estate.tag == "garage").toList(),
          onBack: _showMain,
          onAddEstate: _addEstate,
          onDeleteEstate: _deleteEstate,
          onEstateClick: _onEstateClick,
        );
      case Screen.Money:
        return MoneyScreen(
          moneys: estates.where((estate) => estate.tag == "money").toList(),
          onBack: _showMain,
          onAddEstate: _addEstate,
          onDeleteEstate: _deleteEstate,
          onEstateClick: _onEstateClick,
        );
    }
  }
}
