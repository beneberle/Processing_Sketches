PImage img;
PImage beach_img_two;
int current_img = 0;
int grid = 15;

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
  img = loadImage(filenames[current_img]);
  beach_img_two = loadImage(filenames[1]);
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
//image(img, x_pos, y_pos, new_width, new_height);

  // Pick a random point
  int grid_width = new_width / grid;
  println("grid_width = " + grid_width);
    
  loadPixels(); 
  // Since we are going to access the image's pixels too  
  img.loadPixels(); 
  
  for (int xx = 0; xx < width; xx++) {
    int row_count  = 0;
    int grid_count = 0;
    for (int yy = 0; yy < height; yy++ ) {

      // Get the R,G,B values from image
      int image_loc   = xx + yy * width;
      int reverse_loc = xx + yy * width;
      
      float r = red   (img.pixels[image_loc]);
      float g = green (img.pixels[image_loc]);
      float b = blue  (img.pixels[image_loc]);
      
      if(row_count % 2 != 0) {
        // odd column
         
         reverse_loc = xx + yy * width;
         if(reverse_loc - grid > 0) {
           reverse_loc = reverse_loc - grid;
         }
         r = red   (img.pixels[reverse_loc]);
         g = green (img.pixels[reverse_loc]);
         b = blue  (img.pixels[reverse_loc]);
      }
      pixels[image_loc] = color(r,g,b);
      grid_count++;
      if(grid_count == grid_width) {
        row_count++;
        grid_count = 0;
      }
    }
  }

  updatePixels();
//save("weave_images.jpg");
}

void keyPressed() {
  
  if (key == '.') {
    grid++;
  }
  if (key == ',') {
    grid--;
  }
  
  grid = constrain(grid, 1, 30);
  redraw();
}
