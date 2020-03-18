// Global variables
float radius = 150; // Size of the circle

// number of points on the star
int numPoints = 7; // z,x will increment/decrement

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
  
  rotate(2*PI/2);
  translate(-width,-height);
  
  // erase
  background(51);

  int numPoints = this.numPoints; 

  // calculate the angle each point is on
  float angle = TWO_PI/(float)numPoints; 

  // declare point plots array
  float[][] Plots;  

  // Setup the array
  Plots = new float [numPoints][3]; 
  for (int i = 0; i < numPoints; i++) { 
    float x = radius*sin(angle*i)+width/2;
    float y = radius*cos(angle*i)+height/2;
    Plots[i][0] = x; 
    Plots[i][1] = y;
    Plots[i][2] = 0.0;
  }

  // Draw the shape
  println(numPoints);
  for (int i=0; i<numPoints; i++) { 
    float x = Plots[i][0];
    float y = Plots[i][1];
    for (int ii=i; ii<numPoints; ii++) { 
      if (ii>i) {
        int index = ii;
        //if(index >= numPoints){
        //  index = ii - numPoints;
        //}
        //        println(ii);
        float xx = Plots[ii][0];
        float yy = Plots[ii][1];  
        strokeWeight(1);
        line(x, y, xx, yy);
      }
    }
    fill(45);
    strokeWeight(1);
    ellipse(x, y, 3, 3);
  }
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
