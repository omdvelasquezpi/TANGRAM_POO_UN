class Triangle extends Shape {

  protected float edge;
  
  public Triangle() {
    setEdge(50);
  }
  
  @Override
  protected void drawShape() {
    beginShape(TRIANGLES);
    vertex((sqrt(2)/2)*edge,-sqrt(2)*edge);
    vertex(-(sqrt(2)/2)*edge,0);
    vertex((sqrt(2)/2)*edge,sqrt(2)*edge);
    endShape();
  }
  
  public float edge() {
    return edge;
  }

  public void setEdge(float e) {
    edge = e;
  }
}