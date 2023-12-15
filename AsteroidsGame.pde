SpaceShip ship;
Stars [] star;
ArrayList <Asteroid> fallingrocks = new ArrayList <Asteroid>();
private boolean shipacc, shipdcc;
public void setup() 
{
  size(1000,1000);
  ship = new SpaceShip();
  star = new Stars[100];
  for(int i = 0; i < star.length; i++)
    {
      star[i] = new Stars();
    }
    for(int i = 0; i < 20; i++)
    {
      fallingrocks.add(new Asteroid());
    }

}
public void draw() 
{
  background(0);
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
  }
  if (shipacc == true) 
  ship.accelerate(0.2);
  if (shipdcc == true)
  ship.accelerate(-0.2);
}
 
public void keyPressed()
{
  switch (key) {
    case ('w'):
    shipacc = true;
    break;
    case ('s'):
    shipdcc = true;
    break;
  }
  if (key == 'a')
  {
    ship.turn(-12);
  }
  if (key == 'd')
  {
    ship.turn(12);
  }
  if (key == ' ')
  {
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
    shipdcc = false;
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
    public void setPointDirection(int degrees) {myPointDirection = degrees;}
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
