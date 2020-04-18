
int number_of_tiles = 3;

void setup() {

  size(600, 600);
  smooth(10);
  noLoop();   
}

void draw() {

  fill(45, 0);
  draw_tiles(); 
}

void draw_tiles() { 

  stroke(130);
  strokeWeight(.8);
  float tile_size = width / number_of_tiles;
  for(int d = 0; d < number_of_tiles; d++) {
    float x = tile_size * d;
    for(int ii = 0; ii < number_of_tiles; ii++) {
        float y = tile_size * ii;
        draw_tile(x, y, tile_size);
    }
  }
}

void draw_tile(float x, float y, float tile_size) {
  
   // draw all construction lines,
  
  // just for fun
  
  // draw grid lines lines
  int radius =  int(tile_size / 2);
  rectMode(RADIUS); 
  float center_x = radius + x;
  float center_y = radius + y;
  float far_x    = x + tile_size;
  float far_y    = y + tile_size;
  rect(center_x, center_y, radius, radius);
  circle(center_x, center_y, tile_size);

  // draw central grid
  line(center_x, y, center_x, far_y); 
  line(x, center_y, far_x, center_y); 
    
  // draw diagonals
  line(x, y, far_x, far_y);
  line(far_x, y, x, far_y);
  
  // get all points along circle
  int numPoints = 8; 

  // calculate the angle each point is on
  float angle = TWO_PI / (float) numPoints; 

  // declare point plots array
  float[][] Plots;
  float[] NextPlot;

  // Setup the array
  Plots = new float [numPoints][2]; 
  for (int i = 0; i < numPoints; i++) { 
    float xx = radius * sin(angle * i) + tile_size / 2;
    float yy = radius * cos(angle * i) + tile_size / 2;
    Plots[i][0] = xx; 
    Plots[i][1] = yy;
  }

  for (int s = 0; s < numPoints; s++) { 
    float xx = Plots[s][0];
    float yy = Plots[s][1];
    if (numPoints > s + 1) {
      NextPlot = Plots[s + 1];
    } else {
      NextPlot = Plots[0];      
    }

    if(s % 2 != 0) {
      // odd column
      if (numPoints > s + 2) {
        NextPlot = Plots[s + 2];
      } else {
        NextPlot = Plots[1];   
      }
      line(NextPlot[0], NextPlot[1], xx, yy);
    }
  }
  
  /*
  line(center, y, x, center); 
  line(center, y, far_x, center); 
  line(x, center, center, far_y); 
  line(far_x, center, center, far_y); 
 
  // draw second set of dividing 
  // lines crossing thru center
  
  float a_angle = 22.5; 
  float n_length = radius * tan(radians(a_angle));

  line(x, center + n_length, far_x, center - n_length);
  line(x, center - n_length, far_x, center + n_length);
  
  line(center - n_length, y, center + n_length, far_y);
  line(center + n_length, y, center - n_length, far_y);
  
  // draw skewed perimeter lines from circle apex points
  
  line(far_x, center, far_x - n_length, y);
  line(far_x, center, far_x - n_length, far_y);
  
  line(center, y, x, y + n_length);
  line(center, y, far_x, y + n_length);
  
  line(x, center, x + n_length, far_y);
  line(x, center, x + n_length, y);
 
  line(center, far_y, x, far_y - n_length);
  line(center, far_y, far_x, far_y - n_length); 
  */
}
