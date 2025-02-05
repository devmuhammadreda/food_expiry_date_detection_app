import 'package:get/get.dart';

import '../../../../core/enums/enums.dart';
import '../../../data/models/product_model.dart';

class ProductDetailsController extends GetxController {
  ProductModel? product;
  ProductExpiryStatus? expiryStatus;
  @override
  void onInit() {
    product = Get.arguments["product"];
    expiryStatus = getProductExpiryStatus(
        expiryDate: product?.product?.expirationDate ?? "");
    super.onInit();
  }
}
