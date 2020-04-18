
void setup() {

  size(600, 600);
  smooth(10);
  noLoop();
}

void draw() {

  fill(45, 0);
  draw_tile();
}

void draw_tile() { 

    int tile_size = int(width * .85);
    stroke(130);
    strokeWeight(.8);
    int radius =  tile_size / 2;
    int padding = int((width - tile_size) / 2);
  
  // draw all construction lines
    // draw basic grid lines
  

  rectMode(RADIUS); 
  float center = width/2;
  rect(center, center, radius, radius);
  circle(center, center, tile_size);
    
  // get all points along circle
  int numPoints = 12; 
  float angle = TWO_PI/(float)numPoints; 
  float[][] Plots;
  float[] NextPlot;

  // Setup the array
  Plots = new float [numPoints][2]; 
  for (int i = 0; i < numPoints; i++) { 
    float x = radius * 2 * sin(angle*i) + center;
    float y = radius * 2 * cos(angle*i) + center;
    Plots[i][0] = x; 
    Plots[i][1] = y;
  }

  for (int i = 0; i < numPoints; i++) { 
    float x = Plots[i][0];
    float y = Plots[i][1];
    line(x, y, center, center);

    if(i % 2 != 0) {
      // odd column
      ellipse(x, y, 5, 5);
      if (numPoints > i + 2) {
        NextPlot = Plots[i + 2];
      } else {
        NextPlot = Plots[1];   
      }
    
      float angle_b = NextPlot[0] / (radius + padding - (NextPlot[1]));
    }
  }
}
