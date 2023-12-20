SpaceShip ship;
Stars [] star;
ArrayList <Asteroid> fallingrocks = new ArrayList <Asteroid>();
ArrayList <Bullet> pewpew = new ArrayList <Bullet> ();
private boolean shipacc, shipbcc;
public void setup() 
{
  size(900, 900);
  ship = new SpaceShip();
  star = new Stars[100];
  for(int i = 0; i < star.length; i++)
    {
      star[i] = new Stars();
    }
    for(int i = 0; i < 25; i++)
      fallingrocks.add(new Asteroid());

}
public void draw() 
{
  background(0);
  debuginfo();
  ship.show();
  ship.move();

  for(int i = 0; i < star.length; i++)
    {
      star[i].show();
    }

  for(int i = 0; i < fallingrocks.size(); i++)
  {
    fallingrocks.get(i).show();
    fallingrocks.get(i).move();
    if (dist(ship.getX(), ship.getY(), fallingrocks.get(i).getX(), fallingrocks.get(i).getY()) < 20)
    fallingrocks.remove(i);
    for (int ii = 0; ii < pewpew.size(); ii++)
    if (dist(pewpew.get(ii).getX(),pewpew.get(ii).getY(),fallingrocks.get(i).getX(), fallingrocks.get(i).getY()) < 20) {
    pewpew.remove(ii);
    fallingrocks.remove(i);
  }
  }
  for (int i = 0; i < pewpew.size(); i ++) {
      pewpew.get(i).show();
      pewpew.get(i).move();
    }

  if (shipacc == true) 
  ship.accelerate(0.2);
  if (shipbcc == true)
  ship.accelerate(-0.2);
  mouseToDirection(mouseX, mouseY);
}
public void debuginfo() {
  fill(#ffb7b7);
  text(key , 40,50,50);
  text(mouseX ,20, 50,50);
  text(mouseY , 50,50);
  text(ship.getX(),100, 50,50);
  text(ship.getY(),125, 50,50);
  text((float)ship.getPointDirection(), 200, 50, 50);
  text("pew pew",20,25);
}
public void mouseToDirection(int x, int y) { 
     ship.setPointDirection(60*atan2(y-ship.getY(),x-ship.getX()));
}
public void keyPressed()
{
  switch (key) {
    case ('w'):
    shipacc = true;
    break;
    case ('s'):
    shipbcc = true;
    break;
    case ('d'):
    pewpew.add(new Bullet(ship));
    break;
    case (' '): 
    ship.setX((int)(Math.random()*800));
    ship.setY((int)(Math.random()*800));
    ship.setDirectionX(0);
    ship.setDirectionY(0);
    ship.setPointDirection((int)(Math.random()*360));
  }
}
public void keyReleased() {
  switch (key) {
    case ('w'):
    shipacc = false;
    break;
    case ('s'):
    shipbcc = false;
    break;
  }
}
class Asteroid extends Floater
{
    
      private int aRotate;
    public void setX(int x) {myCenterX = x;} 
    public int getX() {return (int)myCenterX;}   
    public void setY(int y) {myCenterY = y;}   
    public int getY(){return (int)myCenterY;}   
    public void setDirectionX(double x) {myDirectionX = x;} 
    public double getDirectionX() {return myDirectionX;}  
    public void setDirectionY(double y) {myDirectionY = y;}
    public double getDirectionY() {return myDirectionY;}
    public void setPointDirection(double degrees) {myPointDirection = degrees;}
    public double getPointDirection() {return myPointDirection;}

    public Asteroid()
    {
    myColor = color(81, 74, 74);
      
      corners = 14;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -1;
      yCorners[0] = 7;
      xCorners[1] = 2;
      yCorners[1] = 2;
      xCorners[2] = 4;
      yCorners[2] = 8;
      xCorners[3] = 7;
      yCorners[3] = 6;
      xCorners[4] = 10;
      yCorners[4] = 4;
      xCorners[5] = 13;
      yCorners[5] = -1;
      xCorners[6] = 14;
      yCorners[6] = -5;
      xCorners[7] = 10;
      yCorners[7] = -12;
      xCorners[8] = 5;
      yCorners[8] = -12;
      xCorners[9] = 2;
      yCorners[9] = -15;
      xCorners[10] = -4;
      yCorners[10] = -13;
      xCorners[11] = -9;
      yCorners[11] = -14;
      xCorners[12] = -13;
      yCorners[12] = -12;
      xCorners[13] = -15;
      yCorners[13] = -6;
      myCenterX = (int)(Math.random()*800);
      myCenterY = (int)(Math.random()*800);
      aRotate = (int)((Math.random()*8)-3);
    
  
    }
    public void move()
    {
      rotate(aRotate);
      super.move();
      myCenterX += Math.cos(aRotate);
      myCenterY += Math.sin(aRotate);
    }

}
