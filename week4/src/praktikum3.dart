void main(){
  var gifts = {
  // Key:    Value
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 1,
  'Nama' :'Alvaro Hegel Ivanka',
  'Nim' : 2141720237
};

var nobleGases = {
  2: 'helium',
  10: 'neon',
  18: 2,
   'Nama' :'Alvaro Hegel Ivanka',
  'Nim' : 2141720237
};


var mhs1 = Map<String, String>();
mhs1['first'] = 'partridge';
mhs1['second'] = 'turtledoves';
mhs1['fifth'] = 'golden rings';

var mhs2 = Map<int, String>();
mhs2[2] = 'helium';
mhs2[10] = 'neon';
mhs2[18] = 'argon';

gifts['nama'] = 'Alvaro Hegel Ivanka';
gifts['NIM'] = '2141720237';
nobleGases[0] = 'Alvaro Hegel Ivanka';
nobleGases[1] = '2141720237';
mhs1['nama'] = 'Alvaro Hegel Ivanka';
mhs1['NIM'] = '2141720237';
mhs2[0] = 'Alvaro Hegel Ivanka';
mhs2[1] = '2141720237';

print(mhs1);
print(mhs2);
print(gifts);
print(nobleGases);
}