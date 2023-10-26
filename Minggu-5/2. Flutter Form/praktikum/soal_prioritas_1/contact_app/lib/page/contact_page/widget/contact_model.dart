class ContactModel {
  final String name;
  final String nomor;

  ContactModel({required this.name, required this.nomor});

  @override
  String toString() {
    return "{name: $name, nomor: $nomor}";
  }
}
