import 'package:flutter/foundation.dart';

import '../../../core/global/const.dart';
import '../../../core/services/network_service.dart/dio_network_service.dart';
import '../models/product_model.dart';

class ProductDetailsDataSource {
  static Future<ProductModel> getProductDetails(String code) async {
    final request = NetworkRequest(
      path: "${APIKeys.productByBarCode}$code.json",
      type: NetworkRequestType.GET,
      data: const NetworkRequestBody.empty(),
    );
    final response = await networkService.execute(
      request,
      (parser) => ProductModel.fromJson(parser),
    );
    var data = response.maybeWhen(
      ok: ((data) {
        return data;
      }),
      orElse: () {
        return ProductModel(
          status: 500,
          code: "0",
          statusVerbose: "No Data",
        );
      },
      badRequest: (data) {
        return data;
      },
      created: (data) {
        return data;
      },
      noAuth: (data) {
        return data;
      },
      conflict: (data) {
        return data;
      },
      invalidParameters: (data) {
        return data;
      },
      noAccess: (data) {
        return data;
      },
      noData: (message) {
        if (kDebugMode) {
          print(message);
        }
        return ProductModel(
          status: 500,
          code: "0",
          statusVerbose: "No Data",
        );
      },
      notFound: (data) {
        return data;
      },
    );
    return data;
  }
}
