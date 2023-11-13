import 'package:flutter/material.dart';

List<Item> inventory = [];

class InventoryItem {
  final String name;
  final IconData icon;
  final Color color;

  InventoryItem(this.name, this.icon, this.color);
}

class Item {
  final String name;
  final int amount;
  final String description;
  final String engine;
  final bool winglet;
  final String image;

  Item(this.name, this.amount, this.description, this.engine, this.winglet,
      this.image);
}
