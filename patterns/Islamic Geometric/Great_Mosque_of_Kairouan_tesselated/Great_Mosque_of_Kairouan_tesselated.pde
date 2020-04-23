
int number_of_tiles = 3;

void setup() {

  size(1100, 800);
  smooth(10);
  noLoop();   
}

void draw() {

  fill(255, 0);
  background(255);
  draw_tiles(); 
  save("great_mosque_of_kairouan_tessellated.jpg");
}

void draw_tiles() { 

  stroke(230);
  strokeWeight(.6);
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
    float xx = radius * sin(angle * i) + (tile_size / 2) + x;
    float yy = radius * cos(angle * i) + (tile_size / 2) + y;
    Plots[i][0] = xx; 
    Plots[i][1] = yy;
  }

  for (int i = 0; i < numPoints; i++) { 
    float xx = Plots[i][0];
    float yy = Plots[i][1];
    if (numPoints > i + 1) {
      NextPlot = Plots[i + 1];
    } else {
      NextPlot = Plots[0];      
    }

    if(i % 2 != 0) {
      // odd column
      if (numPoints > i + 2) {
        NextPlot = Plots[i + 2];
      } else {
        NextPlot = Plots[1];   
      }
      line(NextPlot[0], NextPlot[1], xx, yy);
    }
    
    // add vertical inner lines
    
    // then try matrix pushing/popping?
    
    float inner_width = radius * .25;
    line(center_x - inner_width, y,center_x - inner_width, far_y);
    line(center_x + inner_width, y,center_x + inner_width, far_y);
    line(x, center_y  - inner_width, far_x, center_y - inner_width);
    line(x, center_y  + inner_width, far_x, center_y + inner_width);
//    line(center_x + inner_width, y,center_x + inner_width, far_y);
  }
  // draw sqaures
    line(center_x, y, x, center_y); 
    line(center_x, y, far_x, center_y);
    line(far_x, center_y, center_x, far_y); 
    line(x, center_y, center_x, far_y); 
 
  // draw second set of dividing 
  // lines crossing thru center
  
  float a_angle = 22.5; 
  float n_length = radius * tan(radians(a_angle));

  line(x, center_y + n_length, far_x, center_y - n_length);
  line(x, center_y - n_length, far_x, center_y + n_length);

  line(center_x - n_length, y, center_x + n_length, far_y);
  line(center_x + n_length, y, center_x - n_length, far_y);

  // draw skewed perimeter lines from circle apex points

  line(far_x, center_y, far_x - n_length, y);
  line(far_x, center_y, far_x - n_length, far_y);

  line(center_x, y, x, y + n_length);
  line(center_x, y, far_x, y + n_length);
  
  line(x, center_y, x + n_length, far_y);
  line(x, center_y, x + n_length, y);

  line(center_x, far_y, x, far_y - n_length);
  line(center_x, far_y, far_x, far_y - n_length); 
}

void keyPressed() {
    if (key == '.') {
    number_of_tiles++;
  }
  if (key == ',') {
    if(number_of_tiles < 2 ) {
      number_of_tiles = 1;      
    } else {
      number_of_tiles--;
    }
  }
  redraw();
}
