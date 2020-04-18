
void setup() {

  size(400, 400);
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

  // draw center grid lines
  line(center, 0, center, height); 
  line(0, center, width, center); 
  
  // draw diagonal grid lines
  line(0, 0, width, height);
  line(width, 0, 0, height);

  // get all points along circle
  int numPoints = 8; 
  float angle = TWO_PI/(float)numPoints; 
  float[][] Plots;
  float[] NextPlot;

  // Setup the array
  Plots = new float [numPoints][2]; 
  for (int i = 0; i < numPoints; i++) { 
    float x = radius * sin(angle*i) + width/2;
    float y = radius * cos(angle*i) + height/2;
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
    float xx = NextPlot[0];
    float yy = NextPlot[1];
    line(x, y, xx, yy);

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
  
  line(padding, center, center, padding); 
  line(center, padding, tile_size + padding, center); 
  line(padding, center, center, tile_size + padding); 
  line(tile_size + padding, center, center, tile_size + padding); 
}
