void main() {
  int index;
  for (index = 1; index <= 21; index++) {
    if (index == 21)
      break;
    else if (index > 1 && index < 7) continue;
    print(index);
  }
}
