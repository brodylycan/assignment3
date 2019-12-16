class Frog extends Rectangle {

  Obstacle attached = null;

 //sets variales for frog
  
  
  Frog(float x, float y, float w) {
    super(x, y, w, w);
  }

  
  //function to attach frogs to log
  
  void attach(Obstacle log) {
    attached = log;
  }

  
  //updates movemnt of frog
  
  
  void update() {
    if (attached != null) {
      x += attached.speed;
    }

    x = constrain(x, 0, width-w);
  }

 //displays frog image
  
  void show() {
    fill(0, 255, 0, 200);
    image(ribbit, x, y, w, w);
  }

 //moves the frog in accordance of the grid
  
  
  void move(float xdir, float ydir) {
    x += xdir * grid;
    y += ydir * grid;
    attach(null);
  }
}
