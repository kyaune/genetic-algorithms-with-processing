int tribe = 50;
DNA[] dna = new DNA[tribe];
DNA[] dnaPrev = new DNA[tribe];
DNA male, female;

void setup() {
  size (1200, 1200);
  for (int i = 0; i < tribe; i++) {
    dnaPrev[i] = new DNA();
  }
  for (int i = 0; i < tribe; i++) {
    dna[i] = new DNA();
  }
  male = new DNA();
  female = new DNA();
  createFirstPopulation();
}

void draw() {
  background(255);
  //println(dna[0].fitness);
  for (int i = 0; i < tribe; i++) {
    dna[i].checkFitness();
  }
  ArrayList <DNA> matingPool = new ArrayList<DNA>();
  for (int i = 0; i < tribe; i++) {
    int n = int(dna[i].fitness*100);
    for (int j = 0; j < n; j++) {
      matingPool.add(dna[i]);
    }
  }
  //Производим скрещивание
  for (int i = 0; i < tribe; i++) {
    int a = int(random(matingPool.size()));
    int b = int(random(matingPool.size()));
    male = matingPool.get(a);
    female = matingPool.get(b);
    DNA child = male.crossover(female);
    child.mutate();
    dna[i] = child;
  }
  printPop();
  for (int i = 0; i < tribe; i++) {
    float score = 0;
    for(int j = 0; j < dna[i].genes.length; j++){
      if (dna[i].genes[j] == target.charAt(j)) {
        score++;
      }
    }
    println(dna[i].fitness);
    if(score == target.length()){
    noLoop();
    }
}
}
