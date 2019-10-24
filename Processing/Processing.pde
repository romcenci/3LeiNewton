import processing.serial.*;

Serial porta;
String myString;
float forca, angle;
  
void setup(){
  size(400,400);
  porta=new Serial(this,Serial.list()[0],9600);
}

void draw(){
  translate(-200,-130);
  scale(2);
  if(porta.available() > 0){
    myString = porta.readStringUntil('\n');
    if(myString != null){
      background(100,100,200);
      strokeWeight(1);
      for(angle=-3*PI/4;angle<=-PI/4;angle+=PI/48){
        line(200+80*cos(angle),200+80*sin(angle),200+90*cos(angle),200+90*sin(angle));
      }
      for(angle=-3*PI/4+PI/12;angle<=-PI/4;angle+=PI/6){
        line(200+77*cos(angle),200+77*sin(angle),200+90*cos(angle),200+90*sin(angle));
      }
      strokeWeight(2);
      for(angle=-3*PI/4;angle<=-PI/4+PI/6;angle+=PI/6){
        line(200+70*cos(angle),200+70*sin(angle),200+90*cos(angle),200+90*sin(angle));
      }
      forca = float(myString);
      angle = -forca/100*PI/2-PI/4;
      strokeWeight(1);
      line(200-15*cos(angle),200-15*sin(angle),200+90*cos(angle),200+90*sin(angle));
      ellipse(200,200,12,12);
    }
  }
}
