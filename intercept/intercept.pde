import java.awt.Point;


public static final float tol = 0.000000000000001f;
Vector predatorPV;
Vector predatorSV;

Vector preyPV;
Vector preySV;

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

  predatorPV = new Vector(20, 460, 0);  
  preyPV = new Vector(460, 460, 0);

  predatorSV = new Vector(1, -1, 0);
  preySV = new Vector(-1, -1, 0);

  start = new Point((int)predatorPV.x, (int)predatorPV.y );
  Point end = endPoint();
  buildLine(start, end);
}

void draw() {

  if (line[i] == null) {
  } else {
    fill(255, 0, 0);
    ellipse(line[i].x, line[i].y, 10, 10);
    predatorPV.x = line[i].x;
    predatorPV.y = line[i].y;
  }
  preyPV = Plus(preyPV, preySV);
  fill(0, 0, 255);
  ellipse(preyPV.x, preyPV.y, 10, 10);
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

Point endPoint() {
  Vector Vr = Minus(preyPV, predatorPV);
  Vector Sr = Minus(preySV, preySV);
  float tc = Sr.Magnitude() / Vr.Magnitude();
  Vector St = predatorSV;
  St.x = St.x * tc;
  St.y = St.y* tc;
  St.z = St.z * tc;
  return new Point((int)St.x, (int)St.y);
}

class Vector {
  float x;
  float y;
  float z;

  Vector() {
    x = 0;
    y = 0;
    z = 0;
  }

  Vector(float xi, float yi, float zi) {
    x = xi;
    y = yi;
    z = zi;
  }

  float Magnitude() {
    return (float) sqrt(x*x + y*y + z*z);
  }

  void Normalize() {
    float m = (float) sqrt(x*x + y*y + z*z);
    if (m <= tol) m = 1;
    x /= m;
    y /= m;
    z /= m;  

    if (abs(x) < tol) x = 0.0f;
    if (abs(y) < tol) y = 0.0f;
    if (abs(z) < tol) z = 0.0f;
  }

  void Reverse() {
    x = -x;
    y = -y;
    z = -z;
  }
}
Vector Plus(Vector v1, Vector v2) {
  Vector resultV = new Vector();
  resultV.x = v1.x;
  resultV.y = v1.y;
  resultV.z = v1.z;
  resultV.x += v2.x;
  resultV.y += v2.y;
  resultV.z += v2.z;
  return resultV;
}

Vector Minus(Vector v1, Vector v2) {
  Vector resultV = new Vector();
  resultV.x = v1.x;
  resultV.y = v1.y;
  resultV.z = v1.z;
  resultV.x -= v2.x;
  resultV.y -= v2.y;
  resultV.z -= v2.z;
  return resultV;
}