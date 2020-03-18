
int canvas_size = 800;

void setup() {

  size(800, 800);
  smooth(10);
  stroke(30);
  strokeWeight(18);
  background(255);
  fill(255,0);
  noLoop();
}

void draw() {
  eqilateral_triangles();
}

void eqilateral_triangles() { 

  int angle = 60;
  float offset = width * .12;
  
  float side_length = width * .8;
  float triangle_height = sin(radians(angle)) * side_length;

  float x1 = (width - side_length) / 2;
  float x2 = cos(radians(angle)) * side_length + x1;
  float x3 = x1 + side_length;
  
  float y1 = (height - triangle_height) / 2;
  float y3 = triangle_height + y1;
  float y2 = ((y3 - y1) / 2) + y1;
  
  triangle(x1, y1 + offset, x2, y3 + offset, x3, y1 + offset);
  triangle(x2, y1 - offset, x3, y3 - offset, x1, y3 - offset);
  stroke(255);
  strokeWeight(14);
  triangle(x1, y1 + offset, x2, y3 + offset, x3, y1 + offset);
  triangle(x2, y1 - offset, x3, y3 - offset, x1, y3 - offset);
  
  stroke(30);
  strokeWeight(18);
  
  x1 = (width - triangle_height) / 2;
  x3 = triangle_height + x1;
  x2 = ((x3 - x1) / 2) + x1;

  y1 = (height - side_length) / 2;
  y2 = cos(radians(angle)) * side_length + y1;
  y3 = side_length + y1;
  
  triangle(x1 + offset, y1, x3 + offset, y2, x1 + offset, y3);
  triangle(x3 - offset, y1, x3 - offset, y3, x1 - offset, y2);
  stroke(255);
  strokeWeight(14);
  triangle(x1 + offset, y1, x3 + offset, y2, x1 + offset, y3);
  triangle(x3 - offset, y1, x3 - offset, y3, x1 - offset, y2);
}
