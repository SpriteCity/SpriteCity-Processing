public class BulletSprite extends Sprite {
  void forceInBounds()
  {
    //Do nothing, allow the bulled to leave the screen.
  }

  void update() {
    super.update();
    
    if (mag(vx, vy) > 0.1) {
      rotation = atan2(vy, vx);
    } 

    if (!inView) {
      delete();
    }
  }

  void doCollision(Sprite otherSprite) {
    if (destroyedByBullet.contains(otherSprite))
    {
      otherSprite.delete();
      delete();
    }

    if (destroysBullet.contains(otherSprite))
    {
      delete();
    }
  }
}

