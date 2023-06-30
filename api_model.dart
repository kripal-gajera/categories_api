// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  List<Category> categories;

  CategoryModel({
    required this.categories,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    categories: List<Category>.from(json["Categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class Category {
  String name;
  List<LocalizedName> localizedNames;
  dynamic description;
  int categoryTemplateId;
  String? metaKeywords;
  String? metaDescription;
  dynamic metaTitle;
  int parentCategoryId;
  int pageSize;
  PageSizeOptions pageSizeOptions;
  String? priceRanges;
  dynamic showOnHomePage;
  bool includeInTopMenu;
  dynamic hasDiscountsApplied;
  bool published;
  bool deleted;
  int displayOrder;
  DateTime createdOnUtc;
  DateTime updatedOnUtc;
  List<dynamic> roleIds;
  dynamic discountIds;
  List<dynamic> storeIds;
  Image image;
  String seName;
  List<dynamic> product;
  int id;

  Category({
    required this.name,
    required this.localizedNames,
    this.description,
    required this.categoryTemplateId,
    this.metaKeywords,
    this.metaDescription,
    this.metaTitle,
    required this.parentCategoryId,
    required this.pageSize,
    required this.pageSizeOptions,
    this.priceRanges,
    this.showOnHomePage,
    required this.includeInTopMenu,
    this.hasDiscountsApplied,
    required this.published,
    required this.deleted,
    required this.displayOrder,
    required this.createdOnUtc,
    required this.updatedOnUtc,
    required this.roleIds,
    this.discountIds,
    required this.storeIds,
    required this.image,
    required this.seName,
    required this.product,
    required this.id,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    name: json["name"],
    localizedNames: List<LocalizedName>.from(json["localized_names"].map((x) => LocalizedName.fromJson(x))),
    description: json["description"],
    categoryTemplateId: json["category_template_id"],
    metaKeywords: json["meta_keywords"],
    metaDescription: json["meta_description"],
    metaTitle: json["meta_title"],
    parentCategoryId: json["parent_category_id"],
    pageSize: json["page_size"],
    pageSizeOptions: pageSizeOptionsValues.map[json["page_size_options"]]!,
    priceRanges: json["price_ranges"],
    showOnHomePage: json["show_on_home_page"],
    includeInTopMenu: json["include_in_top_menu"],
    hasDiscountsApplied: json["has_discounts_applied"],
    published: json["published"],
    deleted: json["deleted"],
    displayOrder: json["display_order"],
    createdOnUtc: DateTime.parse(json["created_on_utc"]),
    updatedOnUtc: DateTime.parse(json["updated_on_utc"]),
    roleIds: List<dynamic>.from(json["role_ids"].map((x) => x)),
    discountIds: json["discount_ids"],
    storeIds: List<dynamic>.from(json["store_ids"].map((x) => x)),
    image: Image.fromJson(json["image"]),
    seName: json["se_name"],
    product: List<dynamic>.from(json["product"].map((x) => x)),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "localized_names": List<dynamic>.from(localizedNames.map((x) => x.toJson())),
    "description": description,
    "category_template_id": categoryTemplateId,
    "meta_keywords": metaKeywords,
    "meta_description": metaDescription,
    "meta_title": metaTitle,
    "parent_category_id": parentCategoryId,
    "page_size": pageSize,
    "page_size_options": pageSizeOptionsValues.reverse[pageSizeOptions],
    "price_ranges": priceRanges,
    "show_on_home_page": showOnHomePage,
    "include_in_top_menu": includeInTopMenu,
    "has_discounts_applied": hasDiscountsApplied,
    "published": published,
    "deleted": deleted,
    "display_order": displayOrder,
    "created_on_utc": createdOnUtc.toIso8601String(),
    "updated_on_utc": updatedOnUtc.toIso8601String(),
    "role_ids": List<dynamic>.from(roleIds.map((x) => x)),
    "discount_ids": discountIds,
    "store_ids": List<dynamic>.from(storeIds.map((x) => x)),
    "image": image.toJson(),
    "se_name": seName,
    "product": List<dynamic>.from(product.map((x) => x)),
    "id": id,
  };
}

class Image {
  String src;
  dynamic attachment;

  Image({
    required this.src,
    this.attachment,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    src: json["src"],
    attachment: json["attachment"],
  );

  Map<String, dynamic> toJson() => {
    "src": src,
    "attachment": attachment,
  };
}

class LocalizedName {
  int languageId;
  String localizedName;

  LocalizedName({
    required this.languageId,
    required this.localizedName,
  });

  factory LocalizedName.fromJson(Map<String, dynamic> json) => LocalizedName(
    languageId: json["language_id"],
    localizedName: json["localized_name"],
  );

  Map<String, dynamic> toJson() => {
    "language_id": languageId,
    "localized_name": localizedName,
  };
}

enum PageSizeOptions { THE_639 }

final pageSizeOptionsValues = EnumValues({
  "6, 3, 9": PageSizeOptions.THE_639
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
