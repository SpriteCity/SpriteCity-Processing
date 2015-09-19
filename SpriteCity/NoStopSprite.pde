public class NoStopSprite extends Sprite {
  float speed;

  void setup() {
    super.setup();

    speed = 10;
  }

  void keyPressed() {
    if (key == CODED) {
      if (keyCode == UP) {
        vy = -speed;
        vx = 0;
      } else if (keyCode == DOWN) {
        vy = speed;
        vx = 0;
      } else if (keyCode == LEFT) {
        vx = -speed;
        vy = 0;
      } else if (keyCode == RIGHT) {
        vx = speed;
        vy = 0;
      }
    }
  }
}
