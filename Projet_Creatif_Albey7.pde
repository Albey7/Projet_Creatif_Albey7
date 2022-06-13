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

/*PImage img;

void setup(){
  size (570, 570);
  img = loadImage("Image.jpg");
}

void draw(){
  image(img,0,0);
  image (img, 0, 0, width/2, height/2);
}*/

ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();
int w=30, h=30, blocks=20, direction=2;
int[]x_direction={0,0,1,-1},y_direction={1, -1, 0, 0,};


void setup(){
  size(600, 600);
  x.add(0);
  y.add(15);
  
}

void draw(){
  background(0);
  fill(56, 168, 111);
  //fill(3, 40, 252);
  //ellipse(200, 200, 80, 80);
  //fill(random(255), random(255), random(255));
  //ellipse(mouseX, mouseY, 80, 80);
  for (int i = 0; i< x.size(); i++) rect(x.get(i)*blocks, y.get(i)*blocks, blocks, blocks);
  if(frameCount%10==0){
    x.add(0, x.get(0) + x_direction[direction]);
    y.add(0, y.get(0) + y_direction[direction]);
    
    x.remove(x.size()-1);
    y.remove(y.size()-1);
} 
}

void keyPressed(){
  int newdir=keyCode==DOWN? 0:(keyCode==UP?1:(keyCode == RIGHT?2:(keyCode==LEFT?3:-1)));
  if (newdir !=-1) direction=newdir;
}
//https://www.youtube.com/watch?v=UpGCxdTXfSY
