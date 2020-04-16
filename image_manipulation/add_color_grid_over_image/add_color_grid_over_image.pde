PImage img;
int current_img = 0;
int total_image_count = 1;
int pointillize = 40;
int grid = 10;

void setup() {

  size(800, 800);
  smooth(10);
  stroke(255, 100);
  strokeWeight(1.25);
  fill(255,0);
  noLoop();

}
 
void draw() {

  background(255);
  // list the files in the data folder
  java.io.File folder = new java.io.File(dataPath(""));

  String[] filenames = folder.list();
  String image_to_load  = filenames[current_img];
  total_image_count = filenames.length;
  img = loadImage(image_to_load);
  int padding = 100;
  boolean is_portrait = img.width < img.height ? true : false;
  float resize = (float) (width - padding) / (float)img.width;  

  if(is_portrait) {
    resize = (float)(height - padding) / (float)img.height;
  }
  
  int new_width = int((float)img.width * resize);
  int new_height = int((float)img.height * resize);
  int x_pos = (width - new_width) / 2; 
  int y_pos = (height - new_height) / 2; 
  println("new_width = " + new_width);
  image(img, x_pos, y_pos, new_width, new_height);

  // Pick a random point
  
  int grid_width = new_width / grid;
  println("grid_width = " + grid_width);

  int grid_height = new_height / grid;
  int y_start = y_pos;
  loadPixels();
//noStroke();
  fill(23, 23, 23, 10);
  for(int x = 0; x < grid; x++) {
    int x_start = x_pos + (grid_width * x);
    for(int y = 1; y <= grid; y++) {
      fill(y*20, y*20, y*20, 0);
      // Look up the RGB color in the source image

//    float r = red(img.pixels[loc]);
//    float g = green(img.pixels[loc]);
//    float b = blue(img.pixels[loc]);    

      // Draw a square
      if(random(0,10) > 3) {
        rect(x_start, y_start, grid_width, grid_height);
      }
//    println("x_start = " +  x_start + " | y_start = " + y_start);
      y_start =  y_pos + (grid_height * y);
    }
    y_start= (height - new_height) / 2; 
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
    grid++;
  }
  if (key == ',') {
    grid--;
  }
  redraw();
}
