import 'dart:convert';

class Food {
  String foodName;
  String foodPrice;
  String foodWeight;
  String foodImage;

  Food({
    required this.foodName,
    required this.foodPrice,
    required this.foodWeight,
    required this.foodImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'foodName': foodName,
      'foodPrice': foodPrice,
      'foodWeight': foodWeight,
      'foodImage': foodImage,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      foodName: map['foodName'],
      foodPrice: map['foodPrice'],
      foodWeight: map['foodWeight'],
      foodImage: map['foodImage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) => Food.fromMap(json.decode(source));
}
