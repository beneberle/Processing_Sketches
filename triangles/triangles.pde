void setup() {
  size (800, 800);
  smooth(8);
  stroke(8);
  background(255);
  noFill();
  noLoop();
}

void draw() {
  int size = 30;
  stroke(2);
  grid(40, 20);

}

void grid(int size, int rows) {
  println("grid");
  int i = 1;
  float yDiff = size * .75; // 75

  float y1 = 0;
  float y2 = yDiff;
  for (i = 1; i < rows; i++) {

    int ii = 0;
    float trianglesPerRow = abs(width / size); 
    float x1= 0;
    float x2 = (size/2);

    for (ii = 0; ii <= trianglesPerRow; ii++) {

      // straight lines
      line(0, y2, width, y2);
      line(0, y1, width, y1);

      line(x1, y1, x2, y2);
      line(x2, y2, x2 + (size/2), y1);
      line(x1, y2+yDiff, x2, y1+yDiff);
      line(x2, y2, x1+size, y2+yDiff);

      if (ii > 0) {
        x1 = x1 + size;
        x2 = x2 + size;
      }
      //line(startX, startY, endX, endY);
    }
    println("row " + i);
    println("y2 = " + y2);
    // move y down after first row
    y1 = i * (yDiff *2);
    y2 = y1 + yDiff;
  }
}