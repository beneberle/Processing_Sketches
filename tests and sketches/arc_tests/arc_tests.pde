
void setup(){
  size(500, 500);
  background(0);
//  translate(width/2, height/2);
  stroke(255);
  smooth();
  noFill();
  int startX = 0;
  int startY = 0;
  int h = 25;
  int w = 35;
  for(int it = 0; it < 10; it++){

    for(int i = 0; i < 20; i++){
    
      startX = w * i * it;
      startY = h * i * it;
      if(i>0){
        line(startX,startY,startX+w, startY);
      } else {
        line(0,0,w,0);
      }
      arc(startX, startY, w*2, h*2, -HALF_PI, 0);
      arc(startX, startY - h, w*2, h*2, PI/2, PI);
  }
}
 
//  line(0,0,50,0);
//  arc(50, 50, 100, 100, -HALF_PI, 0);
//  line(50,50,100,50);
//  arc(50, 0, 100, 100, PI/2, PI);
}