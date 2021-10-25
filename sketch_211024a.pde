int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

int d = day();    // Values from 1 - 31
int m = month();  // Values from 1 - 12
int y = year();   // 2003, 2004, 2005, etc.

PImage sun;
PImage moon;
PImage earth;


void setup() {
  size(640, 1000);
  stroke(255);
  
  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;
  
  cx = width / 2;
  cy = height / 2;
  
}

void draw() {
  sun = loadImage("sunny.png");
  moon = loadImage("moon.jpg");
  earth = loadImage("earth.png");
  background (0);
  imageMode(CENTER);
  
  String se = String.valueOf(d);
  text(se, 10, 28);
  fill(0, 408, 612);
  se = String.valueOf(m);
  text(se, 10, 56); 
  fill(0, 408, 612);
  se = String.valueOf(y);
  text(se, 10, 84);
  fill(0, 408, 612);
  

  image(earth, 315, 500, 455, 600);
  image(sun, width/2, height-770, 60, 60);
  image(moon, width/2, height-220, 60, 60);
 
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  

  stroke(255);
  strokeWeight(1);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  strokeWeight(2);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(4);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
  

  strokeWeight(4);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x, y);
    
  }
  endShape();
}
