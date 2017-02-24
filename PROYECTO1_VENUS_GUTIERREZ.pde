PGraphics foo;
PGraphics foo2;
PGraphics foo3;
PGraphics foo4;
PGraphics foo5;
PGraphics bar;
PGraphics bar1;
PGraphics bar2;
PGraphics bar3;
PImage fondo;
PImage fondo1;
PImage fondo2;
PImage Instructions;
PImage Inicio;
PImage mensajefinal;
PImage mensajefinal2;
PFont p1;
PFont p2;
PFont p4;
int x;
int y;
int inicio;
int turno;
String gameState;
String s2;
int pantalla=0;
boolean overBox = false;
boolean locked = false;
int boxSizeX = 140;
int boxSizeY = 50;
int P1 = 0;
int hitS=0;
int hitL=0;
int fin=0;

void setup()
{
  size(800,600);
  foo=createGraphics(800,800);
  fondo = loadImage("fondo.jpg");
  fondo1 = loadImage("imagen intro1.jpg");
  fondo2 = loadImage("imagen intro1.jpg");
  mensajefinal = loadImage("final.jpg");
  mensajefinal2 = loadImage("ganador1.jpg");
  Instructions = loadImage("Instructions.jpg");
  Inicio = loadImage("Inicio.jpg");
  foo2 = createGraphics(800, 800);
  foo3 = createGraphics(800, 800);
  foo4 = createGraphics(800,800);
  foo5 = createGraphics(800,800);
  bar = createGraphics(800,800);
  bar1 = createGraphics(800,800);
  bar2 = createGraphics(800,800);
  bar3 = createGraphics(800,800);
  s2 = "Inicio";

   //Barco cian
  bar1.beginDraw();
  bar1.fill(#48B4C1);
  bar1.quad(80,70,130,70,180,40,30,40);
  bar1.line(105,40,105,0); 
  bar1.triangle(105,0,105,20,130,10);
  bar1.endDraw();
 
  
  //Barco naranja
  bar2.beginDraw();
  bar2.fill(#B8BCBC);
  bar2.fill(#F08929);
  bar2.quad(80,70,130,70,180,40,30,40);
  bar2.line(105,40,105,0);
  bar2.triangle(105,0,105,20,130,10);
  bar2.endDraw();

  
  
  
}

void draw()
{
  
  switch(pantalla){
  
  case 0: //Intro
  image(fondo1, 0, 0);
  PFont p1; 
  p1 = loadFont("Arial-Black-48.vlw");
  textFont(p1);
  fill(255);
  text("BATALLA  NAVAL", 100, 60);
  image(Inicio,630,520);
  image(Instructions,80,200);
  
  
  break;
  
  case 1: //seleccion de barco
  image(fondo2, 0, 0);
  PFont p2;
  p2 = loadFont("Arial-Black-48.vlw");
  textFont(p2);
  fill(255);
  text("Selecciona un barco",60,60);

    image(bar1,140,380);
    image(bar2,140,180);
 
  
  break;
  
  case 2: //Juego
  image(fondo, -2, -120);
  
  PFont p4;
  p4 = loadFont("BrowalliaNew-Bold-25.vlw");
  textFont(p4);
  fill(0);
  text("P1",140,320);
  text("P2",600, 320);
  
  
  foo.beginDraw();
  foo.fill(#48B4C1);
  foo.quad(80,70,130,70,180,40,30,40);
  foo.line(105,40,105,0); 
  foo.triangle(105,0,105,20,130,10);
  foo.endDraw();
  if (P1==0)
  image(foo,40,350);
  else
  image (foo,500,350);
  
  foo2.beginDraw();
  foo2.fill(#F08929);
  foo2.quad(80,70,130,70,180,40,30,40);
  foo2.line(105,40,105,0);
  foo2.triangle(105,0,105,20,130,10);
  foo2.endDraw();
  if (P1==0)
  image(foo2,500,350);
  else
  image (foo2,40,350);
  
  
  foo3.beginDraw();
  foo3.fill(#8EF523);
  foo3.noStroke();
  foo3.rect(20,25,200,25);
  foo3.endDraw();
  image(foo3,550,30);
  image(foo3,20,30);
  
  foo4.beginDraw();
  foo4.fill(#F72343);
  foo4.noStroke();
  foo4.rect(20,25,20*hitL,25);
  foo4.endDraw();
  image(foo4,220-20*hitL,30);
  
  foo5.beginDraw();
  foo5.fill(#F72343);
  foo5.noStroke();
  foo5.rect(20,25,20*hitS,25);
  foo5.endDraw();
  image(foo5,550,30);
  
  if (hitS==10){
  image(mensajefinal,120,100);
  fin=1;
  
}

  if (hitL==10){
  image(mensajefinal2,120,100);
  fin=1;
  
}
  
  break;  
  }
   
}

void mousePressed() {
  
   if ((mouseX > 200  && mouseX < 200+boxSizeX && mouseY > 200 && mouseY < 200+boxSizeY && pantalla == 1)||(mouseX > 200  && mouseX < 200+boxSizeX && mouseY > 400 && mouseY < 400+boxSizeY && pantalla == 1)) {
    pantalla = 2;
    draw();
    if (mouseX > 200  && mouseX < 200+boxSizeX && mouseY > 200 && mouseY < 200+boxSizeY)
    P1 = 1;
    else P1=0; 
}
  if (mouseX > 630  && mouseX < 630+boxSizeX && mouseY > 500 && mouseY < 500+boxSizeY && pantalla == 0) {
    pantalla = 1;
    draw();
  }  
  
}

void keyPressed()
{
  if (pantalla==2 && fin==0){
  if(key == 'S' || key== 's')
  {
  hitS=hitS+1;
  }
  if(key == 'L' || key== 'l')
  {
  hitL=hitL+1;
  }draw();
}
}