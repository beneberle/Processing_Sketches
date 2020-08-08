int grid = 15;

void setup() {

  size(800, 800);
  smooth(20);
  stroke(120);
  strokeWeight(.65);
  fill(255,0);
  noLoop();
}
 
void draw() {

  background(255);
  int grid_width = width / grid;
  println("grid_width = " + grid_width);
      
  int row_count  = 0;
  int grid_count = 0;
  for (int yy = 0; yy < height; yy++ ) {

    int image_loc   = 0 + yy * width;
    int reverse_loc = 0 + yy * width;
    
    if(row_count % 2 != 0) {
      
      // odd column
      
    }
    grid_count++;
    
    if(grid_count == grid_width) {
      //
      line(0, yy, width, yy);
      row_count++;
      grid_count = 0;
    }
  }
  save("horizontal_grid.jpg");
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
