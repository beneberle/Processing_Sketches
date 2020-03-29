PImage img;
int current_img = 0;
int total_image_count = 1;
   
void setup() {
  
  smooth(10);
  stroke(30);
  strokeWeight(18);
  fill(255,0);
  noLoop();
  size(800, 800);
}
 
void draw() { 
  background(255);
  // list the files in the data folder
  java.io.File folder = new java.io.File(dataPath(""));

  String[] filenames = folder.list();
  String image_to_load  = filenames[current_img];

  total_image_count = filenames.length;

  for (int i = 0; i < filenames.length; i++) {
    println(filenames[i]);
  }
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

  image(img, x_pos, y_pos, new_width, new_height);

}

void keyPressed() {
  
  if (key == 'z') {
    current_img++;
    if(current_img > total_image_count - 1) {
      current_img = 0;
    }
  }
  redraw();
}
