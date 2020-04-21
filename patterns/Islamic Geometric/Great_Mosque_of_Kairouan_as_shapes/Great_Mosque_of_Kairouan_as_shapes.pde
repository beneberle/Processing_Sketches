int number_of_tiles = 1;
float stroke_width = 8;
void setup() {

  smooth(10);
  strokeCap(SQUARE);
  background(255);
  fill(20);
  noLoop();
  size(800, 800);
}

void draw() {

  fill(255, 0);
  background(250);
  draw_tiles(); 
//save("great_mosque_of_kairouan_as_shapes.jpg");

}

void draw_tiles() { 

  stroke(0, 0, 0, 40);
  strokeWeight(.6);
  float tile_size = width / number_of_tiles;
  for(int i = 0; i < number_of_tiles; i++) {
    float x = tile_size * i;
    for(int ii = 0; ii < number_of_tiles; ii++) {
      float y = tile_size * ii;
      stroke(54);
      strokeWeight(stroke_width * 2.15);
//    draw_tile(x, y, tile_size);
//    stroke(240,240,245);
//    strokeWeight(stroke_width);
      draw_tile(x, y, tile_size);
    }
  }
}

void draw_tile(float x, float y, float tile_size) {
              
  int radius        = int(tile_size / 2);
  float a_angle     = 22.5; 
  float n_length    = radius * tan(radians(a_angle));

  float inner_width = radius * .245;
  float diagonal_offset = inner_width / sin(radians(45));
  float push_it     = tan(radians(a_angle)) * inner_width;

  strokeJoin(MITER);
  fill(245);
  noFill();
  for(int i = 0; i < 4; i++) {
      pushMatrix();
      translate(radius, radius);
      rotate(radians(45 * i));
      beginShape();
      vertex(0, -radius);
      vertex(-inner_width, -radius + push_it);
      vertex(-inner_width, -push_it);
      vertex(-inner_width - push_it, 0);
      vertex(-inner_width, push_it);
      vertex(-inner_width, radius - push_it);
      vertex(0, radius);
      vertex(inner_width, radius - push_it);
      
      vertex(inner_width, 0 + push_it);
      vertex(inner_width + push_it, 0);
      
      vertex(inner_width, -push_it);
      vertex(inner_width, -radius + push_it);
      vertex(0, -radius);
      endShape(CLOSE);
      popMatrix();
  }


  /*
  beginShape();
  vertex(0, radius);
  vertex(push_it, radius - inner_width);
  vertex(radius - push_it, radius - inner_width);
  vertex(radius, radius - inner_width - push_it);
  vertex(radius + push_it, radius - inner_width);
  vertex(tile_size - push_it, radius - inner_width);
  vertex(tile_size, radius);
  vertex(tile_size - push_it, radius + inner_width);
  vertex(radius + push_it, radius + inner_width);
  vertex(radius, radius + inner_width + push_it);
  vertex(radius - push_it, radius + inner_width);
  vertex(0 + push_it, radius + inner_width);
  vertex(0, radius);
  */

  endShape();
     
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
