class Contact {
  final String name;
  final String phone;
  final String label;

  Contact({required this.name, required this.phone, required this.label});

  // Add methods for serialization/deserialization if needed
  Map<String, dynamic> toJson() {
    return {'name': name, 'phone': phone, 'label': label};
  }

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      name: json['name'],
      phone: json['phone'],
      label: json['label'],
    );
  }
}
