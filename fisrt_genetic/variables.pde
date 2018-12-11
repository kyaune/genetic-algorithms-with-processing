String target = "qwertyuiop";
int num = target.length();

int mutation = 2;
int born = 0;

char[] zero = new char[num];

void createFirstPopulation() {
  for (int i = 0; i < tribe; i++) {
    for (int j = 0; j < target.length(); j++) {
      dna[i].genes[j] = (char) int (random(97, 128));
    }
  }
  //for(int i = 0; i < tribe; i++){
  //fitnessData[i] = fitness(dna[i]);
  //println(fitnessData[i]);
  //}
}

void printPop() {
  float xo = 440;
  float xc = xo;
  float yo = 100;
  float yc = yo;
  float yd = 40;
  float xd = 140;
  fill(0);
  textSize(10);

  for (int i = 0; i < tribe; i++) {
    text("DNA #", xc, yc);
    xc += 60;
    text(i, xc, yc);
    xc += 40;
    for (int j = 0; j < target.length(); j++) {
      text(dna[i].genes[j], xc, yc);
      xc += 15;
    }
    text("Its fitness is:", xc, yc);
    xc += 80;
    String s = nf(dna[i].fitness, 1, 1);
    text(s, xc, yc);
    xc = xo;
    yc += 12;
  }
  for (int i = 0; i < target.length(); i++) {
    DNA best = dna[0];
    for (int j = 0; j < tribe; j++) {
      if (dna[i].fitness > best.fitness) {
        best = dna[i];
      }
    }
    textSize(30);
    text(best.genes[i], xd, yd);
    xd += 40;
  }
}

//void sex() {
//  // Копируем все текущее население в предыдущее
//  for (int i = 0; i < tribe; i++) {
//    dnaPrev[i] = dna[i];
//  }
//  for (int i = 0; i < tribe; i++) {
//    int n = int(dna[i].fitness*100);
//    for (int j = 0; j < n; j++) {
//      matingPool.add(dna[i]);
//    }
//  }
//  //Производим скрещивание
//  for (int i = 0; i < tribe; i++) {
//    int a = int(random(matingPool.size()));
//    int b = int(random(matingPool.size()));
//    male = matingPool.get(a);
//    female = matingPool.get(b);
//    DNA child = male.crossover(female);
//    child.mutate();
//    dna[i] = child;
//  }
//}
