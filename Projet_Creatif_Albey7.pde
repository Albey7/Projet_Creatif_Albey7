/*void setup(){
  size(1000,1000);
}

void draw(){
  background(32);
  ellipse(mouseX, mouseY, 50, 50);
}*/

/*PGraphics pg;

void setup() {
  size(640, 360);
  pg = createGraphics(200, 100);
}

void draw() {
  fill(0, 12);
  rect(0, 0, width, height);
  fill(255);
  noStroke();
  ellipse(mouseX, mouseY, 60, 60);
  
  pg.beginDraw();
  pg.background(51);
  pg.noFill();
  pg.stroke(255);
  pg.ellipse(mouseX-120, mouseY-60, 60, 60);
  pg.endDraw();
  
  // Draw the offscreen buffer to the screen with image() 
  image(pg, 120, 60); 
}*/

PImage img;

void setup(){
  size (570, 570);
  img = loadImage("Image.jpg");
}

void draw(){
  image(img,0,0);
  image (img, 0, 0, width/2, height/2);
}
