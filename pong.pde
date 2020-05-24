/*
  Игра Pong
 */
final int SCORE_TEXT_SIZE = 120;
final int MENU_STATE  = 0;
final int GAME_STATE  = 1;
final int PAUSE_STATE = 2;
final int VICTORY_STATE = 3;

final int BALL_SIZE = 30;
final int HALF_BALL_SIZE = BALL_SIZE / 2;

int ballX;
int ballY;
int ballDX = 10;
int ballDY = 10; 

// paddles

final int PADDLES_WIDTH = 30;
final int PADDLES_HEIGHT = 120;
final int PADDLES_HALF_WIDTH = PADDLES_WIDTH / 2;
final int PADDLES_HALF_HEIGHT = PADDLES_HEIGHT / 2;

int leftPaddleX; 
int leftPaddleY;
int leftPaddleDY = 5;

int rightPaddleX;
int rightPaddleY;
int rightPaddleDY = 5;

// score

final int SCORE_MARGIN_TOP = 100;
final int SCORE_MARGIN_SIDE = 200;

int leftPlayerScore = 0;
int rightPlayerScore = 0;

void setup() {
  fullScreen();
  background(0);
  noStroke();
  rectMode(CENTER);
  
  // ball
  
  ballX = width / 2;
  ballY = height / 2;
  
  //Paddle
  leftPaddleX = PADDLES_HALF_WIDTH;
  rightPaddleX = width - PADDLES_HALF_WIDTH;
  leftPaddleY = rightPaddleY = height / 2;
}
 
void draw() {
  background(0);
  

  // ball
  
  fill(128, 100, 242);
  rect(ballX, ballY, BALL_SIZE, BALL_SIZE);
  
  ballX += ballDX;
  ballY += ballDY;
  
  if (ballX - HALF_BALL_SIZE >= width) {
    leftPlayerScore++;
    ballX = width / 2;
    ballY = height / 2;
    ballDX *= -1;
  }
  if(ballX + BALL_SIZE < 0) {
    rightPlayerScore++;
    ballX = width / 2;
    ballY = height / 2;
    ballDX *= -1;  
  }
  if (ballY + HALF_BALL_SIZE >= height || ballY - HALF_BALL_SIZE < 0) {
    ballDY *= -1;
  }
 
  // paddles
  
  rect(leftPaddleX, leftPaddleY, PADDLES_WIDTH, PADDLES_HEIGHT);
  rect(rightPaddleX, rightPaddleY, PADDLES_WIDTH, PADDLES_HEIGHT);
  
  if (keyPressed) {
    if(keyCode == UP) {
      leftPaddleY -= leftPaddleDY;
      rightPaddleY -= rightPaddleDY;
      if (leftPaddleY - PADDLES_HALF_HEIGHT < 0) {
        leftPaddleY = PADDLES_HALF_HEIGHT;
      }
      if (rightPaddleY - PADDLES_HALF_HEIGHT < 0) {
        rightPaddleY = PADDLES_HALF_HEIGHT;
      }
    } else if (keyCode == DOWN) {
     leftPaddleY += leftPaddleDY;
     rightPaddleY += rightPaddleDY;
     if (leftPaddleY + PADDLES_HALF_HEIGHT > height) {
        leftPaddleY = height - PADDLES_HALF_HEIGHT;
      }
     if (rightPaddleY + PADDLES_HALF_HEIGHT > height) {
        rightPaddleY = height - PADDLES_HALF_HEIGHT;
      }
    }
  } 
  
  // collision detection
  if (abs(ballX - leftPaddleX) < PADDLES_HALF_WIDTH + HALF_BALL_SIZE &&
      abs(ballY - leftPaddleY) < PADDLES_HALF_HEIGHT + HALF_BALL_SIZE ||
      abs(ballX - rightPaddleX) < PADDLES_HALF_WIDTH + HALF_BALL_SIZE &&
      abs(ballY - rightPaddleY) < PADDLES_HALF_HEIGHT + HALF_BALL_SIZE) {
    ballDX *= -1;
  }     
  
  // score
   
  textSize(SCORE_TEXT_SIZE);
  textAlign(CENTER, CENTER);
  text(leftPlayerScore, SCORE_MARGIN_SIDE,SCORE_MARGIN_TOP);
  text(rightPlayerScore, width -SCORE_MARGIN_SIDE, SCORE_MARGIN_TOP);
}


 
 
