void setup() {

  size(800, 800);
  background(255);
  smooth(8);
  stroke(0);
  strokeWeight(5);
  noFill();
  noLoop();

}

void draw() {

  grid(10);
  
  strokeWeight(4);
  stroke(255);
  
  grid(10);

//save("triangle_study.jpg");
}

void grid(int rows) {
  
  int i = 1;
  float size = width / rows;
  float yDiff = size * .75; // 75
  float y1 = 0;

  for (i = 1; i <= rows+1; i++) {

    int ii = 1;
    float x1 = 0;
    if(i%2 == 0){
      // offset every other row
        x1 = x1 - (size/2);  
    }
    
    for (ii = 1; ii <= rows + 2; ii++) {
        
      float x3 = (cos(radians(60)) * size) + x1;
      float y3 = (sin(radians(60)) * size) + y1;

      yDiff = dist(x1 + (size/2), y1, x3, y3);
      
      pushMatrix();
      equi_triangle(size, x1, y1);

      // rotate 180 and move to right
      
      translate((size * rows), (yDiff * rows));
      rotate(radians(180));      
      
      // draw another triangle, opposite
      equi_triangle(size, x1, y1);

      popMatrix();
                 
      if (ii > 1) {
        // move x right
        x1 = x1 + size;
      }
    }
    // move y down
    y1 = i * (yDiff);
  }
}

void equi_triangle(float size, float x, float y){

  float x3 = (cos(radians(60)) * size) + x;
  float y3 = (sin(radians(60)) * size) + y;
    
  triangle(x, y, x3, y3, x + size, y);
  
  // calculate centroid point and draw lines 
  // from it to each vertex
  float centroidx = x3;
  float centroidy = (abs(y3 - y) * 0.334) + y; 
  line(x, y, centroidx, centroidy);
  line(x3, y3, centroidx, centroidy);
  line(x + size, y, centroidx, centroidy);
}