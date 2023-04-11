class ShopListModel {
  ShopListModel({
    this.data,
  });

  List<ShopModel>? data;

  ShopListModel copyWith({
    List<ShopModel>? data,
    Links? links,
    Meta? meta,
  }) =>
      ShopListModel(
        data: data ?? this.data,
      );

  factory ShopListModel.fromJson(Map<String, dynamic> json) => ShopListModel(
        data: json["data"] == null
            ? []
            : List<ShopModel>.from(
                json["data"]!.map((x) => ShopModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ShopModel {
  ShopModel({
    this.id,
    this.uuid,
    this.open,
    this.visibility,
    this.backgroundImg,
    this.logoImg,
    this.status,
    this.type,
    this.avgRate,
    this.deliveryTime,
    this.ratingAvg,
    this.reviewsCount,
    this.productsCount,
    this.translation,
    this.isRecommended,
  });

  int? id;
  String? uuid;

  bool? open;
  int? visibility;
  String? backgroundImg;
  String? logoImg;
  String? status;
  String? type;
  double? avgRate;
  DeliveryTime? deliveryTime;
  double? ratingAvg;
  int? reviewsCount;
  int? productsCount;
  Translation? translation;
  bool? isRecommended;

  ShopModel copyWith({
    int? id,
    String? uuid,
    dynamic discountsCount,
    bool? open,
    int? visibility,
    String? backgroundImg,
    String? logoImg,
    String? status,
    String? type,
    double? avgRate,
    DeliveryTime? deliveryTime,
    double? ratingAvg,
    int? reviewsCount,
    Location? location,
    int? productsCount,
    Translation? translation,
    List<dynamic>? locales,
    dynamic bonus,
    List<Discount>? discount,
    List<ShopWorkingDay>? shopWorkingDays,
    List<ShopClosedDate>? shopClosedDate,
    bool? isRecommended,
  }) =>
      ShopModel(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        open: open ?? this.open,
        visibility: visibility ?? this.visibility,
        backgroundImg: backgroundImg ?? this.backgroundImg,
        logoImg: logoImg ?? this.logoImg,
        status: status ?? this.status,
        type: type ?? this.type,
        avgRate: avgRate ?? this.avgRate,
        deliveryTime: deliveryTime ?? this.deliveryTime,
        ratingAvg: ratingAvg ?? this.ratingAvg,
        reviewsCount: reviewsCount ?? this.reviewsCount,
        productsCount: productsCount ?? this.productsCount,
        translation: translation ?? this.translation,
        isRecommended: isRecommended ?? this.isRecommended,
      );

  factory ShopModel.fromJson(Map<String, dynamic> json) => ShopModel(
        id: json["id"],
        uuid: json["uuid"],
        open: json["open"],
        visibility: json["visibility"],
        backgroundImg: json["background_img"],
        logoImg: json["logo_img"],
        status: json["status"],
        type: json["type"],
        avgRate: json["avg_rate"]?.toDouble(),
        deliveryTime: json["delivery_time"] == null
            ? null
            : DeliveryTime.fromJson(json["delivery_time"]),
        ratingAvg: json["rating_avg"]?.toDouble(),
        reviewsCount: json["reviews_count"],
        productsCount: json["products_count"],
        translation: json["translation"] == null
            ? null
            : Translation.fromJson(json["translation"]),
        isRecommended: json["is_recommended"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "open": open,
        "visibility": visibility,
        "background_img": backgroundImg,
        "logo_img": logoImg,
        "status": status,
        "type": type,
        "avg_rate": avgRate,
        "delivery_time": deliveryTime?.toJson(),
        "rating_avg": ratingAvg,
        "reviews_count": reviewsCount,
        "products_count": productsCount,
        "is_recommended": isRecommended,
      };
}

class DeliveryTime {
  DeliveryTime({
    this.to,
    this.from,
    this.type,
  });

  String? to;
  String? from;
  String? type;

  DeliveryTime copyWith({
    String? to,
    String? from,
    String? type,
  }) =>
      DeliveryTime(
        to: to ?? this.to,
        from: from ?? this.from,
        type: type ?? this.type,
      );

  factory DeliveryTime.fromJson(Map<String, dynamic> json) => DeliveryTime(
        to: json["to"],
        from: json["from"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "to": to,
        "from": from,
        "type": type,
      };
}

class Discount {
  Discount({
    this.id,
    this.shopId,
    this.end,
    this.active,
  });

  int? id;
  int? shopId;
  DateTime? end;
  int? active;

  Discount copyWith({
    int? id,
    int? shopId,
    DateTime? end,
    int? active,
  }) =>
      Discount(
        id: id ?? this.id,
        shopId: shopId ?? this.shopId,
        end: end ?? this.end,
        active: active ?? this.active,
      );

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
        id: json["id"],
        shopId: json["shop_id"],
        end: json["end"] == null ? null : DateTime.parse(json["end"]),
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_id": shopId,
        "end":
            "${end!.year.toString().padLeft(4, '0')}-${end!.month.toString().padLeft(2, '0')}-${end!.day.toString().padLeft(2, '0')}",
        "active": active,
      };
}

class Location {
  Location({
    this.latitude,
    this.longitude,
  });

  String? latitude;
  String? longitude;

  Location copyWith({
    String? latitude,
    String? longitude,
  }) =>
      Location(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class ShopClosedDate {
  ShopClosedDate({
    this.id,
    this.day,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  DateTime? day;
  DateTime? createdAt;
  DateTime? updatedAt;

  ShopClosedDate copyWith({
    int? id,
    DateTime? day,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      ShopClosedDate(
        id: id ?? this.id,
        day: day ?? this.day,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ShopClosedDate.fromJson(Map<String, dynamic> json) => ShopClosedDate(
        id: json["id"],
        day: json["day"] == null ? null : DateTime.parse(json["day"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "day":
            "${day!.year.toString().padLeft(4, '0')}-${day!.month.toString().padLeft(2, '0')}-${day!.day.toString().padLeft(2, '0')}",
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class ShopWorkingDay {
  ShopWorkingDay({
    this.id,
    this.day,
    this.from,
    this.to,
    this.disabled,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? day;
  String? from;
  String? to;
  bool? disabled;
  DateTime? createdAt;
  DateTime? updatedAt;

  ShopWorkingDay copyWith({
    int? id,
    String? day,
    String? from,
    String? to,
    bool? disabled,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      ShopWorkingDay(
        id: id ?? this.id,
        day: day ?? this.day,
        from: from ?? this.from,
        to: to ?? this.to,
        disabled: disabled ?? this.disabled,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ShopWorkingDay.fromJson(Map<String, dynamic> json) => ShopWorkingDay(
        id: json["id"],
        day: json["day"],
        from: json["from"],
        to: json["to"],
        disabled: json["disabled"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "day": day,
        "from": from,
        "to": to,
        "disabled": disabled,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Translation {
  Translation({
    this.id,
    this.locale,
    this.title,
    this.description,
    this.address,
  });

  int? id;
  String? locale;
  String? title;
  String? description;
  String? address;

  Translation copyWith({
    int? id,
    String? locale,
    String? title,
    String? description,
    String? address,
  }) =>
      Translation(
        id: id ?? this.id,
        locale: locale ?? this.locale,
        title: title ?? this.title,
        description: description ?? this.description,
        address: address ?? this.address,
      );

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        id: json["id"],
        locale: json["locale"],
        title: json["title"],
        description: json["description"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "locale": locale,
        "title": title,
        "description": description,
        "address": address,
      };
}

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  Links copyWith({
    String? first,
    String? last,
    dynamic prev,
    dynamic next,
  }) =>
      Links(
        first: first ?? this.first,
        last: last ?? this.last,
        prev: prev ?? this.prev,
        next: next ?? this.next,
      );

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int? currentPage;
  int? from;
  int? lastPage;
  List<Link>? links;
  String? path;
  String? perPage;
  int? to;
  int? total;

  Meta copyWith({
    int? currentPage,
    int? from,
    int? lastPage,
    List<Link>? links,
    String? path,
    String? perPage,
    int? to,
    int? total,
  }) =>
      Meta(
        currentPage: currentPage ?? this.currentPage,
        from: from ?? this.from,
        lastPage: lastPage ?? this.lastPage,
        links: links ?? this.links,
        path: path ?? this.path,
        perPage: perPage ?? this.perPage,
        to: to ?? this.to,
        total: total ?? this.total,
      );

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  Link copyWith({
    String? url,
    String? label,
    bool? active,
  }) =>
      Link(
        url: url ?? this.url,
        label: label ?? this.label,
        active: active ?? this.active,
      );

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
