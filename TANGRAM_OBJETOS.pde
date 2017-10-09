Shape[] shapes;
boolean drawGrid = true;
boolean lock;
color C;
int lev;
PImage fig;
String c = "Cat";
String h = "House";
String d = "Duck";
String f = "Fish";
String m = "Man";
String b = "Bird";
String dg = "Dog";
String hr = "Horse";
String rb = "Rabbit";
String ss = "Spaceship";
String fr = "Freestyle";
String ad = "CREATE YOUR OWN FIGURES";
String tan = "TANGRAM";
String ins = "INSTRUCTIONS:";
String t = "--LEFT CLICK = Shape moving";
String rot = "--RIGHT CLICK = Shape rotation";
String chfig = "--C = Change figure"; 
String paral = "--R or L = Parallelepiped orientation (Mirror)";
String res = "--SPACE = Reset game";


// TODO Implemente
// 1. La manipulacion de las piezas con el mouse y el teclado
// 2. La evaluacion de la solucion
// 3. El modo de creacion de nuevos problemas

void reset(){
  shapes = new Shape[7];
  shapes[0] = new Triangle();
    shapes[0].scl=1;
    shapes[0].trans.x=190;//Triangulo grande 1
    shapes[0].trans.y=420;
    shapes[0].rot=radians(-90);
  shapes[1] = new Triangle();
    shapes[1].scl=1;
    shapes[1].trans.x=140;//Triangulo grande 2
    shapes[1].trans.y=470;
    shapes[1].rot=radians(180);
  shapes[2] = new Triangle();
    shapes[2].scl=0.5;
    shapes[2].trans.x=265;//Triangulo pequeño 1
    shapes[2].trans.y=420;
    shapes[2].rot=0;
  shapes[3] = new Triangle();
    shapes[3].scl=0.5;
    shapes[3].trans.x=190;//Triangulo pequeño 2
    shapes[3].trans.y=495;
    shapes[3].rot=radians(90);
  shapes[4] = new Triangle();
    shapes[4].scl=0.7;
    shapes[4].trans.x=265;//Triangulo mediano
    shapes[4].trans.y=545;
    shapes[4].rot=radians(-135);
  shapes[5] = new Parallel();
    shapes[5].trans.x=165;//Paralelepipedo
    shapes[5].trans.y=545;
    shapes[5].rot=radians(45);
  shapes[6] = new Rect();
    shapes[6].trans.x=240;//Cuadrado
    shapes[6].trans.y=470;
    shapes[6].rot=radians(45);
}

void setup() {
  size(1100,600);
  textSize(20);
  frameRate(100);
  reset();
}

void drawGrid(float scale) {
  pushStyle();
  strokeWeight(1);
  int i;
  for (i=0; i<=width/scale; i++) {
    stroke(0, 0, 0, 20);
    line(i*scale, 0, i*scale, height);
  }
  for (i=0; i<=height/scale; i++) {
    stroke(0, 0, 0, 20);
    line(0, i*scale, width, i*scale);
  }
  popStyle();
}

void draw() {
  background(200);
  
  fill(0);//TITULO
  textSize(30);
  text(tan,515,50);
  
  textSize(28);//INSTRUCCIONES
  fill(0);
  text(ins,860,80);
  textSize(18);
  text(t,850,120,200,180);
  text(rot,850,180,200,240);
  text(chfig,850,240,200,270);
  text(paral,850,270,200,360);
  text(res,850,360,200,450);
  
  fill(250);//Tablero de juego
  rect(340,60,480,510);
  
  fill(224);//Figuras a armar
    if(lev == 0){
      fig = loadImage("CAT.jpg");
      image(fig,66,61,250,250);
      fill(0);
      textSize(20);
      text(c,166,315,224,30);
    }
    if(lev == 1){
      fig = loadImage("HOUSE.jpg");
      image(fig,66,61,250,250);
      fill(0);
      textSize(20);
      text(h,166,315,224,30);
    }
    if(lev == 2){
      fig = loadImage("DUCK.jpg");
      image(fig,66,61,250,250);
      fill(0);
      textSize(20);
      text(d,166,315,224,30);
    }
    if(lev == 3){
      fig = loadImage("FISH.jpg");
      image(fig,66,61,250,250);
      fill(0);
      textSize(20);
      text(f,166,315,224,30);
    }
    if(lev == 4){
      fig = loadImage("RUNNING MAN.jpg");
      image(fig,66,61,250,250);
      fill(0);
      textSize(20);
      text(m,166,315,224,30);
    }
    if(lev == 5){
      fig = loadImage("BIRD.jpg");
      image(fig,66,61,250,250);
      fill(0);
      textSize(20);
      text(b,166,315,224,30);
    }
    if(lev == 6){
      fig = loadImage("DOG.jpg");
      image(fig,66,61,250,250);
      fill(0);
      textSize(20);
      text(dg,166,315,224,30);
    }
    if(lev == 7){
      fig = loadImage("HORSE.jpg");
      image(fig,66,61,250,250);
      fill(0);
      textSize(20);
      text(hr,156,315,224,30);
    }
    if(lev == 8){
      fig = loadImage("RABBIT.jpg");
      image(fig,66,61,250,250);
      fill(0);
      textSize(20);
      text(rb,156,315,224,30);
    }
    if(lev == 9){
      fig = loadImage("SPACESHIP.jpg");
      image(fig,66,61,250,250);
      fill(0);
      textSize(20);
      text(ss,136,315,224,30);
    }
    if(lev == 10){
      fill(0);
      textSize(30);
      text(ad,86,151,224,100);
      textSize(20);
      text(fr,136,315,224,30);
    } 
  if (drawGrid)
    drawGrid(10);
  for (Shape shape : shapes)
    shape.draw();
}

void keyPressed() {
  if (key == 'g' || key == 'G'){
    drawGrid = !drawGrid;
  }
  if (key == 'l' || key == 'L'){
    shapes[5].ori = true;
  }
  if (key == 'r' || key == 'R'){
    shapes[5].ori = false;
  }
  if(key == 'c'|| key == 'C'){
    if(lev == 10){
      lev = 0;
    }else{
      lev++;
    }
  }
  if (key == ' '){
    reset();
  }
}

void mousePressed(){ 
  C = get(mouseX,mouseY);
  for(int i = 0; i<7; i++){
  if(C == shapes[i].col){
      if(mouseButton == LEFT && !lock){
        lock = true;
      }
  }
  if(mouseButton == RIGHT){
  if(C == shapes[i].col){
      shapes[i].rot += radians(45);
    }
  }
  }
}

void mouseDragged(){
  for(int i=0;i<7;i++){
    if(C == shapes[i].col){
      shapes[i].trans.x = mouseX;
      shapes[i].trans.y = mouseY;
    }
  }
}

void mouseReleased(){
  if(mouseButton == LEFT){
    lock = false;
  }
}