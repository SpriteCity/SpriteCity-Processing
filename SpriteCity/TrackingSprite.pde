public class TrackingSprite extends Sprite {
  float speed;
  Sprite targetSprite;

  void setup() {
    super.setup();

    speed = 5;
  }

  void update() {
    super.update();

    moveTowardsTarget();
  }

  void moveTowardsTarget() {
    if (targetSprite != null)
    {
      float changeInX = (targetSprite.x + targetSprite.w/2) - (x + w/2);
      float changeInY = (targetSprite.y + targetSprite.h/2) - (y + h/2);

      float newSpeed = max(abs(changeInX), abs(changeInY));

      float ratio = 0;
      if (newSpeed > 1) {
        ratio = speed / newSpeed;
      }

      if (ratio >= 1) {
        ratio = 1;
      }

      vx = changeInX * ratio;
      vy = changeInY * ratio;
    }
  }
}

