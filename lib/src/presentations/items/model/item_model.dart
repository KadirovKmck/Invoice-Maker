class Item {
  Item({required this.name, required this.price});

  String name;
  double price;

  Item copyWith({String? name, double? price}) =>
      Item(name: name ?? this.name, price: price ?? this.price);
}
