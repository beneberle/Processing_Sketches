int number_of_tiles = 1;
float stroke_width = 25;
void setup() {

  smooth(10);
  strokeCap(SQUARE);
  size(800, 800);
}

void draw() {

  fill(45);
  background(38, 70, 83);
  stroke(240);
  strokeJoin(MITER);
  strokeWeight(stroke_width);
  noFill();

  float tile_size = width / number_of_tiles;

//draw_tile(tile_size);
//fill(245, 245, 245, 255);

  /*
  stroke(254);
  strokeWeight(stroke_width * 1.15);
  draw_tile(tile_size * .94);

  stroke(54);
  strokeWeight(stroke_width);
  draw_tile(tile_size * .94);
  
  stroke(244);
  strokeWeight(stroke_width * .55);
  draw_tile(tile_size * .94);
  */
  
  stroke(54);
  strokeWeight(stroke_width);
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
  
  float[][] colors;

  colors = new float[5][3];

  colors[0][0] = 231;
  colors[0][1] = 111; 
  colors[0][2] = 81;
  
  colors[1][0] = 42; 
  colors[1][1] = 157; 
  colors[1][2] = 143;
  
  colors[2][0] = 233; 
  colors[2][1] = 196; 
  colors[2][2] = 106;
  
  colors[3][0] = 244; 
  colors[3][1] = 162; 
  colors[3][2] = 97;
  
  colors[4][0] = 231;
  colors[4][1] = 111; 
  colors[4][2] = 81;
  
  for(int i = 1; i < 5; i++) {
    
    stroke(colors[i][0], colors[i][1], colors[i][2]); 
    pushMatrix();
    translate(width / 2, height / 2);
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

    if(i < 2) {
      fill(colors[4][0], colors[4][1], colors[4][2]);
    } else {
      fill(colors[i-2][0], colors[i-2][1], colors[i-2][2]);
    }
    noStroke();
    square(-inner_width - (stroke_width / 2), -inner_width - (stroke_width / 2), stroke_width);
    square(inner_width - (stroke_width / 2), inner_width - (stroke_width / 2), stroke_width);
    noFill();
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
