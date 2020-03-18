float[][] xs;
float[][] ys;

void setup() {

  size(800, 800);
  background(255);
  smooth(8);
  strokeWeight(1);
  stroke(220);
  noFill();
  noLoop();

}

void draw() {
  
    int padding = 80;
    int squares_per_row = 20;
    
    draw_grid(squares_per_row, padding);
    
    save("grid_"+squares_per_row+"_"+width+"_"+height+".jpg");

}

void draw_grid(int squares_per_row, int padding) {
    
    int[] pal = {#ffffff, #ffffff, #fafafa, #f7f7f7, #fbfbfb, #fefefe};
    int i = 1;
    
    float size = (width - (padding * 2)) / squares_per_row;
    int cols = squares_per_row + 1;
    int rows = cols;
    println("there will be "+squares_per_row+" rows");
    if(width > height) {
      println("reduce number of rows");
      rows = floor((height - (padding *2))/ size) + 1;
      println("there will be "+rows+" plotted rows");      
    } 
    
    xs = new float[rows][cols];
    ys = new float[rows][cols];
  
    for (i = 0; i < rows; i++) {
        for (int ii = 0; ii < cols; ii++) {
            float x = (ii * size) + padding;
            float y = (i * size) + padding;
            xs[i][ii] = x + random(-1,1);
            ys[i][ii] = y + random(-1,1);
        }
    }
    
    for(int iii = 0; iii < rows - 1; iii++) {
        for(int col_count = 0; col_count < cols - 1; col_count++){

          // no need to print last row
            fill(pal[round(random(0,5))]);
            quad(xs[iii][col_count], ys[iii][col_count], xs[iii][col_count+1], ys[iii][col_count+1],
              xs[iii+1][col_count+1], ys[iii+1][col_count+1], xs[iii+1][col_count], ys[iii+1][col_count]
            );
        } 
    }
}