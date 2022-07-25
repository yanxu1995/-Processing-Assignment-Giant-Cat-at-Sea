/****************************
  ・氏名:YAN,Xu
  ・学生番号:
 ****************************/

int sunX = 0; //Horizontal coordinate of the sun.
int sunY = 500; //Longitudinal coordinates of the sun.
int backSunX = 1; //Speed of movement of the vertical coordinate of the sun.
int backSunY = -1; //Speed of movement of the horizontal coordinate of the sun.
float time = 0; //Time coordinates of the sea water.

void setup(){
  size(1000,1000);  
}

void draw(){
  
  //Import the sun 
  sun();
  
  //import the monster
  monster();
  
  //Set the monsters eye
  eye(378, 705, 90, 90);
  eye(676, 652, 90, 90);


  //Import the wave
  wave();
  
  //Import the target
  target();
}

//The target floating on the water
void target(){
  noStroke();
  fill(255);
  rect(mouseX-50,mouseY-25,100,50);
}

//Sun
void sun(){
  //Set the background to change with the sun
  background((640-sunY)/2.1,(640-sunY)/2.1,(640-sunY)/2.1);
  //Draw the Sun
  fill(255,100,69);
  noStroke();
  ellipse(sunX,sunY,150,150);
  
  //Set solar coordinates
  sunX += backSunX;
  sunY += backSunY;
  
  //If the sun is at the topmost level, Speed of movement of the horizontal coordinate of the sun change to -1
  if(sunY < 75){
    backSunY = 1;
  } 
}

//Monster in the sea
void monster(){
  noStroke();
  fill(10);
  
  //The beginShape() function is used to draw more complex shapes. 
  //Specifying this function will start recording the vertices that will be used to draw the shape. 
  //The endShape() function must be called to end the recording and complete the shape.
  beginShape();
  curveVertex(302, 1090);
  curveVertex(226, 1000);
  curveVertex(182, 766);
  curveVertex(184, 544);
  curveVertex(236, 388);
  curveVertex(370, 486);
  curveVertex(508, 550);
  curveVertex(640, 436);
  curveVertex(806, 278);
  curveVertex(884, 450);
  curveVertex(794, 576);
  curveVertex(912, 584);
  curveVertex(994, 684);
  curveVertex(1132, 816);
  curveVertex(1000, 1000);
  curveVertex(1000, 1000);
  endShape();
  
  beginShape();
  curveVertex(474, 600);
  curveVertex(288, 634);
  curveVertex(366, 486);
  curveVertex(642, 432);
  curveVertex(778, 526);
  curveVertex(602, 580);
  endShape();

  beginShape();
  curveVertex(696, 494);
  curveVertex(696, 494);
  curveVertex(822, 388);
  curveVertex(868, 382);
  curveVertex(884, 436);
  curveVertex(936, 600);
  curveVertex(1100, 832);
  curveVertex(1092, 890);
  curveVertex(804, 632);
  curveVertex(766, 588);
  endShape();
 
  fill(240);
  ellipse(395, 717, 158, 154);
  ellipse(696, 666, 164, 162);
}

//monsters eyes
void eye(int x,int y,int h,int s){
  float a;
  //atan2 function:Calculates the angle (in radians) from a specified point to the coordinate origin as measured from the positive x-axis.
  //Variables a is the angle (in radians) from the mouse coordinates to the eye coordinates
  a = atan2(mouseY - y,mouseX - x); 
  fill(10);
  strokeWeight(30); 
  //Add cos(a) variable to the eye coordinates to achieve the effect that the eye follows the mouse movement.
  ellipse(x+20*cos(a),y+20*sin(a),h,s);
}

//sea
void wave(){
  float x = 0;
  while(x < width){
    stroke(color(50,117,185));
    //noise function:Returns the Perlin noise value at specified coordinates.
    //Use the noise function to draw many thick lines in the lower part of the screen to achieve a relatively natural wave effect.
    line(x, mouseY + 50 * noise(x / 100, time), x, height);
    x = x + 1;
    time = time + 0.001;
  }
}
