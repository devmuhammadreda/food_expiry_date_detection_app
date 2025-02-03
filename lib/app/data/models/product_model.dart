// ignore_for_file: no_leading_underscores_for_local_identifiers

class ProductModel {
  String? code;
  Product? product;
  int? status;
  String? statusVerbose;

  ProductModel({this.code, this.product, this.status, this.statusVerbose});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json["code"] is String) {
      code = json["code"];
    }
    if (json["product"] is Map) {
      product =
          json["product"] == null ? null : Product.fromJson(json["product"]);
    }
    if (json["status"] is num) {
      status = (json["status"] as num).toInt();
    }
    if (json["status_verbose"] is String) {
      statusVerbose = json["status_verbose"];
    }
  }

  static List<ProductModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(ProductModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    if (product != null) {
      _data["product"] = product?.toJson();
    }
    _data["status"] = status;
    _data["status_verbose"] = statusVerbose;
    return _data;
  }

  ProductModel copyWith({
    String? code,
    Product? product,
    int? status,
    String? statusVerbose,
  }) =>
      ProductModel(
        code: code ?? this.code,
        product: product ?? this.product,
        status: status ?? this.status,
        statusVerbose: statusVerbose ?? this.statusVerbose,
      );
}

class Product {
  String? brands;
  String? categories;
  CategoryProperties? categoryProperties;
  List<String>? entryDatesTags;
  String? expirationDate;
  int? fruitsVegetablesNuts100GEstimate;
  String? genericName;
  String? genericNameDe;
  String? genericNameEn;
  String? genericNameEs;
  String? genericNameFr;
  String? genericNameIt;
  String? id;
  String? imageUrl;
  String? packagingText;
  String? productName;
  String? productQuantity;
  String? productQuantityUnit;
  String? productType;
  String? purchasePlaces;
  String? quantity;
  String? servingQuantity;
  String? servingQuantityUnit;
  String? servingSize;

  Product({
    this.brands,
    this.categories,
    this.categoryProperties,
    this.entryDatesTags,
    this.expirationDate,
    this.fruitsVegetablesNuts100GEstimate,
    this.genericName,
    this.genericNameDe,
    this.genericNameEn,
    this.genericNameEs,
    this.genericNameFr,
    this.genericNameIt,
    this.id,
    this.imageUrl,
    this.packagingText,
    this.productName,
    this.productQuantity,
    this.productQuantityUnit,
    this.productType,
    this.purchasePlaces,
    this.quantity,
    this.servingQuantity,
    this.servingQuantityUnit,
    this.servingSize,
  });

  Product.fromJson(Map<String, dynamic> json) {
    if (json["brands"] is String) {
      brands = json["brands"];
    }
    if (json["categories"] is String) {
      categories = json["categories"];
    }
    if (json["category_properties"] is Map) {
      categoryProperties = json["category_properties"] == null
          ? null
          : CategoryProperties.fromJson(json["category_properties"]);
    }
    if (json["entry_dates_tags"] is List) {
      entryDatesTags = json["entry_dates_tags"] == null
          ? null
          : List<String>.from(json["entry_dates_tags"]);
    }
    if (json["expiration_date"] is String) {
      expirationDate = json["expiration_date"];
    }
    if (json["fruits-vegetables-nuts_100g_estimate"] is num) {
      fruitsVegetablesNuts100GEstimate =
          (json["fruits-vegetables-nuts_100g_estimate"] as num).toInt();
    }
    if (json["generic_name"] is String) {
      genericName = json["generic_name"];
    }
    if (json["generic_name_de"] is String) {
      genericNameDe = json["generic_name_de"];
    }
    if (json["generic_name_en"] is String) {
      genericNameEn = json["generic_name_en"];
    }
    if (json["generic_name_es"] is String) {
      genericNameEs = json["generic_name_es"];
    }
    if (json["generic_name_fr"] is String) {
      genericNameFr = json["generic_name_fr"];
    }
    if (json["generic_name_it"] is String) {
      genericNameIt = json["generic_name_it"];
    }
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["image_url"] is String) {
      imageUrl = json["image_url"];
    }
    if (json["packaging_text"] is String) {
      packagingText = json["packaging_text"];
    }
    if (json["product_name"] is String) {
      productName = json["product_name"];
    }
    if (json["product_quantity"] is String) {
      productQuantity = json["product_quantity"];
    }
    if (json["product_quantity_unit"] is String) {
      productQuantityUnit = json["product_quantity_unit"];
    }
    if (json["product_type"] is String) {
      productType = json["product_type"];
    }
    if (json["purchase_places"] is String) {
      purchasePlaces = json["purchase_places"];
    }
    if (json["quantity"] is String) {
      quantity = json["quantity"];
    }
    if (json["serving_quantity"] is String) {
      servingQuantity = json["serving_quantity"];
    }
    if (json["serving_quantity_unit"] is String) {
      servingQuantityUnit = json["serving_quantity_unit"];
    }
    if (json["serving_size"] is String) {
      servingSize = json["serving_size"];
    }
  }

  static List<Product> fromList(List<Map<String, dynamic>> list) {
    return list.map(Product.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["brands"] = brands;
    _data["categories"] = categories;
    if (categoryProperties != null) {
      _data["category_properties"] = categoryProperties?.toJson();
    }
    if (entryDatesTags != null) {
      _data["entry_dates_tags"] = entryDatesTags;
    }
    _data["expiration_date"] = expirationDate;
    _data["fruits-vegetables-nuts_100g_estimate"] =
        fruitsVegetablesNuts100GEstimate;
    _data["generic_name"] = genericName;
    _data["generic_name_de"] = genericNameDe;
    _data["generic_name_en"] = genericNameEn;
    _data["generic_name_es"] = genericNameEs;
    _data["generic_name_fr"] = genericNameFr;
    _data["generic_name_it"] = genericNameIt;
    _data["id"] = id;
    _data["image_url"] = imageUrl;
    _data["packaging_text"] = packagingText;
    _data["product_name"] = productName;
    _data["product_quantity"] = productQuantity;
    _data["product_quantity_unit"] = productQuantityUnit;
    _data["product_type"] = productType;
    _data["purchase_places"] = purchasePlaces;
    _data["quantity"] = quantity;
    _data["serving_quantity"] = servingQuantity;
    _data["serving_quantity_unit"] = servingQuantityUnit;
    _data["serving_size"] = servingSize;
    return _data;
  }

  Product copyWith({
    String? brands,
    String? categories,
    CategoryProperties? categoryProperties,
    List<String>? entryDatesTags,
    String? expirationDate,
    int? fruitsVegetablesNuts100GEstimate,
    String? genericName,
    String? genericNameDe,
    String? genericNameEn,
    String? genericNameEs,
    String? genericNameFr,
    String? genericNameIt,
    String? id,
    String? imageUrl,
    String? packagingText,
    String? productName,
    String? productQuantity,
    String? productQuantityUnit,
    String? productType,
    String? purchasePlaces,
    String? quantity,
    String? servingQuantity,
    String? servingQuantityUnit,
    String? servingSize,
  }) =>
      Product(
        brands: brands ?? this.brands,
        categories: categories ?? this.categories,
        categoryProperties: categoryProperties ?? this.categoryProperties,
        entryDatesTags: entryDatesTags ?? this.entryDatesTags,
        expirationDate: expirationDate ?? this.expirationDate,
        fruitsVegetablesNuts100GEstimate: fruitsVegetablesNuts100GEstimate ??
            this.fruitsVegetablesNuts100GEstimate,
        genericName: genericName ?? this.genericName,
        genericNameDe: genericNameDe ?? this.genericNameDe,
        genericNameEn: genericNameEn ?? this.genericNameEn,
        genericNameEs: genericNameEs ?? this.genericNameEs,
        genericNameFr: genericNameFr ?? this.genericNameFr,
        genericNameIt: genericNameIt ?? this.genericNameIt,
        id: id ?? this.id,
        imageUrl: imageUrl ?? this.imageUrl,
        packagingText: packagingText ?? this.packagingText,
        productName: productName ?? this.productName,
        productQuantity: productQuantity ?? this.productQuantity,
        productQuantityUnit: productQuantityUnit ?? this.productQuantityUnit,
        productType: productType ?? this.productType,
        purchasePlaces: purchasePlaces ?? this.purchasePlaces,
        quantity: quantity ?? this.quantity,
        servingQuantity: servingQuantity ?? this.servingQuantity,
        servingQuantityUnit: servingQuantityUnit ?? this.servingQuantityUnit,
        servingSize: servingSize ?? this.servingSize,
      );
}

class CategoryProperties {
  String? ciqualFoodNameEn;
  String? ciqualFoodNameFr;

  CategoryProperties({this.ciqualFoodNameEn, this.ciqualFoodNameFr});

  CategoryProperties.fromJson(Map<String, dynamic> json) {
    if (json["ciqual_food_name:en"] is String) {
      ciqualFoodNameEn = json["ciqual_food_name:en"];
    }
    if (json["ciqual_food_name:fr"] is String) {
      ciqualFoodNameFr = json["ciqual_food_name:fr"];
    }
  }

  static List<CategoryProperties> fromList(List<Map<String, dynamic>> list) {
    return list.map(CategoryProperties.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["ciqual_food_name:en"] = ciqualFoodNameEn;
    _data["ciqual_food_name:fr"] = ciqualFoodNameFr;
    return _data;
  }

  CategoryProperties copyWith({
    String? ciqualFoodNameEn,
    String? ciqualFoodNameFr,
  }) =>
      CategoryProperties(
        ciqualFoodNameEn: ciqualFoodNameEn ?? this.ciqualFoodNameEn,
        ciqualFoodNameFr: ciqualFoodNameFr ?? this.ciqualFoodNameFr,
      );
}
