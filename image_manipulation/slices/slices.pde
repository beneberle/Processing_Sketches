PImage img;  // Declare a variable of type PImage
int slices = 10;
String image_to_load = "beach2.jpg";
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
  
  if(is_portrait) {
   resize = (float)height / (float)img.height;
  }


  resize = resize * .5;
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
  
  vertical_strips();
}

void vertical_strips() {
  
 loadPixels();

  println(slices);
  // Two loops allow us to visit every column (x) and every row (y).
 int strip_divides  = width / slices;
 
  println(strip_divides);
  // Loop through every pixel column
  color color_first_row = color(255);
  for (int x = 0; x < width; x++ ) {
    // Loop through every pixel row
    color_first_row = pixels[x];
      
    
    for (int y = 0; y < height; y++ ) {

      // Use the formula to find the 1D location
      // slices determine where to draw lines?
      
      int loc = x + y * width; 
      
      if (x % strip_divides == 0) { 
        
        // the more slices
        // the thinner the strip_width?
        
        // slices      = 10
        // strip_width = (100 / slices) = 10

        // slices       = 20
        // strip_width  = (100 / slices) = 5
        for(int ii = 0; ii < (100 / slices); ii++ ) {
          int px = loc + ii;
          if(px < pixels.length) {
            pixels[loc + ii] = color_first_row;  
          }             
        }
      }
    }
  }
  updatePixels(); 
}

void keyPressed() {
  if (key == 'z') {
    slices--;
  }
  if (key == 'x') {
    slices++;
  }
  slices = constrain(slices, 0, 90);
  redraw();
}
