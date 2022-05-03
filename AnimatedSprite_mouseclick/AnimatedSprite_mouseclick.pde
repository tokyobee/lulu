/**
 * Animated Sprite (Shifty + Teddy)
 * by James Paterson. 
 * 
 * Press the mouse button to change animations.
 * Demonstrates loading, displaying, and animating GIF images.
 * It would be easy to write a program to display 
 * animated GIFs, but would not allow as much control over 
 * the display sequence and rate of display. 
 */

import processing.sound.*;
PShape coin;

Animation animation1, animation2;

//declare variables
float xpos;
float ypos;
float drag = 30.0;

SoundFile[] file;

// Define the number of samples 
int numsounds = 1;
// Define a variable to store the randomly generated background color in
int backgroundColor[] = {255, 255, 255};


void setup() {
  size(640, 360);
  //change framerate for gif loading speed
  frameRate(8);
  animation1 = new Animation("walking_", 3);
  //animation2 = new Animation("PT_Teddy_", 60);
  ypos = height * 0.25;
  coin = loadShape("coin.svg");
  
  
  //Sound setup
  // Create a Sound renderer and an array of empty soundfiles
  file = new SoundFile[numsounds];

  // Load 5 soundfiles from a folder in a for loop. By naming
  // the files 1.aif, 2.aif, 3.aif, ..., n.aif it is easy to iterate
  // through the folder and load all files in one line of code.
  for (int i = 0; i < numsounds; i++) {
    file[i] = new SoundFile(this, (i+1) + ".aif");
  }
}


void draw() { 
  float dx = mouseX - xpos;
  xpos = xpos + dx/drag;

    background(255,200,0);
    animation1.display(xpos-animation1.getWidth()/2, ypos);
    
    shape(coin,width/2,height/2, 100,100);
  

  // if MC is walking, sound on  
  if(abs(dx/drag) > 5 ){
    file[0].play(0.5, 1.0);
   }
}

void mouseClicked() {    
  //detect if mouse is already clicked
  float d = dist(width/2, height/2, xpos-animation1.getWidth()/2,ypos);
   println(d);
  //detect if mouse is inside the circle
  if (d < 110) {
      coin.setVisible(false);
      //turn to next page
    } else {
       coin.setVisible(true);
    }
    
  }
  
