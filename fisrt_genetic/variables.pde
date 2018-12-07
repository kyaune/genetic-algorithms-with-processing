String target = "unicor";
float l = 100/target.length();
int tribe = 20;
int mutation = 2;
int born = 0;

char[] zero = {' ', ' ', ' ', ' ', ' ', ' '};

float [] fitnessData = new float[tribe];

float fitness(DNA a) {
  float score = 0;
  for (int i = 0; i < target.length(); i++) {
    if (a.genes[i] == target.charAt(i)) {
      score += 100/target.length();
    }
  }
  return score;
}

void createFirstPopulation() {
  for (int i = 0; i < tribe; i++) {
    for (int j = 0; j < target.length(); j++) {
      dna[i].genes[j] = (char) int (random(97, 122));
    }
  }
  for(int i = 0; i < tribe; i++){
  fitnessData[i] = fitness(dna[i]);
  println(fitnessData[i]);
  }
}

void printPop() {
  float xo = 140;
  float xc = xo;
  float yo = 140;
  float yc = yo;
  float yd = 40;
  float xd = 140;
  fill(0);
  textSize(15);

  for (int i = 0; i < tribe; i++) {
    float f = fitness(dna[i]);
    text("DNA #", xc, yc);
    xc += 60;
    text(i, xc, yc);
    xc += 40;
    for (int j = 0; j < target.length(); j++) {
      text(dna[i].genes[j], xc, yc);
      xc += 15;
    }
    text("Its fitness is:", xc, yc);
    xc += 120;
    String s = nf(f,1,0);
    text(s, xc, yc);
    xc = xo;
    yc += 20;
  }
  for (int i = 0; i < tribe; i++) {
   float f = fitnessData[i];
   String s = nf(f,1,0);
  text(s, xd, yd);
  xd += 30;
  }
}

void sex() {
  //Суммарное количество фитнесов. Если он равен нулю, то даем ему значение мутации
  //float wholeData = 0;
  //for(int i = 0; i < tribe; i++){
  //  if(fitnessData[i] == 0){
  //  fitnessData[i] = mutation;
  //  }
  //wholeData += fitnessData[i];
  //}
  //for(int i = 0; i < tribe; i++){
  //  fitnessData[i] = fitnessData[i]/wholeData;
  //  println(fitnessData[i]);
  //}
 // Копируем все текущее население в предыдущее
  for(int i = 0; i < tribe; i++){
    dnaPrev[i] = dna[i];
  }
  //Производим скрещивание
  for(int i = 0; i < tribe; i++){
    int flag = 0;
    while(flag == 0){
    int coin = (int)random(0,100);
    
    }
  }
}
