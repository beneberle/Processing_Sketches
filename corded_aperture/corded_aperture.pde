/////////////////////////// //<>// 
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////
//
// browser version
// Don't use without permission
//
// Based on:
// #37 Son of Ra
// http://geometrydaily.tumblr.com/post/17155048079/37-son-of-ra-a-new-minimal-geometric
//
// Controls:
// MouseClick  - redraw 
//
// Keys:
// X  - add one strip
// Z - remove one strip 
// S - increase aperture
// A - decrease aperture
//
/////////////////////////////////////////////////

int sw = 2;           
int sz = 600;
float diam = 600/1.8;
float start;
int aperture = 60;
int folds = 6;
int num_cords = 10;
float step = diam/num_cords;
int [] ch = { -1, 1 };
float[][] xyArray; // Declare an array
int wdt = 65;

void setup() {
  size(600, 600);
  colorMode(HSB, 100, 100, 100);
  noLoop();
  rectMode(CENTER);
  noStroke();
}

void draw() {

  background(10, 3, 90);
  
  start = diam; 

  float H = random(0, 100);
  float S = random(90, 100);
  float B = 10;
//  float angle = 360/folds;
  float angle = TWO_PI/(float)folds;
  stroke(H,S,B);
  strokeWeight(5);

  xyArray = new float [folds][5]; // Setup the array dimentions
  float radius = diam/2;
  for(int i = 0; i<folds; i++){
    float x = radius*sin(angle*i)+width/2;
    float y = radius*cos(angle*i)+height/2;
    xyArray[i][0] = x; // Store the x1 co-ordinate
    xyArray[i][1] = y; // Store the y1 co-ordinate
    xyArray[i][2] = (aperture/2) * sin(angle*i) + width/2; // Store the x2 co-ordinate
    xyArray[i][3] = (aperture/2) * cos(angle*i) + height/2; // Store the x2 co-ordinate // Store the y2 co-ordinate
    xyArray[i][4] = 0.0;
  }
 
  // Draw the shape
  for(int i=0;i<folds;i++){ 
    float x = xyArray[i][0];
    float y = xyArray[i][1];

    int offset = i + ceil(folds/4); 
    if(folds < 4) {
      offset = i+1;
    }
    
    if(offset >= folds){
      offset = offset - folds;
    }
    
    line(x, y, xyArray[offset][2], xyArray[offset][3]);
    //line(x+20, y, xyArray[offset][2] +20, xyArray[offset][3]);
//    ellipse(x, y, 5, 5);
  }
  stroke(H,S,B);
  strokeWeight(5);
  noFill();
  ellipse(width/2, height/2, (diam), (diam));
  ellipse(width/2, height/2, aperture, aperture);
  
  stroke(10, 3, 90);
  noFill();
  strokeWeight(300);
  // this is masking the strips 
  // outside of the center circle
  // ellipse(width/2, height/2, (diam+sz/2), (diam+sz/2));

  // paper(10);  // browser value
  paper(30);  // normal value
  save("corder_aperture.jpg");
}

void keyPressed() {
  if (key == 'z') {
    folds--;
  }
  if (key == 'x') {
    folds++;
  }
  if (key == 'a') {
    aperture = aperture - 4;
  }
   if (key == 's') {
    aperture = aperture + 4;
  }
  
  folds = constrain(folds, 2, 30);
  step = diam/num_cords;
  redraw();
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