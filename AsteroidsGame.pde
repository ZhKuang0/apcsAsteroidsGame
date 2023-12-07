SpaceShip ship;
Stars [] star;
ArrayList <Asteroid> fallingrocks = new ArrayList <Asteroid>();
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
  
  for(int i = 0; i < star.length; i++)
    {
      star[i].show();
    }

  for(int i = 0; i < roids.size(); i++)
  {
    roids.get(i).show();
    roids.get(i).move();
  }

 
public void keyPressed()
{
  if (key == ' ')
  {
    bob.add(new Bullet(ship));
  }
  if (key == 'w')
  {
    ship.accelerate(.2);
  }
  if (key == 's')
  {
    ship.accelerate(-.2);
  }
  if (key == 'a')
  {
    ship.rotate(-12);
  }
  if (key == 'd')
  {
    ship.rotate(12);
  }
  if (key == 'h')
  {
    ship.setX((int)(Math.random()*800));
    ship.setY((int)(Math.random()*800));
    ship.setDirectionX(0);
    ship.setDirectionY(0);
    ship.setPointDirection((int)(Math.random()*360));
  }
}
