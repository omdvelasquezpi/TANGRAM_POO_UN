abstract class Shape {
  protected float rot;
  protected float scl;
  protected PVector trans;
  protected boolean ori;
  protected color col;

  // TODO: estilo
  // implemente el estilo del shape (i.e., stroke weight, color, etc)
  // como se hace con los demás atributos de la clase

  // TODO: modifique o defina los constructores que necesite

  public Shape() {
    this(random(100, width-100), random(100, height-100), 0, 1, true, color(random(0,255),random(0,255),random(0,255)));
  }

  public Shape(float x, float y, float r, float s, boolean o, color c) {
    trans = new PVector(x, y);
    rot = r;
    scl = s;
    ori = o;
    col = c;
  }

  public void draw() {
    pushStyle();
    pushMatrix();
    translate(translation().x, translation().y);
    rotate(rotation());
    scale(scaling(), scaling());
    fill(Color());
    // TODO aplique el estilo aca
    drawShape();
    popMatrix();
    popStyle();
  }

  // TODO: para la seleccion de la pieza escoja uno de los siguientes prototipos
  
  protected abstract void drawShape();

  public float scaling() {
    return scl;
  }

  public void setScaling(float s) {
    scl = s;
  }

  public float rotation() {
    return rot;
  }

  public void setRotation(float r) {
    rot = r;
  }

  public PVector translation() {
    return trans;
  }

  public void setTranslation(float x, float y) {
    trans.x = x;
    trans.y = y;
  }
  
  public color Color(){
    return col;
  }
  
  public void setColor(color c){
    col = c; 
  }
  
  public boolean Orientation(){
    return ori;
  }
  
  public void setOrientation(boolean o){
    ori = o;
  }
}