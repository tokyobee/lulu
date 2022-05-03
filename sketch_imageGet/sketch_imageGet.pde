PImage img;

void setup() {
  size(800,1200);
  img = loadImage("stroke.jpeg");
  noStroke();
}

void draw() {
  background(255);
  
 
  for (int i = 0; i < img.width; i+=10) {
     for (int j = 0; j < img.height; j+=10) {
        color c = img.get(i,j);

      fill(c,random(255));
      rect(45+i, 100+j, random(7,10), random(7,10));
    }
  }
  
  

}
