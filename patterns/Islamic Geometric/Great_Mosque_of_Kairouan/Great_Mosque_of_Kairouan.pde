
void setup() {

  size(800, 800);
  smooth(10);
  strokeWeight(4);
  noLoop();
    
}

void draw() {

  paper(15);
  fill(245, 0);
  draw_tile(700);
}

void draw_tile(int tile_size) { 

    stroke(130);
    strokeWeight(2);
  // first draw all construction lines,
  
  // just for fun
  
  // draw grid lines lines
  int radius =  tile_size / 2;
  rectMode(RADIUS); 
  float center = width/2;
  rect(center, center, 350, 350);
  circle(center, center, 700);
  line(center, 0, center, height); 
  line(0, center, width, center); 
  
  // draw diagonals
  line(0, 0, width, height);
  line(width, 0, 0, height);

  // get all points along circle
  int numPoints = 16; 

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
    float xx = NextPlot[0];
    float yy = NextPlot[1];
    line(x, y, xx, yy);
    fill(45);
//  strokeWeight(1);

    if(i % 2 != 0) {
        // odd column
        ellipse(x, y, 10, 10);
        if (numPoints > i + 2) {
          NextPlot = Plots[i + 2];
        } else {
          NextPlot = Plots[1];   
        }
        line(x, y, NextPlot[0], NextPlot[1]);
    }
    println("points are x:" + x + "| y:"+ y);
  }
  
  line(50,center,center,50); 
  line(center,50,tile_size+50,center); 
  line(50,center,center,tile_size+50); 
  line(tile_size+50,center,center,tile_size+50); 
  
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
