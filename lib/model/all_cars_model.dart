// List<AllCarsModel> allCarsModelFromJson(String str) => List<AllCarsModel>.from(
//     json.decode(str).map((x) => AllCarsModel.fromJson(x)));

// String allCarsModelToJson(List<AllCarsModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllCarsModel {
  AllCarsModel({
    required this.image,
    required this.id,
    required this.name,
    required this.description,
    required this.rentPerHour,
    required this.capacity,
    required this.fuelType,
    required this.deleted,
    required this.bookedTimeSlots,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  Image image;
  String id;
  String name;
  String description;
  int rentPerHour;
  int capacity;
  String fuelType;
  bool deleted;
  List<BookedTimeSlot> bookedTimeSlots;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory AllCarsModel.fromJson(Map<String, dynamic> json) => AllCarsModel(
        image: Image.fromJson(json["image"]),
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        rentPerHour: json["rentPerHour"],
        capacity: json["capacity"],
        fuelType: json["fuelType"],
        deleted: json["deleted"],
        bookedTimeSlots: List<BookedTimeSlot>.from(
            json["bookedTimeSlots"].map((x) => BookedTimeSlot.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "image": image.toJson(),
        "_id": id,
        "name": name,
        "description": description,
        "rentPerHour": rentPerHour,
        "capacity": capacity,
        "fuelType": fuelType,
        "deleted": deleted,
        "bookedTimeSlots":
            List<dynamic>.from(bookedTimeSlots.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class BookedTimeSlot {
  BookedTimeSlot({
    required this.from,
    required this.to,
    required this.id,
  });

  String from;
  String to;
  String id;

  factory BookedTimeSlot.fromJson(Map<String, dynamic> json) => BookedTimeSlot(
        from: json["from"],
        to: json["to"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "_id": id,
      };
}

class Image {
  Image({
    required this.publicId,
    required this.url,
  });

  String publicId;
  String url;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        publicId: json["public_id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "public_id": publicId,
        "url": url,
      };
}
