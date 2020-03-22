
PImage img;
String[] images_to_load = { "beach.jpg", "beach2.jpg","west.jpg","mountains.jpg" };
int      current_img    = 0;
String   image_to_load  = images_to_load[current_img];
int      tiles          = 3;

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

  int padding = 100;
  
  boolean is_portrait = img.width < img.height ? true : false;
  float resize = (float) ((width - padding) / tiles) / (float)img.width;  

  if(is_portrait) {
    resize = (float)((height - padding) / tiles) / (float)img.height;
  }
  
  int new_width = int((float)img.width * resize);
  int new_height = int((float)img.height * resize);
  int x_pos = (width - (new_width * tiles)) / 2; 
  int y_pos = (height - (new_height *  tiles)) / 2; 
  if(is_portrait) {
    x_pos = (width - (new_width * tiles)) / 2;
 // y_pos = (height - (new_height) / tiles;  
  } 

  for(int x = 0; x < tiles; x++) {
    println("loop x: "+ x); 
    for(int y = 0; y < tiles; y++) {
      println("loop y: "+ y); 
      if(x % 2 == 0) {
        if(y % 2 == 0) {
          // straight
          image(img, x_pos, y_pos, new_width, new_height);
        } else {
          // flipped vertically and below
          pushMatrix();
          translate(x_pos,y_pos);
          scale(1,-1);
          image(img, -(new_width * x), -new_height, new_width, new_height);
          popMatrix();
        }
      } else {
        if(y % 2 == 0) {
          // flipped horizontally and to the right
          pushMatrix();
          translate(x_pos,y_pos);
          scale(-1,1);
          image(img, -(new_width * x), -(new_height * y), new_width, new_height);
          popMatrix();
        } else {
          // flipped vertically and horizontally below
          pushMatrix();
          translate(x_pos,y_pos);
          scale(-1,-1);
          image(img, -new_width, -(new_height), new_width, new_height);
          popMatrix();
        } 
      }
      y_pos = y_pos + new_height;        
    }
    x_pos = x_pos + new_width;  
    y_pos = (height - (new_height * tiles)) / 2;
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
  if (key == '.') {
    tiles++;
  }
  if(key == ',') {
    tiles--;
  }
  tiles = constrain(tiles, 1, 30);
  redraw();
}
