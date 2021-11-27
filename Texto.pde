class Texto {
  PImage img;             
  float a = 10;
  float c = 170;
  boolean feito = false;
  boolean trigger = false;
  float x = width/2;
  float y = height/2;


  Texto(PImage img) {
    this.img = img;
  }

// faz aparecer cada letra/imagem
  void desenha() {
    tint(a);
    if (trigger) {
      a = 170;
    } else {
      feito = false;
    }
    if (a>=170) {
      feito = true;
    }
    if (trigger) {
      if (feito)
        a=170;
      if (feito && int(random(1, 40))== 2)
        a=0;
    }
    image(img, x, y);
  }

  // letras não alinhadas
  void desenha1() {
    float b = (int)random(1, 4);
    tint(140, c);
    if (b == 1)
      image(img, x-8, y+8);
    if (b == 2)
      image(img, x-8, y-8);
    if (b == 3)
      image(img, x+8, y-8);
    if (b == 4)
      image(img, x+8, y+8);
  }

  // faz tremer as letras
  void randomizer(float v, float c) {
    x=width/2+random(v, c);
    y=height/2+random(v, c);
  }

  // retorna ao local inicial
  void def() {
    x = width/2;
    y = height/2;
  }

  // atribue um valor ao alfa
  void setA(int o) {
    if (!feito)
      a = o;
  }

  // intercala a conclusão da palavra
  void setT(boolean o) {
    trigger = o;
  }

  // intercala o a conclusão da letra
  void setF(boolean o) {
    feito = o;
  }

  // intercala a imagem/letra
  void switchimg(PImage p) {
    img = p;
  }
  // devolve o alfa
  float getA() {
    return a;
  }

  // devolve se a palavra está toda à vista
  boolean getT() {
    return trigger;
  }

  // devolve se a letra está à vista
  boolean getF() {
    return feito;
  }
}
