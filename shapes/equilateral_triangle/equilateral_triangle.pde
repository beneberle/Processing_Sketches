
int canvas_size = 800;

void setup() {

  size(800, 800);
  smooth(8);
  stroke(8);
  strokeWeight(2);
  background(255);
  fill(255);
  noLoop();
}

void draw() {
  eqilateral_triangle();
}

void eqilateral_triangle(){ 
  int angle = 60;
  float x3 = cos(radians(angle)) * width;
  float y3 = sin(radians(angle)) * width;
  triangle(x3, 0, width, y3, 0, y3);
}
