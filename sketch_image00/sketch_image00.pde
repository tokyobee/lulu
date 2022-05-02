PImage img;

void setup() {
  size(360,292);
  img = loadImage("stroke.jpeg");
  noStroke();
}

void draw() {
  background(255);
  
  loadPixels();
  for (int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++){
    pixels[i] = color(random(255),random(255),random(255),100);
    //pixels[i] = color(random(255));
    int loc = i+j*width;
    pixels[loc] = img.pixels[loc];
    //pixels[loc] = img.pixels[loc]/2;
  }
  }
  updatePixels();

}
