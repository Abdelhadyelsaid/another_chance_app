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
    required this.products,
    required this.totalPrice,
    required this.createdAt,
    required this.orderId,
    required this.orderStatus,
  });

  final String? id;
  final List<OrderProduct> products;
  final int? totalPrice;
  final String? createdAt;
  final int? orderId;
  final String? orderStatus;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"],
      products: json["products"] == null
          ? []
          : List<OrderProduct>.from(
              json["products"]!.map((x) => OrderProduct.fromJson(x))),
      totalPrice: json["totalPrice"],
      createdAt: json["createdAt"],
      orderId: json["orderId"],
      orderStatus: json['orderStatus'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'products': products.map((x) => x.toMap()).toList(),
      'totalPrice': totalPrice,
      'createdAt': createdAt,
      'orderId': orderId,
      'orderStatus': orderStatus,
    };
  }
}

class OrderProduct {
  OrderProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.count,
    required this.image,
  });

  final String? id;
  final String? name;
  final String? image;
  final int? price;
  final int? count;

  factory OrderProduct.fromJson(Map<String, dynamic> json) {
    return OrderProduct(
      id: json["id"],
      name: json["name"],
      image: json["image"],
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
      'image': image,
    };
  }
}
