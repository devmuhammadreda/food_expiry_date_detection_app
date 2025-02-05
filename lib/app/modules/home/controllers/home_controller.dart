import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:food_expiry_date_detection_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/enums/enums.dart';
import '../../../../core/global/uid.dart';
import '../../../../core/services/barcode_scanner_service.dart';
import '../../../../core/services/text_recognizer_service.dart';
import '../../../data/data_source/product_details_data_source.dart';
import '../../../data/data_source/scan_log_local_data_source.dart';
import '../../../data/models/product_model.dart';
import '../../../data/models/scan_log_model.dart';

class HomeController extends GetxController {
  late Stream<List<ScanLogModel>> getScanLogs;

  @override
  void onInit() {
    getScanLogs = ScanLogLocalDataSource().getScanLogs();
    super.onInit();
  }

  Future<void> scanProductBarcode() async {
    String? barcode = await BarcodeScannerService().scanBarcode();
    if (barcode != null) {
      BotToast.showLoading();
      ProductModel res =
          await ProductDetailsDataSource.getProductDetails(barcode);
      if (res.status == 1) {
        await _addProductLog(res, barcode);
        BotToast.closeAllLoading();
        _goToProductDetails(res);
      } else {
        BotToast.closeAllLoading();
        BotToast.showText(text: "Product not found");
      }
    }
  }

  Future<void> _addProductLog(ProductModel res, String barcode) async {
    await ScanLogLocalDataSource().addScanLog(
      ScanLogModel(
        barcode: barcode,
        productName: res.product?.productName,
        imageUrl: res.product?.imageUrl,
        expiryDate: res.product?.expirationDate,
        expiryStatus: getProductExpiryStatus(
            expiryDate: res.product?.expirationDate ?? ""),
        scanType: ScanType.barcodeScan,
        productId: res.product?.id,
        uid: generateUid(),
      ),
    );
  }

  void _goToProductDetails(ProductModel res) async {
    Get.toNamed(
      Routes.PRODUCT_DETAILS,
      arguments: {
        "product": res,
      },
    );
  }

  Future<void> getAndGoProductDetails(String barcode) async {
    BotToast.showLoading();
    ProductModel res =
        await ProductDetailsDataSource.getProductDetails(barcode);
    if (res.status == 1) {
      BotToast.closeAllLoading();
      _goToProductDetails(res);
    } else {
      BotToast.closeAllLoading();
      BotToast.showText(text: "Product not found");
    }
  }

  Future<void> pickImageAndScan() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      var expiryDate =
          await TextRecognizerService().recognizeExpiryDateFromImage(
        File(image.path),
      );
      if (expiryDate != null) {
        BotToast.showText(text: expiryDate);
      } else {
        BotToast.showText(text: "Expiry date not found");
      }
    }
  }

  Future<void> pickImage(ImageSource source) async {
    final file = await ImagePicker().pickImage(source: source);
    if (file != null) {
      Get.back();
      Get.toNamed(
        Routes.OCR_SCREEN,
        arguments: {"image_path": file.path},
      );
    }
  }
}
