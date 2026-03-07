class BestSellerModel {
  BestSellerModel.fromJson(Map<String, dynamic> json) {
    message = _toString(json['message']);
    status = _toInt(json['status']);

    final rawData = json['data'];
    data = rawData is Map<String, dynamic>
        ? BestSellerData.fromJson(rawData)
        : null;
  }

  BestSellerData? data;
  String? message;
  int? status;
}

class BestSellerData {
  BestSellerData.fromJson(Map<String, dynamic> json) {
    final rawProducts = json['products'];
    if (rawProducts is Iterable) {
      products = <BookProduct>[];
      for (final item in rawProducts) {
        if (item is Map<String, dynamic>) {
          products!.add(BookProduct.fromJson(item));
        }
      }
    }
  }

  List<BookProduct>? products;
}

class BookProduct {
  BookProduct({this.id, this.name, this.price, this.image});

  BookProduct.fromJson(Map<String, dynamic> json) {
    id = _toInt(json['id']);
    name = _toString(json['name']);
    price = json['price']?.toString();
    image = _toString(json['image']);
  }

  int? id;
  String? name;
  String? price;
  String? image;
}

int? _toInt(dynamic value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}

String? _toString(dynamic value) => value is String ? value : null;