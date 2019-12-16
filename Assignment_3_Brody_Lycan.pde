
//Initial Global variables

int LIVES_SIZE = 16, FINISH_SIZE = 22, FINISH_LIVES = 0, LIVES_HEIGHT = 50;
Frog frog;
Lane[] lanes;
int lives = 6;
int SAFETY = 0;
int CAR = 1;
int LOG = 2;
PImage car, ribbit, log;
float grid = 50;
PFont f;

void resetGame() {
  frog = new Frog(width/2-grid/2, height-grid, grid);
  frog.attach(null);
  lives --;
}

void setup() {
  size(500, 550);
  
  //loads images
  
  car = loadImage("car.png");
  log = loadImage ("log.png");
  ribbit = loadImage ("ribbit.png");
  
  
  f = createFont("helvetica", 20, true);
  //frog = new Frog(width/2-grid/2, height-grid, grid);
  resetGame();
  int totalLanes = int(height / grid);
  
  //calls the array to create each of the lanes and determine how each one behaves
  
  lanes = new Lane[totalLanes];
  lanes[0] = new Lane(0, color(180,120,80));
  lanes[1] = new Lane(1, LOG, 3, 1, 150, 3,0,0,255);
  lanes[2] = new Lane(2, LOG, 2, 3, 350, -2.5,0,0,255);
  lanes[3] = new Lane(3, LOG, 4, 1, 200, 1,0,0,255);
  lanes[4] = new Lane(4, LOG, 3, 2, 250, -1.7,0,0,255);
  lanes[5] = new Lane(5, color(180,120,80));
  lanes[6] = new Lane(6, CAR, 3, 1, 150, 2.4,60,60,60);
  lanes[7] = new Lane(7, CAR, 2, 2, 150, -3.6,60,60,60);
  lanes[8] = new Lane(8, CAR, 1, 3, 150, 2.3,60,60,60);
  lanes[9] = new Lane(9, CAR, 4, 1, 150, -1,60,60,60);
  lanes[10] = new Lane(10, color(180,120,80));
}

void draw() {
  background(0,255,0);
  for (Lane lane : lanes) {
    lane.run();
  }
  
  //checks the frog with the bounds of the lanes to see when collision occurs
  
  int laneIndex = int(frog.y / grid);
  lanes[laneIndex].check(frog);
  frog.update();
  frog.show();
  //displayLives();
 // displayFinished();
  
 
  
  //if statement to create lives
  
  
  if (lives <= FINISH_LIVES) {

    displayFinished();
  } else {

    displayLives();
  }
  
  if (frog.y <= 25){
    displayWin();
  
  }
}

//global function to create movement of frog


void keyPressed() {

  if (keyCode == UP) {
    frog.move(0, -1);
  } else if (keyCode == DOWN) {
    frog.move(0, 1);
  } else if (keyCode == RIGHT) {
    frog.move(1, 0);
  } else if (keyCode == LEFT) {
    frog.move(-1, 0);
  }}
 
 
 //function to display the lives
 
 void displayLives() {
  textFont(f, LIVES_SIZE);
  fill(0);
  textAlign(CENTER);
  text("Lives left " + lives, width/6, height - LIVES_HEIGHT);
}


//function to indicate losing

void displayFinished() {
  textFont(f, FINISH_SIZE);
  fill(0);
  textAlign(CENTER);
  text("GAME OVER", width/2, height - LIVES_HEIGHT);
}

//function to indicate losing

void displayWin(){
textFont(f, FINISH_SIZE);
  fill(0);
  textAlign(CENTER);
  text("You win!", width/2, height - LIVES_HEIGHT);

}
