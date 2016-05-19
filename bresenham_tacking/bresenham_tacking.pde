import java.awt.Point;
int predatorX;
int predatorY;
int preyX;
int preyY;

int i;

private static final int WIDTH = 480;
private static final int HEIGHT = 480;
public static final int ROW = HEIGHT;
public static final int COL = WIDTH;
private static final int MAX_LINE_LENGTH = 99999;

private Point start;

private Point[] line;

void setup() {

  size(480, 480);
  colorMode(RGB, 255);
  noStroke();
  background(255, 255, 255);
  textAlign(CENTER);
  line = new Point[MAX_LINE_LENGTH];

  predatorX = int(random(WIDTH));
  predatorY = int(random(HEIGHT));
  preyX = int(random(WIDTH));
  preyY = int(random(HEIGHT));

  start = new Point(predatorX, predatorY );
  Point end = new Point(preyX, preyY);
  buildLine(start, end);
}

void draw() {
  background(255);

  if (line[i] == null) {
  } else {
    fill(255, 0, 0);
    ellipse(line[i].x, line[i].y, 10, 10);
    predatorX = line[i].x;
    predatorY = line[i].y;
  }


  fill(0, 0, 255);
  ellipse(preyX, preyY, 10, 10);
  i++;
}

private void buildLine(Point start, Point end) {
  int nextX = start.x;
  int nextY = start.y;
  int deltaX = end.x - start.x;
  int deltaY = end.y - start.y;
  int stepX, stepY;
  int step;
  int fraction;

  for (step = 0; step < MAX_LINE_LENGTH; step++) {
    line[step] = null;
  }

  step = 0;

  if (deltaX < 0)
    stepX = -1;
  else
    stepX = 1;
  if (deltaY < 0)
    stepY = -1;
  else
    stepY = 1;

  deltaX = Math.abs(deltaX * 2);
  deltaY = Math.abs(deltaY * 2);

  line[step] = new Point(nextX, nextY);
  step++;

  if (deltaX > deltaY) {
    fraction = deltaY - deltaX / 2;
    while (nextX != end.x) {
      if (fraction >= 0) {
        nextY += stepY;
        fraction -= deltaX;
      }
      nextX += stepX;
      fraction += deltaY;
      line[step] = new Point(nextX, nextY);
      step++;
    }
  } else {
    fraction = deltaX - deltaY / 2;
    while (nextY != end.y) {
      if (fraction >= 0) {
        nextX += stepX;
        fraction -= deltaY;
      }
      nextY += stepY;
      fraction += deltaX;
      line[step] = new Point(nextX, nextY);
      step++;
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      preyY = preyY - 10;
    } else if (keyCode == DOWN) {
      preyY = preyY + 10;
    } else if (keyCode == RIGHT) {
      preyX = preyX + 10;
    } else if (keyCode == LEFT) {
      preyX = preyX - 10;
    }
  }
  start = new Point(predatorX, predatorY);
  Point end = new Point(preyX, preyY);
  buildLine(start, end);
  i=0;
}