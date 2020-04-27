int number_of_tiles = 1;
float stroke_width = 20;

void setup() {

  smooth(10);
  strokeCap(ROUND);
  background(255);
  fill(20);
//noLoop();
  size(800, 800);
}

void draw() {

  fill(255, 0);
  background(225,245,225);
  draw_tiles(); 
//save("great_mosque_of_kairouan_reflected.jpg");

}

void draw_tiles() { 

  float tile_size = width / number_of_tiles;
  for(int i = 0; i < number_of_tiles; i++) {
    float x = tile_size * i;
    for(int ii = 0; ii < number_of_tiles; ii++) {
      float y = tile_size * ii;

      stroke(54);
      stroke_width = map(mouseX, 0, width, 15, 55);
      strokeWeight(stroke_width + 1.5);
      draw_tile(x, y, tile_size);
      
      stroke(225,225,245);
      strokeWeight(stroke_width);
      draw_tile(x, y, tile_size);
      
      stroke(54);
      strokeWeight(map(stroke_width, 15, 55, .25, 5));
      draw_tile(x, y, tile_size);
    }
  }
}

void draw_tile(float x, float y, float tile_size) {
      
  // draw top left quadrant of the 
  // 4-quadrant tile, transforming 
  // and reflecting around for 
  // perfect symmetry
        
  int radius        = int(tile_size / 2);
  float a_angle     = 22.5; 
  float n_length    = radius * tan(radians(a_angle));

  float inner_width = radius * .245;
  float diagonal_offset = inner_width / sin(radians(45));
  float push_it     = tan(radians(a_angle)) * inner_width;

  int scale_x = 1;
  int scale_y = 1;

  /*_________________
    |       |       |
    |   1   |   2   |
    |_______|_______|
    |       |       |
    |   4   |   3   |
    |_______|_______|
   */

  for(int quadrant_x = 0; quadrant_x < 2; quadrant_x++) {
    
    for(int quadrant_y = 0; quadrant_y < 2; quadrant_y++) {

      pushMatrix();
      if(quadrant_x == 0) {
        
        // left side
        if(quadrant_y == 0) {

          // quadrant 1
          // left top
          
          translate(x, y);
          
        } else {
          
          // quadrant 4
          // left bottom
          
          translate(x, y + tile_size);
          fill(0, 255, 0);
          scale_x = 1;
          scale_y = -1;
        }
      } else {

        // right side
        if(quadrant_y == 0) {

          // quadrant 3
          // right bottom

          translate(x + tile_size, y + tile_size);
          scale_x = -1;
          scale_y = -1;
        } else {
          
          // quadrant 2
          // right top

          translate(x + tile_size, y);
          scale_x = -1;
          scale_y = 1;
        }
      }
      
      scale(scale_x, scale_y);

      line(radius - inner_width, 0 + push_it, radius - inner_width, radius - push_it);
   //   line(radius - inner_width, 0 + push_it, radius - inner_width, radius - push_it);
      line(push_it, radius - inner_width, radius - push_it, radius - inner_width);
    
      // draw second set of dividing 
      // lines crossing thru center
      
//    line(0, radius - n_length, radius, radius);
//    line(radius - n_length, 0, radius, radius);
    
      // draw skewed perimeter lines
      line(0, radius, push_it, radius - inner_width);
      line(radius, 0, radius - inner_width, push_it);
      
      // draw diagonal lines
      line(diagonal_offset, 0, radius, radius - inner_width - push_it);
      line(0, diagonal_offset, radius - diagonal_offset, radius);
      
      float missing_point_x = (radius - diagonal_offset - inner_width ) / sin(radians(45));
      
      circle(radius - missing_point_x, radius - missing_point_x, 10);
      
      circle(radius - inner_width,  radius - diagonal_offset - inner_width, 10); 
      circle(radius - diagonal_offset - inner_width, radius - inner_width, 10); 
      println(missing_point_x);
      
      // draw short little lines to complete central shape
      line(radius - inner_width - push_it, radius, radius - inner_width, radius - push_it);
      line(radius -  push_it, radius - inner_width, radius, radius - inner_width - push_it);

      /*
      attempt at masking the edges
      to better handle stroke joins?
      
      noFill();
      stroke(225,245,225);
      strokeWeight(50);
      square(-25,-25,radius + 25);
      */
      popMatrix();
    }
  }
}

void keyPressed() {
  
  if (key == 'x') {
    stroke_width = stroke_width + .25;
  }
  if(key == 'z') {
    stroke_width = stroke_width - .25;
  }

  if (key == '.') {
    number_of_tiles++;
  }
  if(key == ',') {
    number_of_tiles--;
  }
  number_of_tiles = constrain(number_of_tiles, 1, 10);
  stroke_width = constrain(stroke_width, .25, 20);
  redraw();
}
