public class KeyMoveSprite extends Sprite {

  float speed;

  void setup() {
    super.setup();

    speed = 10;
  }

  void keyPressed() {
    if (key == CODED) {
      if (keyCode == UP) {
        vy = -speed;
      } else if (keyCode == DOWN) {
        vy = speed;
      } else if (keyCode == LEFT) {
        vx = -speed;
      } else if (keyCode == RIGHT) {
        vx = speed;
      }
    }
  }

  void keyReleased() {
    if (key == CODED) {
      if (keyCode == UP && vy < 0) {
        vy = 0;
      } else if (keyCode == DOWN && vy > 0) {
        vy = 0;
      } else if (keyCode == LEFT && vx < 0) {
        vx = 0;
      } else if (keyCode == RIGHT && vx > 0) {
        vx = 0;
      }
    }
  }
}
