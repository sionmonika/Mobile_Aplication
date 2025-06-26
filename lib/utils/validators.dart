class Validators {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) return 'Name is required';
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) return 'Phone is required';
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Phone must contain only numbers';
    }
    if (value.length < 8 || value.length > 15) {
      return 'Phone must be 8-15 digits';
    }
    return null;
  }

  static String? validateDropdown(String? value) {
    if (value == null || value.isEmpty) return 'This field is required';
    return null;
  }
}
