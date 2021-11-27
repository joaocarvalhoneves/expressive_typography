class RectUm {
  float l = random(30, 400);
  float a =  random(5, 15);
  float x = random(0, width-l);
  float y = random(0, height-a);


  RectUm() {
  }

// desenha os retangulos
  void desenha() {
    noStroke();
    fill((int)random(100,120),(int)random(80,110));
    rect(x, y, l, a);
  }
}
