class ContactData {
  final String name;
  final String nomor;

  ContactData({required this.name, required this.nomor});

  @override
  String toString() {
    return "{name: $name, nomor: $nomor}";
  }
}
