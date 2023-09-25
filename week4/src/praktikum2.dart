void main(){
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);
  var names1 = <String>{};
 Set<String> names2 = {}; // This works, too.
var names3 = {}; // Creates a map, not a set.
names1.add("Alvaro Hegel Ivanka");
names1.add("2141720237");

names2.addAll({"Alavaro Hegel ivanka","2141720237"});
print(names1);
print(names2);
print(names3);
}