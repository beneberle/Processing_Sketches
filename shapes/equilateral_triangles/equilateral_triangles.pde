
int canvas_size = 800;

void setup() {

  size(800, 800);
  smooth(1);
  stroke(13);
  strokeWeight(6);
  background(255);
  fill(255,0);
  noLoop();
}

void draw() {

  eqilateral_triangles();
  save("eqilateral_triangles.jpg");

}

void eqilateral_triangles() { 

  int angle = 60;
  float offset = .95;
  
  float side_length = width * .7;
  float triangle_height = sin(radians(angle)) * side_length;

  float x1 = (width - side_length) / 2;
  float x2 = cos(radians(angle)) * side_length + x1;
  float x3 = x1 + side_length;
  
  float y1 = (height - triangle_height) / 2;
  float y3 = triangle_height + y1;
  float y2 = ((y3 - y1) / 2) + y1;
  
  triangle(x1, y1 + offset, x2, y3 + offset, x3, y1 + offset);
  triangle(x2, y1 - offset, x3, y3 - offset, x1, y3 - offset);
}
