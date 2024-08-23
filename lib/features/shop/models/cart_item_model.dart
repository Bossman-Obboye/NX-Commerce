class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariation;

  /// Constructor
  CartItemModel({
    required this.productId,
    this.title = '',
    this.price = 0.0,
    this.image,
    required this.quantity,
    this.variationId = '',
    this.brandName,
    this.selectedVariation,
  });

  /// Empty Cart
  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  /// Convert a CartItem to Json map
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'image': image,
      'quantity': quantity,
      'variationId': variationId,
      'brandName': brandName,
      'selectedVariation': selectedVariation,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'] as String,
      title: json['title'] as String,
      price: double.parse(json['price'] ?? 0.0),
      image: json['image'],
      quantity: json['quantity'],
      variationId: json['variationId'],
      brandName: json['brandName'],
      selectedVariation: json['selectedVariation'] != null
          ? Map<String, String>.from(json['selectedVariation'])
          : null,
    );
  }
}