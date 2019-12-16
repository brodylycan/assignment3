class Lane extends Rectangle {

  
  //calling the obstacle array to use within the lanes
  
  Obstacle[] obstacles;
  int col;
  int type;
   int col1;
  int col2;

 
  //creating the variables for the safe lanes
  
  Lane(int index, color c) {
    super(0, index*grid, width, grid);
    type = SAFETY;
    obstacles = new Obstacle[0];
    col = c;
  }

 //creating the varibles for the log and car lanes
  
  
  Lane(int index, int t, int n, int len, float spacing, float speed, color r, color g, color b) {
    super(0, index*grid, width, grid);
    obstacles = new Obstacle[n];
    type = t;
    col = r;
    col1 = g;
    col2 = b;
    float offset = random(0, 200);
    for (int i = 0; i < n; i++) {
      obstacles[i] = new Obstacle(offset + spacing * i, index*grid, grid*len, grid, speed, type);
    }
    col = color(0, 255, 50);
    noStroke();
  }

//check for frog intersection with obstacles within the lanes

  void check(Frog frog) {
    if (type == CAR) {
      for (Obstacle o : obstacles) {
        if (frog.intersects(o)) {
          resetGame();
        }
      }
    } else if (type == LOG) {
      boolean ok = false;
      for (Obstacle o : obstacles) {
        if (frog.intersects(o)) {
          ok = true;
          frog.attach(o);
        }
      }
      if (!ok) {
        resetGame();
      }
    }
  }

  
  //function to color and draw the lanes
  
  void run() {
    fill(col,col1,col2);
    rect(x, y, w, h);
    for (Obstacle o : obstacles) {
      o.show();
      o.update();
    }
  }
}
