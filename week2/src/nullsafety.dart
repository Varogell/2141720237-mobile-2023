void main() {
  String? nullableString = "Hello, World"; // Variabel dapat berisi nilai null (?)
  String nonNullableString = "Hello, Dart"; // Variabel tidak dapat berisi nilai null

  print(nullableString); // Output: Hello, World
  print(nonNullableString); // Output: Hello, Dart

  // nullableString = null; // Ini akan menghasilkan kesalahan karena nullableString adalah nullable
}