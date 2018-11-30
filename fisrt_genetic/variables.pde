String target = "uni";
float l = 100/target.length();
int population = 20;
float mutation = 0.01;

float fitness(String phrase){
  float f = 0;
  for(int i = 0; i < target.length(); i++){
  if(phrase.charAt(i) == target.charAt(i)){
  f += 100/target.length();
  //println(l);
  //println(f);
  }
  }
  return f;
}
