class Cart {
  final String name;

  Cart(this.name);

  Cart copyWith({String? name}) {
    return Cart(name ?? this.name);
  }

  @override
  String toString() => 'This is $name';
}
