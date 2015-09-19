public class ShootySprite extends Sprite {
  //Arrow keys
  boolean upKeyDown = false;
  boolean downKeyDown = false;
  boolean leftKeyDown = false;
  boolean rightKeyDown = false;

  float speed;
  float projectileSpeed;
  float timeSinceShoot;
  float shootFrequency;
  float bulletWidth;
  float bulletHeight;

  void setup() {
    super.setup();

    speed = 10;
    projectileSpeed = 20;
    timeSinceShoot = shootFrequency + 1;
    shootFrequency = .2;
    bulletWidth = w;
    bulletHeight = h;
  }

  void update() {
    super.update();

    shoot();
  }

  void keyPressed() {
    if (key == CODED) {
      if (keyCode == UP) {
        upKeyDown = true;
      } else if (keyCode == DOWN) {
        downKeyDown = true;
      } else if (keyCode == LEFT) {
        leftKeyDown = true;
      } else if (keyCode == RIGHT) {
        rightKeyDown = true;
      }
    } else {
      if (key == 'w') {
        vy = -speed;
      } else if (key == 's') {
        vy = speed;
      } else if (key == 'a') {
        vx = -speed;
      } else if (key == 'd') {
        vx = speed;
      }
    }
  }

  void keyReleased() {
    if (key == CODED) {
      if (keyCode == UP) {
        upKeyDown = false;
      } else if (keyCode == DOWN) {
        downKeyDown = false;
      } else if (keyCode == LEFT) {
        leftKeyDown = false;
      } else if (keyCode == RIGHT) {
        rightKeyDown = false;
      }
    } else {
      if (key == 'w' && vy < 0) {
        vy = 0;
      } else if (key == 's' && vy > 0) {
        vy = 0;
      } else if (key == 'a' && vx < 0) {
        vx = 0;
      } else if (key == 'd' && vx > 0) {
        vx = 0;
      }
    }
  }

  void shoot() {
    timeSinceShoot += timeSinceLastUpdate;

    if (timeSinceShoot > shootFrequency) {
      if (upKeyDown || downKeyDown || leftKeyDown || rightKeyDown) {
        BulletSprite bulletSprite = new BulletSprite();
        bulletSprite.initialize(x + w/2 - bulletWidth/2, y + h/2 - bulletHeight/2, bulletWidth, bulletHeight, "BulletSprite.png");

        if (upKeyDown) {
          bulletSprite.vy = -projectileSpeed;
        } else if (downKeyDown) {
          bulletSprite.vy = projectileSpeed;
        }

        if (leftKeyDown) {
          bulletSprite.vx = -projectileSpeed;
        } else if (rightKeyDown) {
          bulletSprite.vx = projectileSpeed;
        }

        timeSinceShoot = 0;
      }
    }
  }
}