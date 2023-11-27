//your variable declarations here
public void setup() 
{
  //your code here
}
public void draw() 
{
  //your code here
}
class spaceship extends Floater {
Public spaceship() {
corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -16;
    yCorners[0] = 16;
    xCorners[1] = -4;
    yCorners[1] = 0;
    xCorners[2] = -16;
    yCorners[2] = -16;
    xCorners[3] = 16;
    yCorners[3] = 0;
    myColor = color(0x7D7D7D);
    myCenterX = 600;
    myCenterY = 300;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
  }
}
