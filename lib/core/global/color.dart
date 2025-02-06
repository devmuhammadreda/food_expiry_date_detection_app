import 'package:flutter/material.dart';

import '../enums/enums.dart';

Color productExpiryStatusToColor(ProductExpiryStatus status) {
  switch (status) {
    case ProductExpiryStatus.approachingExpired:
      return Colors.yellow;
    case ProductExpiryStatus.expired:
      return Colors.red;
    case ProductExpiryStatus.safe:
      return Colors.green;
    case ProductExpiryStatus.unknown:
      return Colors.grey;
  }
}
