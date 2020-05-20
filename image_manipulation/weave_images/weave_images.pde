PImage img;
int current_img = 0;
int total_image_count = 1;
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
  float resize = (float)(width - padding) / (float)img.width;  

  if(is_portrait) {
    resize = (float)(height - padding) / (float)img.height;
  }
  
  int new_width = int((float)img.width * resize);
  int new_height = int((float)img.height * resize);
  int x_pos = (width - new_width) / 2; 
  int y_pos = (height - new_height) / 2; 
  println("new_width = " + new_width);
//  image(img, x_pos, y_pos, new_width, new_height);

  // Pick a random point
  
  int grid_width = new_width / grid;
  println("grid_width = " + grid_width);
    
  loadPixels(); 
  // Since we are going to access the image's pixels too  
  img.loadPixels(); 
  for (int xx = 0; xx < width; xx++) {
    for (int yy = 0; yy < height; yy++ ) {

      // Calculate the 1D pixel location
      
      // Get the R,G,B values from image

      /*
      we have the pixel location of the 
      display area of the square 
      
      what  we need is the translated pixel 
      location of the image
      */
      
      int disp_loc = xx + yy * width;
//    int image_loc = int(map(disp_loc, 0, (width * height), 0, img.width * img.height));
      int image_loc = xx + yy * width;
      float r = red   (img.pixels[image_loc]);
      float g = green (img.pixels[image_loc]);
      float b = blue  (img.pixels[image_loc]);
      
      // Make a new color and set 
      // pixel in the window
      color c = color(r,g,b);
      if((yy / grid_width) {
        c = color(255,255,255);
      }
      pixels[disp_loc] = c;
    }
  }
  updatePixels();
}

void keyPressed() {
  
  if (key == '.') {
    grid++;
  }
  if (key == ',') {
    grid--;
  }
  redraw();
}
