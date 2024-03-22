class ProductImage {
  late int id;
  late String imageUrl;

  ProductImage({
    required this.id,
    required this.imageUrl,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json['id'],
      imageUrl: json['image_url'],
    );
  }
}

