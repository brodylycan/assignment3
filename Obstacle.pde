//creates obstacle class and varibles

class Obstacle extends Rectangle {
  float speed;
  int z;

  
  //creates specific varibles for obstacle
  
  Obstacle(float x, float y, float w, float h, float s, int type) {
    super(x, y, w, h);
    speed = s;
    z = type;
  }

  //updates the movement for the obstacles
  
  void update() {
    x = x + speed;
    if (speed > 0 && x > width+grid) {
      x = -w-grid;
    } else if (speed < 0 && x < -w-grid) {
      x = width+grid;
    }
  }

  
  //an if statement to determine if the obstacle is either a car or a log
  
  void show() {
    fill(200);
    if (z == CAR){
      image(car, x, y, w, h);
  } else if (z == LOG){
  image(log, x, y, w, h);
  
  }
  }}
