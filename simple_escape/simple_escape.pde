int predatorX;
int predatorY;
int preyX;
int preyY;

void setup() {
  int sizeX = 480;
  int sizeY = 480;
  
  size(480, 480);
  colorMode(RGB, 255);
  noStroke();
  background(255, 255, 255);
  textAlign(CENTER);
  
  predatorX = int(random(sizeX));
  predatorY = int(random(sizeY));
  preyX = int(random(sizeX));
  preyY = int(random(sizeY));
}

void draw(){
  background(255);
  if(predatorX > preyX)
    predatorX++;
  else if(predatorX < preyX)
    predatorX--;
  
  if(predatorY > preyY)
    predatorY++;
  else if(predatorY < preyY)
    predatorY--;
    
  fill(255,0,0);
  ellipse(predatorX, predatorY, 10, 10);
  fill(0,0,255);
  ellipse(preyX, preyY, 10, 10);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      preyY = preyY - 10;
    } else if (keyCode == DOWN) {
      preyY = preyY + 10;
    }else if (keyCode == RIGHT) {
      preyX = preyX + 10;
    }else if (keyCode == LEFT) {
      preyX = preyX - 10;
    }
  }
}