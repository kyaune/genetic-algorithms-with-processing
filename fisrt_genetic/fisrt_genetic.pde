int tribe = 90;
DNA[] dna = new DNA[tribe];
DNA male, female;
String target = "qwerty";
int num = target.length();
int mutation = 2;

void setup() {
  size (1200, 1200);
  for (int i = 0; i < dna.length; i++) {
    dna[i] = new DNA();
  }
  male = new DNA();
  female = new DNA();
}

void draw() {
  background(255);
  for (int i = 0; i < dna.length; i++) {
    dna[i].checkFitness();
  }
    printPop();
     end();
  ArrayList <DNA> matingPool = new ArrayList<DNA>();
  for (int i = 0; i < dna.length; i++) {
    int n = int(dna[i].fitness*100);
    for (int j = 0; j < n; j++) {
      matingPool.add(dna[i]);
    }
  }
  //Производим скрещивание
  for (int i = 0; i < dna.length; i++) {
    int a = int(random(matingPool.size()));
    int b = int(random(matingPool.size()));
    male = matingPool.get(a);
    female = matingPool.get(b);
    //while (male == female) {
    //  b = int(random(matingPool.size()));
    //  female = matingPool.get(b);
    //}
    DNA child = male.crossover(female);
    child.mutate();
    dna[i] = child;
  }
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

  for (int i = 0; i < dna.length; i++) {
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
    String s = nf(dna[i].fitness*100, 1, 1);
    text(s, xc, yc);
    xc = xo;
    yc += 12;
  }
  DNA best = dna[0];
  for (int i = 0; i < dna.length; i++) {
    if (dna[i].fitness > best.fitness) {
        best = dna[i];
      }
  }
    for (int i = 0; i < best.genes.length; i++) {
      textSize(30);
    text(best.genes[i], xd, yd);
    xd += 40;
    }
}

void end(){
for (int i = 0; i < dna.length; i++) {
    float end = 0;
    for (int j = 0; j < dna[i].genes.length; j++) {
      if (dna[i].genes[j] == target.charAt(j)) {
        end++;
      }
    }
    if (end == target.length()) {
      noLoop();
    }
  }
}
