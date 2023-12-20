public class Bullets extends Floater{


  private double dRadians;
  
  Bullets (SpaceShip theShip) {
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    myPointDirection = theShip.getPointDirection();


    dRadians = myPointDirection*(Math.PI/180);;


    myDirectionX = 30 * Math.cos(dRadians) + theShip.getDirectionX();
    myDirectionY = 30 * Math.sin(dRadians) + theShip.getDirectionY();


    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];


    xCorners[0] = -5;
    yCorners[0] = 1;
    xCorners[1] = -5;
    yCorners[1] = -1;
    xCorners[2] = 5;
    yCorners[2] = -1;
    xCorners[3] = 5;
    yCorners[3] = 1;


    myColor = color(255, 0, 0); 
  }


    public void setX(int x) {
    myCenterX = x;
  };  


   public int getX() {
    return (int)myCenterX;
  };   


   public void setY(int y) {
    myCenterY = y;
  };   


   public int getY() {
    return (int)myCenterY;
  };   


   public void setDirectionX(double x) {
    myDirectionX = x;
  };   


   public double getDirectionX() {
    return myDirectionX;
  };   


  public void setDirectionY(double y) {
    myDirectionY = y;
  };   


  public double getDirectionY() {
    return myDirectionY;
  };   


  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  };   
  
  public double getPointDirection() {
    return myPointDirection;
  }; 


  public void move () {
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;
  }
}
