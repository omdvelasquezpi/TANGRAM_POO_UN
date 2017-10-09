class Parallel extends Shape {
  protected float edge;
  protected boolean o;

  public Parallel() {
    setEdge(50);
  }

  @Override
  protected void drawShape() {
    if(ori){
      beginShape(QUADS);
      vertex(-edge/2,0);
      vertex(-edge/2,edge);
      vertex(edge/2,0);
      vertex(edge/2,-edge); 
      endShape();
    }else{
      beginShape(QUADS);
      vertex(-edge/2,-edge);
      vertex(-edge/2,0);
      vertex(edge/2,edge);
      vertex(edge/2,0);      
      endShape();
    } 
  }
  public float edge() {
    return edge;
  }
  
  public void setEdge(float e) {
    edge = e;
  }
}