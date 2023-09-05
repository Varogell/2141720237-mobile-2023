void main() {
  late String lateString;

  print("Sebelum Inisialisasi");
  // print(lateString); // Ini akan menghasilkan kesalahan jika diakses sebelum diinisialisasi

  lateString = "Ini adalah Late Variabel";
  print("Setelah Inisialisasi");
  print(lateString); // Output: This is a late variable
}