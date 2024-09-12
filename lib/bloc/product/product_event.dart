abstract class ProductEvent {}

class ProductInitalizeEvent extends ProductEvent {
  String productId;
  String categoryId;
  ProductInitalizeEvent(this.productId, this.categoryId);
}
