int s;
int m;
int h;
float r;
float r2;
float r3;
float count;

void setup() {
  size(600, 600);
  //declare random numbers
  r = random(-200,-140); 
  r2 = random(-100,-80); 
  r3 = random(10,70);
}

void draw () {
  background(150);
  println(r,r2,r3); 
  
  //CLOCK BASE
    for(int i =1;i<3;i++){
    if (i==1){
        noFill();
        strokeWeight(25);
        stroke(#E0AA20);
    } else if(i==2) {
        noFill();
        strokeWeight(40);
        stroke(0);
       // count = random(70);
    }
  
  pushMatrix();
  rotate(PI/4); 
  translate(width/2,height/2);
  rectMode(RADIUS); 
  rect(i*97,r*i+-13,width/2-77*i,i*r2);
  popMatrix();
    }

  
  //noFill();
  //strokeWeight(25);
  //stroke(#E0AA20);
  //quad(185, 245, 60, 370, 210, 520, 335, 395); //yellow ring
  //strokeWeight(40);
  //stroke(0);
  //quad(275, 75, 75, 275, 325, 525, 525, 325); //black outer ring
  //float a = dist(60, 370, 210, 520);//254/212
  //float b = dist(75, 275, 325, 525);//282/353


// color
  for(int i =1;i<4;i++){
  noStroke();
    if ( i==1){
      fill(#741512);
    } else if (i==3){
      fill(#2371C1); 
    } else {
      fill(#E8E8E8);
    }
    
  // create quads
  pushMatrix();
  rotate(PI/4);
  translate(width/2,height/2);
  rect(120,r-r3*i,r3*i,(map(i,4,1,74,214))+2*i);
  
  popMatrix();

  // create quads
  //quad(350, 325, 200, 475, 280, 555, 430, 405); //red quad
  //fill(#2371C1);
  //quad(275, 80, 225, 130, 475, 380, 525, 330); //blue quad
  //fill(#E8E8E8);
  //quad(400, 100, 175, 325, 325, 475, 550, 250); //white quad
  //println(dist(350, 325, 200, 475),dist(200, 475, 280, 555));//212/113
  //println(dist(275, 80, 225, 130),dist(225, 130, 475, 380));//70/353
  //println(dist(400, 100, 175, 325),dist(175, 325, 325, 475));//318/212 

}
  translate(width/2, height/2);

  pushMatrix();
  rotate(radians(-90));

  s = second();
  m = minute();
  h = hour();

  displayClock();
  popMatrix();
}

void displayClock() {
  noFill();
  stroke(255);
  strokeWeight(10);

  float sAngle = map(s, 0, 60, 0, 360);
  float mAngle = map(m, 0, 60, 0, 360);
  float hAngle = map(h%12, 0, 12, 0, 360);

  //hour hand
  pushMatrix();
  rotate(radians(hAngle));
  strokeCap(PROJECT);
  stroke(#557FA7);
  strokeWeight(10);
  line(0, 0, 150, 0);
  popMatrix();

  //minute hand
  pushMatrix();
  rotate(radians(mAngle));
  strokeCap(PROJECT);
  stroke(#DBBF33);
  strokeWeight(20);
  line(0, 0, 150, 0);
  stroke(#E0E0E0);
  line(150, 0, 175, 0);
  popMatrix();

  //second hand
  pushMatrix();
  rotate(radians(sAngle));
  strokeCap(PROJECT);
  strokeWeight(20);
  stroke(#810600);
  line(0, 0, 225, 0);
  stroke(#E0E0E0);
  line(225, 0, 200, 0);
  popMatrix();

  noStroke();
  fill(100);
  for (float a = 0; a < 360; a += 360/12) {
    float rad = radians(a);
    //float x = 200*cos(rad);
    //float y = 200*sin(rad);
  }

  //saveFrame("output/clock_####.png");
}
