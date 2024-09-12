abstract class ProductEvent {}

class ProductInitalizeEvent extends ProductEvent {
  String productId;
  ProductInitalizeEvent(this.productId);
}
