int number_of_tiles = 1;
float stroke_width = 25;
void setup() {

  smooth(10);
  strokeCap(SQUARE);
  background(250);
  fill(45, 10);
//  noLoop();
  size(800, 800);
}

void draw() {

  fill(45);
  background(150);
  stroke(240);
  strokeJoin(MITER);
  strokeWeight(stroke_width);
  noFill();

  float tile_size = width / number_of_tiles;

//draw_tile(tile_size);
//fill(245, 245, 245, 255);

  stroke(254);
  strokeWeight(stroke_width * 1.15);
  draw_tile(tile_size * .94);

  stroke(54);
  strokeWeight(stroke_width);
  draw_tile(tile_size * .94);
  
  stroke(244);
  strokeWeight(stroke_width * .55);
  draw_tile(tile_size * .94);

  stroke(54);
  strokeWeight(.75);
  draw_tile(tile_size * .94);

//save("great_mosque_of_kairouan_as_shapes.jpg");

}

void draw_tile(float tile_size) {

  int radius        = int(tile_size / 2);
  float a_angle     = 22.5; 
  float n_length    = radius * tan(radians(a_angle));

  float inner_width = radius * .245;
  float diagonal_offset = inner_width / sin(radians(45));
  float push_it     = tan(radians(a_angle)) * inner_width;
  for(int i = 0; i < 4; i++) {
      pushMatrix();
      translate(width / 2, height / 2);
      rotate(radians(45 * i));
      beginShape();
      vertex(0, -radius);
      vertex(-inner_width, -radius + push_it);
      vertex(-inner_width, -push_it);
      vertex(-inner_width - push_it, 0);
      vertex(-inner_width, push_it);
//    endShape();
      
//    beginShape();
      
      vertex(-inner_width, radius - push_it);
      vertex(0, radius);
      
      vertex(inner_width, radius - push_it);

      vertex(inner_width, 0 + push_it);
      vertex(inner_width + push_it, 0);
      
      vertex(inner_width, -push_it);
      vertex(inner_width, -radius + push_it);
      vertex(0, -radius);

      endShape(CLOSE);
      if(i == 1 ) {
         // 45*
//       line(0,radius,radius, 0);
      }
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
  stroke_width = constrain(stroke_width, .25, 30);
  redraw();
}
