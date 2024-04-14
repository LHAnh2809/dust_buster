
class Location {
    final String id;
    final String idUsers;
    final String location;
    final String location2;
    final String lat;
    final String lng;
    final int defaultt;

    Location({
        required this.id,
        required this.idUsers,
        required this.location,
        required this.location2,
        required this.lat,
        required this.lng,
        required this.defaultt,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        idUsers: json["id_users"],
        location: json["location"],
        location2: json["location2"],
        lat: json["lat"],
        lng: json["lng"],
        defaultt: json["defaultt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_users": idUsers,
        "location": location,
        "location2": location2,
        "lat": lat,
        "lng": lng,
        "defaultt": defaultt,
    };
}
