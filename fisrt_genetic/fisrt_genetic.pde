DNA dna1;
String pass = "une";
void setup(){
  dna1 = new DNA(pass);
size (200, 200);
}

void draw(){
  //println(target.length(), dna1.phrase);
float c = fitness(dna1.phrase);
println(c);
}
