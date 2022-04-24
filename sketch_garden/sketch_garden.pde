void setup() {
  size(600, 500);  // make a graphics window
  smooth();        // draw everything nicely
}

// draw a little garden of flowers
void draw() {
  background(165, 240, 225);              // clear the screen
  int numFlowers = (int)random(10, 30);   // pick a number of flowers
  for (int i=0; i<numFlowers; i++) {
    drawOneDaisy();   // draw the flowers one by one
  }
  frameRate(.5);  // draw a new frame every 2 seconds
}

void drawOneDaisy() {
  float cx = width * random(0, 1);         // choose the flower's center
  float cy = height * random(.2, .8);
  float r = (width/2.0) * random(.1, .2);  // the outer radius of the petals
  float innerR = r * 0.2;                  // radius of the central bud
  int numPetals = (int)random(4, 20);      // draw this many petals
    
  // Pick a couple of bright colors.  Using HSB, we can keep the
  // saturation and brightness high, while choosing a random hue.
  colorMode(HSB);
  color insideColor = color(random(0, 255), random(100, 255), random(100, 200));
  color petalsColor = color(random(0, 255), random(100, 255), random(100, 200));
  colorMode(RGB);
  
  // Draw a slanted stalk from the center of the bud to the ground.  
  noFill();
  stroke(0);
  line(cx, cy, cx+random(-50, 50), height);
    
  // draw each petal
  noStroke();
  fill(petalsColor);
  // pick a random starting angle for the petals
  float angleStart = random(TWO_PI);
  // find the maximum angle spanned by each petal
  float angleSize = TWO_PI/numPetals;
  for (int i=0; i<numPetals; i++) {
    // make the range of angles spanned by this petal
    float angle1 = angleStart + (angleSize * (i+random(.1, .4)));
    float angle2 = angleStart + (angleSize * (i+random(.6, .9)));
    // make the outermost radius of this petal
    float thisR = r * random(.9, 1.1);
    // draw the petal as a filled-in arc radiating from the bud
    arc(cx, cy, thisR*2, thisR*2, angle1, angle2);
  }
    
  // draw the central bud
  fill(insideColor);
  noStroke();
  ellipse(cx, cy, innerR*2, innerR*2);
  
    // finally, draw the grassy ground
  fill(75, 155, 75);
  rect(0, 700, width, 100);
}
