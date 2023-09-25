//Positional Parameters (Parameter Posisi)
// void greet(String name, int age) {
//   print("Halo, nama saya $name dan saya berusia $age tahun.");
// }
// void main(){
// greet("John", 25); // Output: Halo, nama saya John dan saya berusia 25 tahun.
// }

//Named Parameters (Parameter Nama)
// void greet({required name, required age}) {
//   print("Halo, nama saya $name dan saya berusia $age tahun.");
// }
// void main(){
// greet(name: "John", age: 25); // Output: Halo, nama saya John dan saya berusia 25 tahun.
// greet(age: 30, name: "Jane"); // Output: Halo, nama saya Jane dan saya berusia 30 tahun.
// }

// Default Parameters (Parameter Default)
// void greet(String name, {int age = 18}) {
//   print("Halo, nama saya $name dan saya berusia $age tahun.");
// }
// void main(){
// greet("John"); // Output: Halo, nama saya John dan saya berusia 18 tahun.
// greet("Jane", age: 25); // Output: Halo, nama saya Jane dan saya berusia 25 tahun.
// }

//Required Parameters (Parameter Wajib)
// void greet(String name, int age) {
//   print("Halo, nama saya $name dan saya berusia $age tahun.");
// }
// void main(){
// greet("John", 25); // Output: Halo, nama saya John dan saya berusia 25 tahun.
// greet("Jane"); // Error: The argument type 'String' can't be assigned to the parameter type 'int'.
// }

// Functions sebagai first-class objects
// void sayHello() {
//   print("Halo, dunia!");
// }

// void greet(Function function) {
//   function();
// }

// void main() {
//   Function myFunction = sayHello;
//   greet(myFunction); // Output: Halo, dunia!
// }

// Anonymous Functions
// void main() {
//   // Contoh 1: Menggunakan anonymous function sebagai argumen
//   var numbers = [1, 2, 3, 4, 5];

//   numbers.forEach((number) {
//     print(number);
//   });

//   // Contoh 2: Menggunakan anonymous function sebagai nilai kembali
//   var multiplyByTwo = (int number) => number * 2;

//   print(multiplyByTwo(5)); // Output: 10
// }

// Lexical Scope (Lingkup Leksikal)
// void main() {
//   var x = 10;

//   void innerFunction() {
//     var y = 20;
//     print(x + y); // x dan y dapat diakses di dalam innerFunction()
//   }

//   innerFunction();
//   print(x); // x hanya dapat diakses di dalam main()
//   print(y); // Error: Variabel 'y' tidak dikenali di dalam scope ini
// }

// Lexical Closures (Penutupan Leksikal)
// Function makeAdder(int x) {
//   return (int y) => x + y;
// }

// void main() {
//   var adder = makeAdder(5);
//   print(adder(10)); // Output: 15
// }

// return multi value di functions
// Map<String, dynamic> getPersonInfo(){
//   return{
//     'name': 'John',
//     'age' : 20,
//     'city': 'Paris',
//   };
// }

// void main(){
//   var person = getPersonInfo();
//   print('Name: ${person['name']}');
//   print('Age: ${person['Age']}');
//   print('City: ${person['city']}');
// }