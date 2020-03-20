
PImage img;
String[] images_to_load = { "mountains.jpg", "beach.jpg", "west.jpg" };
int      current_img    = 0;
String   image_to_load  = images_to_load[current_img];
int      tiles          = 2;

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
  background(255);
  img = loadImage(image_to_load);
  int composition_width = width - 100;
  int composition_height = height - 100;
  boolean is_portrait = img.width < img.height ? true : false;
  float resize = (float) (composition_width / tiles) / (float)img.width;  

  if(is_portrait) {
    resize = (float)(composition_height / tiles) / (float)img.height;
  }
  
  float new_width = (float)img.width * resize;
  float new_height = (float)img.height * resize;
  
  int row_height = 0;
  int row_width = 0;
  int col_index = 0;
  int x_start = (width - composition_width) / 2;
  int y_start = (height - composition_height) / 2;
  
  for(int x = x_start; x < composition_width + x_start; x++) {
    // loop thru first row
    if (x == x_start) { 
      // first
//    pushMatrix();
//    translate(0, row_height);
//    scale(1,1);
//    popMatrix();
      println("first row!");
      for(int y = y_start; y < composition_height + y_start; y++) {
        // loop through each column  
        if (y == y_start) { 
          // first
          println("first row-col! x:"+x+" y:"+y);
          image(img, x, y, (int)new_width, (int)new_height);
        } else if(y % ((composition_height + y_start) / 2) == 0){
          println("second row?");
          // first
          pushMatrix();
          translate(0, y);
          println("translate x:"+x+"| y:"+y);
          scale(1,-1);
          image(img, x, -y + (int)new_height, (int)new_width, (int)new_height);
          popMatrix();
        }
      }
    } else if (x == (composition_width + x_start) / 2){ 
      // middle?
      for(int yy = y_start; yy < composition_height + y_start; yy++) {
        // loop through each reversed column  
        if (yy == y_start) { 
          // first
          pushMatrix();
          translate(x, 0);
          println("translate x:"+x+"| yy:"+yy);
          scale(-1,1);
          image(img, -x, yy, (int)new_width, (int)new_height);
          popMatrix();
          println("second row-col!");

        } else {
          
        }
      }
    }
    
    /*
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
    */
    
    row_height = row_height + (int) new_height;
    row_width = row_width + (int) new_width;
    col_index++;
    
  }
}

void keyPressed() {
  
  if (key == 'z') {
    current_img++;
    if(current_img > images_to_load.length - 1) {
      current_img = 0;
    }
    image_to_load = images_to_load[current_img];
  }
  if (key == '>') {
    tiles++;
  }
  if(key == '<') {
    tiles--;
  }
  tiles = constrain(tiles, 1, 30);
  redraw();
}
