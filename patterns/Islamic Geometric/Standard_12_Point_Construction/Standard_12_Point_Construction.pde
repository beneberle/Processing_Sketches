
void setup() {

  size(800, 800);
  smooth(10);
  noLoop();
}

void draw() {

//paper(15);
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

void paper(int in_val) {
  noStroke();
  for (int i = 0; i<width-1; i+=2) {
    for (int j = 0; j<height-1; j+=2) {
      fill(random(85-10, 85+10), in_val);
      rect(i, j, 2, 2);
    }
  }

  for (int i = 0; i<30; i++) {
    fill(random(40, 60), random(in_val*2.5, in_val*3));
    rect(random(0, width-2), random(0, height-2), random(1, 3), random(1, 3));
  }
}
