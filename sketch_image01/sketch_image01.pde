PImage img;

void setup() {
  size(400,324); // same as the image
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
    println(loc);
    float b = brightness(img.pixels[loc]);
    
    //threshold according to brightness
    if (b> 200){
    pixels[loc] = color(255);
    } else {
      pixels[loc] = color(0,random(250),random(250));
    }
  }
  }
  updatePixels();


}
