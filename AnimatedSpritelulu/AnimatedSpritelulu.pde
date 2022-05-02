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
Animation animation1, animation2;

float xpos;
float ypos;
float drag = 10.0;
boolean play;

SoundFile[] file;
// Define the number of samples
int numsounds = 1;

PImage book;

void setup() {
  size(1000, 600);
  
  book = loadImage("book.PNG");
  
  //change framerate for gif loading speed
  frameRate(3);
  animation1 = new Animation("walking_", 3);
  //animation2 = new Animation("PT_Teddy_", 60);
  //ypos = height * 0.25;
  ypos = 0;
  xpos = 1000;


  //Sound setup
  // Create a Sound renderer and an array of empty soundfiles
  file = new SoundFile[numsounds];

  // Load 5 soundfiles from a folder in a for loop. By naming
  // the files 1.aif, 2.aif, 3.aif, ..., n.aif it is easy to iterate
  // through the folder and load all files in one line of code.
  
  for (int i = 0; i < numsounds; i++) {
    file[i] = new SoundFile(this, (i) + ".wav");
  }


}


void draw() {
  
  background(210, 210, 210);
  noStroke();
  fill(215, 175, 150);
  quad(0,0,0,height/3, width, height/3, width, 0);
  
  image(book,200, 400);
  
  float dx = mouseX - xpos;
  xpos = xpos + dx/drag;
  // Display the sprite at the position xpos, ypos
  animation1.display(xpos-animation1.getWidth()/2, ypos);
  
  // if MC is walking, sound on
  
 if (abs(dx/drag) > 10){
    file[0].play();
    

  }else{
     file[0].pause();
  }
  
}


// Class for animating a sequence of GIFs
class Animation {
  PImage[] images;
  int imageCount;
  int frame;

  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".PNG";
      images[i] = loadImage(filename);
      images[i].resize(500, 600);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }

  int getWidth() {
    return images[0].width;
  }
}
