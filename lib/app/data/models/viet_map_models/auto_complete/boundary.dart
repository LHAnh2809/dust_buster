
class Boundary {
    final int type;
    final int id;
    final String name;
    final String prefix;
    final String fullName;

    Boundary({
        required this.type,
        required this.id,
        required this.name,
        required this.prefix,
        required this.fullName,
    });

    factory Boundary.fromJson(Map<String, dynamic> json) => Boundary(
        type: json["type"],
        id: json["id"],
        name: json["name"],
        prefix: json["prefix"],
        fullName: json["full_name"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "name": name,
        "prefix": prefix,
        "full_name": fullName,
    };
}
