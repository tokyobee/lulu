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

Animation animation1, animation2;

float xpos;
float ypos;
float drag = 30.0;

void setup() {
  size(640, 360);
  //change framerate for gif loading speed
  frameRate(8);
  animation1 = new Animation("walking_", 3);
  //animation2 = new Animation("PT_Teddy_", 60);
  ypos = height * 0.25;
}




void draw() { 
  float dx = mouseX - xpos;
  xpos = xpos + dx/drag;
  // Display the sprite at the position xpos, ypos
  //if (mousePressed) {
    background(255,200,0);
    animation1.display(xpos-animation1.getWidth()/2, ypos);
    
  //} else {
    //background(255, 204, 0);
    //animation2.display(xpos-animation1.getWidth()/2, ypos);
  //}
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
      String filename = imagePrefix + nf(i, 4) + ".gif";
      images[i] = loadImage(filename);
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
