class Validators {
  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter the name';
    }
    return null;
  }

  static String? email(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Please enter the email';

    final regex = RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[\w\-]{2,}$');
    if (!regex.hasMatch(text)) return 'Invalid email';
    return null;
  }

  static String? phone(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Please enter the phone';

    final regex = RegExp(r'^\+?[0-9]{7,15}$');
    if (!regex.hasMatch(text)) return 'Invalid phone number';
    return null;
  }
}