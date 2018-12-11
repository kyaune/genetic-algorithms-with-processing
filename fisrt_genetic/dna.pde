class DNA {

  char[] genes;
  float fitness;

  DNA() {
    genes = new char[num];
    for (int i = 0; i < target.length(); i++) {
      genes[i] = (char)random(97, 128);
    }
  }

  void checkFitness() {
    int score = 0;
    float f = 0;
    for (int i = 0; i < genes.length; i++) {
      if (genes[i] == target.charAt(i)) {
        score++;
      }
    }
    fitness = float(score)/target.length();
  }


  DNA crossover(DNA partner) {
    DNA result = new DNA();
    for (int i = 0; i < genes.length; i++) {
      if (i % 2 == 0) {
        result.genes[i] = genes[i];
      }
      if (i % 2 !=0) {
        result.genes[i] = partner.genes[i];
      }
    }
    return result;
  }

  void mutate() {

    for (int i = 0; i< genes.length; i++) {
      int coin = (int) random(0, 100);
      if (coin <= mutation) {
        genes[i] = (char) int (random(97, 128));
      }
    }
  }
}
