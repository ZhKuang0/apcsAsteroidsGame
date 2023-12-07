SpaceShip ship = new SpaceShip();
aStar[] stars;
ArrayList<asteroids> ast = new ArrayList<asteroids>();
boolean Acceleration, Decceleration, Right, Left;

  public void setup() 
  {
    size(1000,700);
    stars = new aStar[200];
    for(int i = 0; i < stars.length; i++){
      stars[i] = new aStar();
    }
    //asteroids
    for(int i = 0; i < 50; i++){
      ast.add(new asteroids());
    }
  }

public void draw() 
{
  background(#514B4B);
  for(int i = 0; i< stars.length; i++){
    stars[i].show();
  }
  if(Acceleration == true){
    ship.accelerate(.15);
    ship.show2();
  }
  ship.move();
  ship.show();
  
  //ships max speed
  if(ship.getDirectionX() > 15)ship.setDirectionX(15);
  if(ship.getDirectionX() < -15)ship.setDirectionX(-15);
  if(ship.getDirectionY() > 15)ship.setDirectionY(15);
  if(ship.getDirectionY() < -15)ship.setDirectionY(-15);
  //array for asteroids 
  for(int i = 0; i < ast.size(); i++){
    ast.get(i).move();
    ast.get(i).show();
     //ship removes asteroid
    if(dist(ship.getX(), ship.getY(), ast.get(i).getX(), ast.get(i).getY()) < 30){
      ast.remove(i);
    }
  }
  if(ast.size() < 15){
    ast.add(new asteroids());
    ast.add(new asteroids());
  }
  //booleans

  if(Decceleration == true){
    ship.setDirectionY(0);
    ship.setDirectionX(0);  
  }
  if(Right == true)ship.rotate(3);
  if(Left == true)ship.rotate(-3);
  
}

  public void keyPressed(){

    if(keyCode == UP){Acceleration =true;}
    if(keyCode == DOWN){Decceleration =true;}
    if(keyCode == RIGHT){Right=true;}
    if(keyCode == LEFT){Left=true;}
    if(keyCode == 72){
      ship.setX((int)(Math.random()*980)+10);
      ship.setY((int)(Math.random()*680)+10);
      ship.setDirectionX(0);
      ship.setDirectionY(0);
      ship.setPointDirection((int)(Math.random()*360));
    }
  }

  //public void keyTyped() {}
  public void keyReleased(){
    if(keyCode == UP){Acceleration =false;}
    if(keyCode == DOWN){Decceleration=false;}
    if(keyCode == RIGHT){Right=false;}
    if(keyCode == LEFT){Left=false;}
    
  }

class SpaceShip extends Floater {   
  public SpaceShip(){
    myCenterX = 500;
    myCenterY = 350;
    corners = 15;
    int[] xCorners = {0,-10,-14,-10,0,10,12,22,20,12,12,12,20,22,12,10};
    int[] yCorners = {14,10,0,-10,-14,-10,-8,-6,-4,-2,2,4,6,8,10};
    myDirectionX=0;
    myDirectionY=0;
    myColor=#ff7b7b ;
}
  public void show2(){
  noStroke();
  fill(#0099e6);
  ellipse((float)(ship.getX()-10*Math.cos(ship.getPointDirection()*(Math.PI/180))),(float)(ship.getY()-10*Math.sin(ship.getPointDirection()*(Math.PI/180))),15,15);
  }
  public void show(){
    stroke(255);
    super.show();
  }
  //setters
  public void setX(int x){myCenterX = x;}   
  public void setY(int y){myCenterY = y;}    
  public void setDirectionX(double x){myDirectionX = (double)x;} 
  public void setDirectionY(double y){myDirectionY = (double)y;}  
  public void setPointDirection(int degrees){myPointDirection = degrees;}  
  //getters 
  public int getY(){return (int)myCenterY;} 
  public int getX(){return (int)myCenterX;}
  public double getDirectionX(){return myDirectionX;}  
  public double getDirectionY(){return myDirectionY;}   
  public double getPointDirection(){return myPointDirection;} 
}

class asteroids extends Floater{
  private int angularspd;
  public asteroids(){
    rotSpeed = (int)(Math.random()*9)-4;
    myCenterX = (int)(Math.random()*1000);
    myCenterY = (int)(Math.random()*700);
    corners = 8;
    int[] xCorners = {-6,6,12,12,6,-6,-12,-12};
    int[] yCorners = {12,12,6,-6,-12,-12,-6,6};
    myDirectionX=Math.random();
    myDirectionY=Math.random();
    myColor=(#d3d3d3); 
    
  }
  public void move(){
    rotate(angularspd);
    super.move();
  }
  //setters
  public void setX(int x){myCenterX = x;}  
  public void setY(int y){myCenterY = y;}   
  public void setDirectionX(double x){myDirectionX = (double)x;} 
  public void setDirectionY(double y){myDirectionY = (double)y;}  
  public void setPointDirection(int degrees){myPointDirection = degrees;}  
  //getters 
  public int getY(){return (int)myCenterY;}  
  public int getX(){return (int)myCenterX;}
  public double getDirectionX(){return myDirectionX;}  
  public double getDirectionY(){return myDirectionY;}   
  public double getPointDirection(){return myPointDirection;} 
}
