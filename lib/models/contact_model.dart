class ContactModel {
  final String name;
  final String email;
  final String phone;
  final String? imagePath;

  const ContactModel({
    required this.name,
    required this.email,
    required this.phone,
    this.imagePath,
  });
}