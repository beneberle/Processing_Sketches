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
    
    /*
    float x = radius*sin(angle*i)+width/2;
    float y = radius*cos(angle*i)+height/2;
    xyArray[i][0] = x; // x1 co-ordinate
    xyArray[i][1] = y; // y1 co-ordinate
    xyArray[i][2] = (aperture/2) * sin(angle*i) + width/2; // x2 co-ordinate
    xyArray[i][3] = (aperture/2) * cos(angle*i) + height/2; // y2 co-ordinate
    xyArray[i][4] = 0.0;
    */
    
  }
 
  // Draw the shape
  for(int i=0;i<folds;i++){
    pushMatrix();
    translate(width/2,height/2);  
    rotate(radians((360/folds) * i));
    
    float x = radius*sin(angle*i)+width/2;
    float y = radius*cos(angle*i)+height/2;
//    translate(x,y);
   
//    float x2 = (aperture/2) * sin(angle*i) + width/2;
//    float y2 = (aperture/2) * cos(angle*i) + height/2;
    
//    line(x, y, x2, y2);
    
    line(0, aperture/2, 0, radius); 
    float available_space = dist(x,y,radius*sin(angle*(i+1))+width/2,radius*cos(angle*(i+1))+height/2);
    println("available space = " + available_space);
    println("divided by "+num_cords+" = " + available_space/num_cords); 
    for(int ii = 0; ii < this.num_cords; ii++){
       rect(0, 0, diam, available_space/num_cords);
       translate(0,available_space/num_cords);
    }
//    translate(0,0);

    popMatrix();
    /*
    int offset = i + ceil(folds/4); 
    if(folds < 4) {
      offset = i+1;
    }
    
    if(offset >= folds){
      offset = offset - folds;
    }
//  translate(0,0);
    
    
    for(int ii = 0; ii < num_cords; ii++){
      line(x+20, y, xyArray[offset][2] +20, xyArray[offset][3]);      
    }
    */
    ellipse(x, y, 5, 5);

  }

  stroke(H,S,B);
  strokeWeight(5);
  noFill();
  ellipse(width/2, height/2, (diam), (diam));
  fill(10, 3, 90);
  ellipse(width/2, height/2, aperture, aperture);
  noFill();
  stroke(10, 3, 90);

  strokeWeight(300);
  // this is masking the strips 
  // outside of the center circle
  ellipse(width/2, height/2, (diam+sz/2) +5, (diam+sz/2)+ 5);

  // paper(10);  // browser value
  paper(30);  // normal value
  save("corded_aperture.jpg");
}

void cord() {
  
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