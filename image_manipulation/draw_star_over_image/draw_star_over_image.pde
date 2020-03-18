PImage img;  // Declare a variable of type PImage

String[] images_to_load = { "mountains.jpg", "beach.jpg", "west.jpg" };
int current_img = 0;
String image_to_load = images_to_load[current_img];
void setup() {

  smooth(10);
  stroke(30);
  strokeWeight(18);
  background(255);
  fill(255,0);
  noLoop();
  
  // resize image
  // to the dimensions
  
// println(img.width);
// println(img.height);
  size(800, 800);
}

void draw() {
    
  // resize image in square
  // so that max dimension
  // is shrunk to fit window
  
  img = loadImage(image_to_load);
  
  boolean is_portrait = img.width < img.height ? true : false;
  float resize = (float)width / (float)img.width;
  
  println(img.width);
  println(img.height);
  
  if(is_portrait) {
   resize = (float)height / (float)img.height;
  }
  println(resize);
  float new_width = img.width * resize;
  float new_height = img.height * resize;
  image(img,0,0, new_width, new_height);

  
  pushMatrix();
  translate(new_width - 1,0);
  scale(-1,1);
  image(img,-new_width,0,new_width,new_height);
  popMatrix();
  
  pushMatrix();
  translate(new_width,new_height);
  scale(1,-1);
  image(img,0, -new_height,-new_width,new_height);
  popMatrix();
  
  pushMatrix();
  translate(new_width,new_height);
  scale(-1,-1);
  image(img,-new_width,-new_height,new_width,new_height);
  popMatrix();
  
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
  
//  triangle(x1, y1 + offset, x2, y3 + offset, x3, y1 + offset);
//  triangle(x2, y1 - offset, x3, y3 - offset, x1, y3 - offset);
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
  
// triangle(x1 + offset, y1, x3 + offset, y2, x1 + offset, y3);
// triangle(x3 - offset, y1, x3 - offset, y3, x1 - offset, y2);
  stroke(255);
  strokeWeight(14);
  triangle(x1 + offset, y1, x3 + offset, y2, x1 + offset, y3);
  triangle(x3 - offset, y1, x3 - offset, y3, x1 - offset, y2);
}

void keyPressed() {
  if (key == 'z') {
    current_img++;
    image_to_load = images_to_load[current_img];
  }
  current_img = constrain(current_img, 0, 2);
  redraw();
}
