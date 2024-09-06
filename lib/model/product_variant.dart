import 'package:flutter_shop_application/model/variant_type.dart';
import 'package:flutter_shop_application/model/variant.dart';

class ProductVariant {
  VariantType variantType;
  List<Variant> variantsList;

  ProductVariant(this.variantType, this.variantsList);
}
