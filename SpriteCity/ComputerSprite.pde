class ComputerSprite extends Sprite {
  float speed = 5;
  float timeSinceDecision = 0;
  float decisionFrequency = 1;

  void setup() {
    super.setup();

    destroyedByBullet.add(this);
  }

  void doCollision(Sprite otherSprite) {
    if (otherSprite == keyMoveSprite || otherSprite == shootySprite || otherSprite == noStopSprite) {
      otherSprite.delete();
    }
  }

  void update() {
    super.update();

    if (timeSinceDecision > decisionFrequency) {
      move();
    } else {
      timeSinceDecision += timeSinceLastUpdate;
    }
  }

  void move() {
    vx = random(-speed, speed);
    vy = random(-speed, speed);
    timeSinceDecision = 0;
  }
}

