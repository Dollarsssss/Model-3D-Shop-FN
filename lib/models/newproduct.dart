class NewProduct {
  final String image, title, description , quality , model;
  final int size, id, color,numberItem;
  final double price;
 
  // final Color color;

  NewProduct(
    {
      required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.size,
      required this.id,
      required this.color,
      required this.quality,
      required this.model,
      required this.numberItem
    }
  );

}