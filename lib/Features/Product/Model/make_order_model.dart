class MakeOrderModel {
  MakeOrderModel({
    required this.data,
  });
  final Data? data;

  factory MakeOrderModel.fromJson(Map<String, dynamic> json) {
    return MakeOrderModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data?.toMap(),
    };
  }
}

class Data {
  Data({
    required this.id,
    required this.storeId,
    required this.storeName,
    required this.products,
    required this.totalPrice,
    required this.createdAt,
    required this.orderId,
    required this.logo,
    required this.phone,
    required this.location,
  });

  final String? id;
  final String? storeId;
  final String? storeName;
  final List<OrderProduct> products;
  final int? totalPrice;
  final String? createdAt;
  final String? logo;
  final int? orderId;
  final String? phone;
  final String? location;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"],
      storeId: json["storeId"],
      storeName: json["storeName"],
      products: json["products"] == null
          ? []
          : List<OrderProduct>.from(
          json["products"]!.map((x) => OrderProduct.fromJson(x))),
      totalPrice: json["totalPrice"],
      createdAt: json["createdAt"],
      orderId: json["orderId"],
      logo: json["logo"],
      phone: json["phone"],
      location: json["location"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'storeId': storeId,
      'storeName': storeName,
      'products': products.map((x) => x.toMap()).toList(),
      'totalPrice': totalPrice,
      'createdAt': createdAt,
      'orderId': orderId,
      'logo': logo,
      'phone': phone,
      'location': location,
    };
  }
}

class OrderProduct {
  OrderProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.count,
  });

  final String? id;
  final String? name;
  final int? price;
  final int? count;

  factory OrderProduct.fromJson(Map<String, dynamic> json) {
    return OrderProduct(
      id: json["id"],
      name: json["name"],
      price: json["price"],
      count: json["count"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'count': count,
    };
  }
}


