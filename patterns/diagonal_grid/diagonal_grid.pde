float[][] line_x_plots;
float[][] line_y_plots;

void setup() {

  size(800, 800);
  background(255);
  smooth(20);
  strokeWeight(.65);
  stroke(120);
  noFill();
  noLoop();

}

void draw() {
  
    int padding = 80;
    int lines_per_row = 10;
    
    draw_grid(lines_per_row, padding);
    
//  save("diagonal_grid_"+lines_per_row+"_"+width+"_"+height+".jpg");

}

void draw_grid(int cols, int padding) {
    
  float size = width / cols;
  line_x_plots = new float[cols][cols];
  line_y_plots = new float[cols][cols];

  for (int i = 0; i < cols; i++) {
    for (int ii = 0; ii < cols; ii++) {
//      float y = (size * i) - height;
//      line_y_plots[i][ii] = y + random(-20,20);
    }
  }
  
  for(int row_count = 0; row_count < cols; row_count++) {

    // top-left to bottom right diagonal lines
    float y = (size * row_count) - (height / 2) + (size / 2);
    line(0, y, width, height + (y) + random(-10,10));
    
    // top-right to bottom left diagonal lines
    line(width, y, 0, height + (y) + random(-10,10));

    for(int col_count = 0; col_count < cols - 1; col_count++) {
               
    } 
  }
}
