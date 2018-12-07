DNA[] dna;
DNA[] dnaPrev;
DNA male, female;
void setup() {
  // dna1 = new DNA(pass);
  size (800, 800);
  dnaPrev = new DNA[tribe];
  for (int i = 0; i < tribe; i++) {
    dnaPrev[i] = new DNA(zero);
  }
  dna = new DNA[tribe];
  for (int i = 0; i < tribe; i++) {
    dna[i] = new DNA(zero);
  }
  male = new DNA(zero);
  female = new DNA(zero);
  createFirstPopulation();
}

void draw() {
  background(255);
  //for(int i = 0; i < tribe; i++){
  //   for(int j = 0; j < target.length(); j++){
  //     dna[i].genes[j] = (char) int (random(33,127));
  //     print(dna[i].genes[j]);
  //   }
  //   println("New DNA");
  //}
  printPop();
  //int x = 'z';
  //println(x);
  //sex();
}
