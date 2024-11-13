import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/mvvm/models/item.dart';
import 'package:flutter/cupertino.dart';

class ItemViewModel extends ChangeNotifier {
  // 아이템 리스트
  final List<Item> _items = [
    Item(
      name: 'Urban Soft AL 10.0',
      image: 'assets/p1.jpeg',
      price: 699.0,
      rating: 5.0,
      reviewCount: 26,
      colorOptions: [Colors.black, Colors.green, Colors.orange, Colors.grey, Colors.white],
      icon: Icons.directions_bike,
    ),
    Item(
      name: 'Mountain Pro XL',
      image: 'assets/p2.jpeg',
      price: 899.0,
      rating: 4.5,
      reviewCount: 34,
      colorOptions: [Colors.blue, Colors.red, Colors.yellow, Colors.purple, Colors.brown],
      icon: Icons.motorcycle,
    ),
    Item(
      name: 'City Cruiser 7.0',
      image: 'assets/p3.jpeg',
      price: 799.0,
      rating: 4.0,
      reviewCount: 18,
      colorOptions: [Colors.white, Colors.black, Colors.grey, Colors.blue, Colors.green],
      icon: CupertinoIcons.car_detailed,
    ),
    Item(
      name: 'Sky High 5.0',
      image: 'assets/p4.jpeg',
      price: 999.0,
      rating: 4.8,
      reviewCount: 45,
      colorOptions: [Colors.white, Colors.black, Colors.blue, Colors.red, Colors.orange],
      icon: CupertinoIcons.airplane,
    ),
  ];

  // 현재 선택된 아이템의 인덱스
  int _selectedId = 0;

  // Getter for items
  List<Item> get items => _items;

  // Getter for selectedId
  int get selectedId => _selectedId;

  // Getter for selectedItem
  Item get selectedItem => _items[_selectedId];

  // 메서드: 아이템 선택
  void selectItem(int id) {
    if (id >= 0 && id < _items.length) {
      _selectedId = id;
      notifyListeners();
    }
  }
}