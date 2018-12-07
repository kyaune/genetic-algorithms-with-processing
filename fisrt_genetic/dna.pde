class DNA {

  char[] genes = {' ', ' ', ' ', ' ', ' ', ' '};

  DNA(char[] a) {

    for (int i = 0; i < target.length(); i++) {
      genes[i] = a[i];
    }
  }
}

char[] crossover(char[] a, char [] b) {
  char[] result = {' ', ' ', ' ', ' ', ' ', ' '};
  for (int i = 0; i < target.length(); i++) {
    if (i % 2 == 0) {
      result[i] = a[i];
    }
    if (i % 2 !=0) {
      result[i] = b[i];
    }
  }
  return result;
}

char[] mutate(char [] a) {
  char[] result = {' ', ' ', ' ', ' ', ' ', ' '};
  for (int i = 0; i< target.length(); i++) {
    result[i] = a[i];
    int coin = (int) random(0, 100);
    if (coin <= mutation) {
      result[i] = (char) int (random(97, 122));
    }
  }
  return result;
}
