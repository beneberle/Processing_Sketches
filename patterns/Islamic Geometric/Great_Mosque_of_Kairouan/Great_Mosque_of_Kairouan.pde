
void setup() {

  size(800, 800);
  smooth(10);
  noLoop();
    
}

void draw() {

  Paper background = new Paper(15);
  
  background.draw();
  fill(45, 0);
  draw_tile();
}

void draw_tile() { 

    stroke(130);
    strokeWeight(.8);
  
  // draw all construction lines,
  
  // just for fun
  
  // draw grid lines lines
  int tile_size = int(width * .85);
  int radius =  tile_size / 2;
  int padding = int((width - tile_size) / 2);
  rectMode(RADIUS); 
  float center = width/2;
  rect(center, center, radius, radius);
  circle(center, center, tile_size);

  // draw central grid
  line(center, 0, center, height); 
  line(0, center, width, center); 
  
  // draw diagonals
  line(0, 0, width, height);
  line(width, 0, 0, height);

  // get all points along circle
  int numPoints = 8; 

  // calculate the angle each point is on
  float angle = TWO_PI/(float)numPoints; 

  // declare point plots array
  float[][] Plots;
  float[] NextPlot;

  // Setup the array
  Plots = new float [numPoints][2]; 
  for (int i = 0; i < numPoints; i++) { 
    float x = radius * sin(angle*i)+width/2;
    float y = radius * cos(angle*i)+height/2;
    Plots[i][0] = x; 
    Plots[i][1] = y;
  }

  for (int i = 0; i < numPoints; i++) { 
    float x = Plots[i][0];
    float y = Plots[i][1];
    if (numPoints > i + 1) {
        NextPlot = Plots[i+1];
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
      line(NextPlot[0], NextPlot[1], x, y);
    }
  }
  
  line(center, padding, padding, center); 
  line(center, padding, tile_size + padding, center); 
  line(padding, center, center, tile_size + padding); 
  line(tile_size + padding, center, center, tile_size + padding); 
 
  // draw second set of dividing 
  // lines crossing thru center
  
  float a_angle = 22.5; 
  float n_length = radius * tan(radians(a_angle));

  line(padding, center + n_length, tile_size + padding, center - n_length);
  line(padding, center - n_length, tile_size + padding, center + n_length);
  
  line(center - n_length, padding, center + n_length, tile_size + padding);
  line(center + n_length, padding, center - n_length, tile_size + padding);
  
  // draw skewed perimeter lines from circle apex points
  
  line(padding + tile_size, center, padding + tile_size - n_length, padding);
  line(padding + tile_size, center, padding + tile_size - n_length, padding + tile_size);
  
  line(center, padding, padding, padding + n_length);
  line(center, padding, padding + tile_size, padding + n_length);
  
  line(padding, center, padding + n_length, padding + tile_size);
  line(padding, center, padding + n_length, padding);
 
  line(center, padding + tile_size, padding, padding + tile_size - n_length);
  line(center, padding + tile_size, padding + tile_size, padding + tile_size - n_length);
 
}
