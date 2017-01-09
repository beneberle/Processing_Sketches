//
// Controls:
// MouseClick  - redraw 
//
//
/////////////////////////////////////////////////

void setup() {
  size(600, 600);
  colorMode(HSB, 100, 100, 100);
  noLoop();
  noStroke();
}

void draw() {
  background(10, 3, 90);
  paper(30);  // normal value
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