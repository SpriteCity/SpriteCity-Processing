class ItemSprite extends Sprite {
  void doCollision(Sprite otherSprite) {
    if (otherSprite == keyMoveSprite || otherSprite == shootySprite || otherSprite == noStopSprite) {
      delete();
      score += 1;
    }
  }
}

