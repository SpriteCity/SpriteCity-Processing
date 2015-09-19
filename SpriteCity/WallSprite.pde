public class WallSprite extends Sprite {
  void setup() {
    super.setup();
    destroysBullet.add(this); 
  }
  
  void doCollision(Sprite otherSprite) {
    otherSprite.x = otherSprite.px;
    otherSprite.y = otherSprite.py;
  }
}