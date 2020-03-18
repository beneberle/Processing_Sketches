// Global variables
float radius = 200; // Size of the circle

// number of points on the star
int numPoints = 5; // z,x will increment/decrement

// Controls:

// Keys:

// x  - add point
// z - remove point

void setup() {

  smooth();
  size(500, 500);
  strokeWeight(1);
  background(51);
}

void draw() {

  // flip canvas so that central 
  // point is on top
  
  //rotate(2*PI/2);
  //translate(-width,-height);
  
  // erase
  background(51);

  int numPoints = this.numPoints; 

  // calculate the angle each point is on
  float angle = TWO_PI/(float)numPoints; 

  // declare point plots array
  float[][] Plots;  

  // Setup the array
  Plots = new float [numPoints][2]; 
  for (int i = 0; i < numPoints; i++) { 
    float x = radius*sin(angle*i)+width/2;
    float y = radius*cos(angle*i)+height/2;
    Plots[i][0] = x; 
    Plots[i][1] = y;
    println(x);
    println(y);
  }
  noFill();

  // Draw satanic pentagram
  for (int i=0; i < numPoints; i++) { 
    if(i > 0) {
      strokeWeight(10);
      float x = Plots[i][0];
      float y = Plots[i][1];
      for (int ii = 0; ii < numPoints; ii++) { 

        // todo skip drawing the 
        // first and last lines
        // only draw between point more than one away?
        
        int nextPlot = ii + i + 2;
        if(nextPlot >= numPoints) {
          nextPlot = nextPlot - numPoints;
          //println(nextPlot);
        }
        if(ii < 2) {
          float xx = Plots[nextPlot][0];
          float yy = Plots[nextPlot][1];  
          line(x, y, xx, yy);
        }
      }
    }
  }

  // Draw satanic circle
  // around pentagram
  strokeWeight(15);
  ellipse(Plots[0][0], (Plots[0][1] -200), 400, 400);
}

void keyPressed() {
  if (key == 'z') {
    numPoints--;
  }
  if (key == 'x') {
    numPoints++;
  }
  
  numPoints = constrain(numPoints, 3, 30);
  redraw();
}
