class RectDois {
  float a = random(30, 100);
  float l =  random(5, 15);
  float x = random(0, width-l);
  float y = random(0, height-a);


  RectDois() {
  }

// desenha os retangulos
  void desenha() {
    noStroke();
    fill((int)random(100,120),(int)random(80,110));
    rect(x, y, l, a);
  }
}
