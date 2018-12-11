int tribe = 190;
DNA[] dna = new DNA[tribe];
DNA male, female;
String target = "stasislookinggood";
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
    while (male == female) {
      b = int(random(matingPool.size()));
      female = matingPool.get(b);
    }
    DNA child = male.crossover(female);
    child.mutate();
    dna[i] = child;
  }
}

void printPop() {
  //Для днк
  float xo = 640;
  float xc = xo;
  float yo = 60;
  float yc = yo;
  //Для лучшего
  float yd = 540;
  float xd = 90;
  //Для avg
  float ya = yd + 40;
  float xa = xd;
  //Для задания
  float xt = xd;
  float yt = 140;
  fill(0);
  textSize(10);

  for (int i = 0; i < dna.length; i++) {
    //Номер челика
    text("DNA #", xc, yc);
    xc += 50;
    text(i, xc, yc);
    xc += 40;
    //Гены челика
    for (int j = 0; j < target.length(); j++) {
      text(dna[i].genes[j], xc, yc);
      xc += 15;
    }
    //Фитнесс челика
    text("Its fitness is:", xc, yc);
    xc += 80;
    String s = nf(dna[i].fitness*100, 1, 1);
    text(s, xc, yc);
    xc = xo;
    //Переход к следующему челику
    yc += 12;
  }
  //Задание
  textSize(40);
  text("We are looking for the:", xt, yt);
  textSize(60);
  text(target, xt, yt + 90);
  //Вычисление лучшего
  DNA best = dna[0];
  float totalF = 0;
  for (int i = 0; i < dna.length; i++) {
    totalF += dna[i].fitness;
    if (dna[i].fitness > best.fitness) {
      best = dna[i];
    }
  }
  //Отображаем лучшего
  textSize(30);
  text("Best right now:", xd, yd - 40);
  for (int i = 0; i < best.genes.length; i++) {
    textSize(30);
    text(best.genes[i], xd, yd);
    xd += 20;
  }
  //Под лучшим будем писать средний фитнесс
  textSize(30);
  text("Current average fitness is:", xa, ya);
  String m = nf(100*totalF/tribe, 1, 1);
  text(m, xa + 390, ya);
  //Таймер
  text("Time spent:", xa, ya + 40);
  float time = millis();
  text(time/1000, xa + 200, ya + 40);
}

void end() {
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
