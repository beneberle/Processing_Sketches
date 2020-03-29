
PImage img;
String[] images_to_load = { "beach.jpg", "beach2.jpg","west.jpg","mountains.jpg" };
int current_img    = 0;
int total_image_count = 1;
String image_to_load  = images_to_load[current_img];
int tiles          = 3;

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
  java.io.File folder = new java.io.File(dataPath(""));
  String[] filenames = folder.list();
  total_image_count = filenames.length;
  String image_to_load = filenames[current_img];
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
  
  for(int x = 0; x < tiles; x++) {
    for(int y = 0; y < tiles; y++) {
      if(x % 2 == 0) {
        
        // even column
        if(y % 2 == 0) {
          
          // even row          
          image(img, x_pos, y_pos, new_width, new_height);

        } else {

          // odd row
          // move down and reflect along x axis
          
          pushMatrix();
          translate(x_pos, y_pos);
          scale(1,-1);
          image(img, 0, -new_height, new_width, new_height);
          popMatrix();
        }
      } else {
        
        // odd column
        if(y % 2 == 0) {
        
          // even row
          // move right and reflect along y axis
                    
          pushMatrix();
          translate(x_pos, y_pos);
          scale(-1,1);
          image(img, -new_width, 0, new_width, new_height);
          popMatrix();
        } else {
          // odd row
          // move down and right and 
          // reflect horizontally and vertically
          
          pushMatrix();
          translate(x_pos, y_pos);
          scale(-1,-1);
          image(img, -new_width, -new_height, new_width, new_height);
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
    if(current_img > total_image_count - 1) {
      current_img = 0;
    }
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
