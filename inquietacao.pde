import ddf.minim.*; 
import ddf.minim.effects.*;  
import ddf.minim.ugens.*;
import ddf.minim.analysis.*;
Minim minim;                                
AudioInput in; 
AudioPlayer musica;
AudioPlayer inhale;
FFT fft;
RectUm      [] rectu  = new RectUm  [40];
RectDois    [] rectd  = new RectDois [40];
Texto       [] t      = new Texto    [11];
PImage imgs []        = new PImage   [11];
PImage imga []        = new PImage   [11];
PImage introo;
PFont fonte;
int savepos = 0;
boolean finale = false;
boolean save = false;
boolean check = false;
boolean intro = true;
float cena = 0;
int contador = 0;
int rato = 0;
int j;
int k = (int)random(0, 11);
int l = (int)random(0, 11);


void setup() {
  surface.setTitle("inquietação");
  size(800, 200);
  minim  = new Minim(this);
  in     = minim.getLineIn();
  inhale = minim.loadFile("exhale.wav");
  musica = minim.loadFile("1.wav");
  fft    = new FFT(musica.bufferSize(), musica.sampleRate());
  musica.loop();
  in = minim.getLineIn();
  textAlign(CENTER, CENTER);
  imageMode(CENTER);
  textSize(80);
  fonte = createFont("1.ttf", 20);
  textFont(fonte);

  ////////// CRIAÇÃO //////////

  introo = loadImage("intro.png");
  for (int i = 0; i < 11; i++) {
    imgs[i] = loadImage(i+".png");
    t[i] = new Texto(imgs[i]);
  }
  for (int i = 0; i < 11; i++) {
    imga[i] = loadImage(i+""+i+".png");
    t[i] = new Texto(imgs[i]);
  }
  for (int i = 0; i < 40; i++) {
    rectu[i] = new RectUm();
  }
  for (int i = 0; i < 40; i++) {
    rectd[i] = new RectDois();
  }
}


void draw() {
  fft.forward(musica.mix);
  background(10);
  if (!intro) {
    contador = 0;


    ////////// DESENHA AS LETRAS //////////
    for (int i = 0; i < 11; i++) {
      t[i].desenha();
    }

    ////////// DESENHA OS RETANGULOS //////////
    if (int(random(1, 30))== 2)
      rectu[int(random(1, 40))].desenha();

    if (int(random(1, 30))== 2)
      rectd[int(random(1, 40))].desenha();

    ////////// DESFOCA A IMAGEM //////////
    if (musica.mix.level()>0)
      filter(BLUR, map(musica.mix.level(), 0, 0.08, 0, 2));


    ////////// FAZ AS LETRAS TREMER //////////
    if (mouseX > 105 && mouseY < 116 && mouseX < 138 && mouseY > 76) {
      t[0].randomizer(-6, 6);
      if (!check) {
        if (!t[0].getT())
          filter(INVERT);
        t[0].setT(true);
      }
    } else t[0].def();

    if (mouseX > 138 && mouseY < 118 && mouseX < 207 && mouseY > 90) {
      t[1].randomizer(-6, 6);
      if (!check) {
        if (!t[1].getT())
          filter(INVERT);
        t[1].setT(true);
      }
    } else t[1].def();

    if (mouseX > 207 && mouseY < 115 && mouseX < 271 && mouseY > 90) {
      t[2].randomizer(-6, 6);
      if (!check) {
        if (!t[2].getT())
          filter(INVERT);
        t[2].setT(true);
      }
    } else t[2].def();

    if (mouseX > 271 && mouseY < 117 && mouseX < 339 && mouseY > 90) {
      t[3].randomizer(-6, 6);
      if (!check) {
        if (!t[3].getT())
          filter(INVERT);
        t[3].setT(true);
      }
    } else t[3].def();

    if (mouseX > 339 && mouseY < 117 && mouseX < 374 && mouseY > 76) {
      t[4].randomizer(-6, 6);
      if (!check) {
        if (!t[4].getT())
          filter(INVERT);
        t[4].setT(true);
      }
    } else t[4].def();

    if (mouseX > 374 && mouseY < 117 && mouseX < 430 && mouseY > 91) {
      t[5].randomizer(-6, 6);
      if (!check) {
        if (!t[5].getT())
          filter(INVERT);
        t[5].setT(true);
      }
    } else t[5].def();

    if (mouseX > 430 && mouseY < 117 && mouseX < 469 && mouseY > 85) {
      t[6].randomizer(-6, 6);
      if (!check) {
        if (!t[6].getT())
          filter(INVERT);
        t[6].setT(true);
      }
    } else t[6].def();

    if (mouseX > 469 && mouseY < 118 && mouseX < 524 && mouseY > 90) {
      t[7].randomizer(-6, 6);
      if (!check) {
        if (!t[7].getT())
          filter(INVERT);
        t[7].setT(true);
      }
    } else t[7].def();

    if (mouseX > 524 && mouseY < 129 && mouseX < 576 && mouseY > 92) {
      t[8].randomizer(-6, 6);
      if (!check) {
        if (!t[8].getT())
          filter(INVERT);
        t[8].setT(true);
      }
    } else t[8].def();

    if (mouseX > 576 && mouseY < 117 && mouseX < 634 && mouseY > 79) {
      t[9].randomizer(-6, 6);
      if (!check) {
        if (!t[9].getT())
          filter(INVERT);
        t[9].setT(true);
      }
    } else t[9].def();

    if (mouseX > 634 && mouseY < 117 && mouseX < 691 && mouseY > 90) {
      t[10].randomizer(-6, 6);
      if (!check) {
        if (!t[10].getT())
          filter(INVERT);
        t[10].setT(true);
      }
    } else t[10].def();

    ////////// VERIFICA SE A PALAVRA ESTÁ COMPLETA //////////
    for (int i = 0; i < 11; i++) {
      if (t[i].getF())
        contador++;
    }
    if (contador == 11)
      check = true; 

    ////////// DESENHA AS LETRAS SOLTAS EXPORADICAMENTE //////////
    if (int(random(1, 10)) == 2) {
      int p = (int)random(0, 10);
      if (t[p].getF())
        t[p].desenha1();
    }

    ////////// FLASH SCREEN //////////
    if (int(random(1, 80))== 2)
      filter(INVERT);

    if (check)
      t[k].randomizer(-4, 4);
    t[l].randomizer(-2, 2);
    if (frameCount%50==0)
      k = (int)random(0, 11);
    l = (int)random(0, 11); 

    ////////// OPÇÃO ESTÉTICA //////////
    filter(INVERT);

    ////////// VERIFICAÇÃO PARA ALTERAR A LETRA PELO INVERSO //////////
    if (!save) {
      if (int(random(1, 20))== 2) {
        j = (int)random(1, 11);
        if (j!=0 && j!=2 && j!=10) {
          savepos = frameCount;
          t[j].switchimg(imga[j]);
          save = true;
        }
      }
    }
    if (frameCount-savepos > 20) {
      t[j].switchimg(imgs[j]);
      save = false;
      savepos = 0;
    }

    ////////// VERIFICA SE A PALAVRA ESTÁ COMPLETA //////////
    if (in.left.get(200)*50>5 || in.right.get(200)*50>5) {
      int n = (int)random(0, 11);
      if (t[n].getA()>5) {
        t[n].setT(false);
        t[n].setF(false);
        filter(INVERT);
        println(n);
      }
    }
    fill(255, cena);
    if (finale)
      cena+=3;
    rect(0, 0, width, height);
  } else {
    fill(255);
    text("Clique para iniciar e terminar a experiência", width/2, height/2-15);
    text("Arraste o rato para interagir.", width/2, height/2+15);
    //image(introo, width/2,height/2);


    ////////// FLASH SCREEN //////////
    if (int(random(1, 80))== 2)
      filter(INVERT);

    ////////// DESENHA OS RETANGULOS //////////
    if (int(random(1, 30))== 2)
      rectu[int(random(1, 40))].desenha();

    if (int(random(1, 30))== 2)
      rectd[int(random(1, 40))].desenha();

    ////////// DESFOCA A IMAGEM //////////
    if (musica.mix.level()>0)
      filter(BLUR, map(musica.mix.level(), 0, 0.08, 0, 1.5));
    filter(INVERT);
  }
}

void mousePressed() {
  if (rato == 1) {
    inhale.play();
    finale = true;
    musica.setGain(-60);
    rato = 2;
  } 
  if (rato == 0) {
    intro = false;
    rato = 1;
  }
}
