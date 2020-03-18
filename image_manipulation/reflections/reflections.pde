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
  float resize = (float) (width / 2) / (float)img.width;  

  if(is_portrait) {
    resize = (float)(height / 2) / (float)img.height;
  }
  println(resize);
  float new_width = (float)img.width * resize;
  float new_height = (float)img.height * resize;
  
  int row_height = 0;
  int row_index = 0;
  int row_width = 0;
  int col_index = 0;

  while(row_height < height && row_width < width) {
    if (row_index % 2 == 0) { 
      // odd
      pushMatrix();
      translate(0, row_height);
      scale(1,1);
      popMatrix();
      image(img, 0, row_height, (int)new_width, (int)new_height);
    } else { 
      // even
      pushMatrix();
      translate((int)new_width, row_height);
      scale(1,-1);
      image(img,0, -row_height,-(int)new_width, row_height);
      popMatrix();
    }
    
    if(col_index % 2 == 0) {
      // odd
      pushMatrix();
      translate((int)new_width, row_height);
      scale(-1,1);
      image(img,-(int)new_width,-row_height, (int) new_width, (int) new_height);
      println("odd col");
      popMatrix();
    } else {
      // even
      println("even col");
      pushMatrix();
      translate((int)new_width, row_height);
      scale(-1,-1);
      image(img, -(int)new_width, -row_height, (int) new_width, (int) new_height);
      popMatrix();
    }
    
    row_height = row_height + (int) new_height;
    row_index++;
    
    
    row_width = row_width + (int) new_width;
    col_index++;
    
  }
  
  /*
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
  */
}

void keyPressed() {
  if (key == 'z') {
    current_img++;
    image_to_load = images_to_load[current_img];
  }
  current_img = constrain(current_img, 0, 2);
  redraw();
}
