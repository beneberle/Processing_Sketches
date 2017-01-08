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
  eqilateral_triangle(400);
}

void eqilateral_triangle(int side_length){ 
  int angle = 60;
  float x3 = cos(radians(angle)) * side_length;
  float y3 = sin(radians(angle)) * side_length;
  triangle(0, 0, side_length, 0, x3, y3);
}