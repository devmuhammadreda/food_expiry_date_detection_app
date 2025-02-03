import 'package:uid/uid.dart';

String generateUid() {
  return UId.getId(quantityOfRandomString: 5); // Generate a random string
}
