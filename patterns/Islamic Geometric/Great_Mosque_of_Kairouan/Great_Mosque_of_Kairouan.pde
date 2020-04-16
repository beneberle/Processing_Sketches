
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

  rectMode(RADIUS); 
  float center = width/2;
  rect(center,center, 350, 350);
  circle(center,center, 700);
  line(center,0,center,height); 
  line(0,center,width,center); 
  
  // draw diagonals
  line(0,0,width,height);
  line(width,0,0,height);
  line(50,center,center,50); 
  line(center,50,tile_size+50,center); 
  
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
