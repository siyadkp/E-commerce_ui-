import 'package:hive/hive.dart';
part 'product_model.g.dart';

@HiveType(typeId: 2)
class ProductModel {
  @HiveField(0)
  String image;
  @HiveField(1)
  String productName;
  @HiveField(2)
  int qty;
  @HiveField(3)
  double price;
  @HiveField(4)
  String barcodeNumber;
  @HiveField(5)
  int inCartQty;

  ProductModel(
      {required this.image,
      required this.productName,
      required this.qty,
      required this.price,
      required this.barcodeNumber,
      this.inCartQty = 0});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      image: json['image'] as String,
      productName: json['title'] as String,
      qty: json['rating']['count'],
      price: json["price"]?.toDouble(),
      barcodeNumber: json['id'].toString(),
    );
  }
}
