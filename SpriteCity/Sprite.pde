public class Sprite {
  float x;
  float y;
  float px; //previous x position.
  float py; //previous y position.
  float vx;
  float vy;
  float ax;
  float ay;
  float w;
  float h;
  PImage sprite;
  float rotation;
  boolean inBounds = true;
  boolean inView = true;
  //boolean destroy;

  Sprite () {
    setup();
  }

  Sprite (float x, float y, float w, float h, String fileName) {
    setup();
    initialize(x, y, w, h, fileName);
  }

  void initialize(float x, float y, float w, float h, String fileName) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.sprite = loadImage(fileName);
  }

  void setSprite(String fileName) {
    this.sprite = loadImage(fileName);
  }

  void setup() {
    spritesToAdd.add(this);
  }
  
  void delete() {
    spritesToDelete.add(this);
  }

  void update() {
    //Update position.
    px = x;
    py = y;
    x += vx;
    y += vy;

    //Update velocity.
    vx += ax;
    vy += ay;
  }

  void draw() {
    pushMatrix();
    translate(x + w/2, y + h/2);
    rotate(rotation);
    translate(-w/2, -h/2);

    if (sprite != null) {
      if (w > 0 && h > 0) {
        image(sprite, 0, 0, w, h);
      } else {
        image(sprite, 0, 0);
      }
    } else {
      fill(255, 0, 255); //pink
      if (w > 0 && h > 0) {
        rect(0, 0, w, h);
      } else {
        rect(0, 0, 100, 100);
      }
    }
    popMatrix();
  }

  void checkCollision() {
    for (Sprite otherSprite : spriteList) {
      if (y + h > otherSprite.y && //this bottom > other top
      y < otherSprite.y + otherSprite.h && //this top < other bottom
      x < otherSprite.x + otherSprite.w && //this left < other right
      x + w > otherSprite.x) //this right > other left
      {
        doCollision(otherSprite);
      }
    }
  }

  void doCollision(Sprite otherSprite) {
    //Does nothing at this level.
  }

  void checkInView() {
    inView = true;

    if (x < -width) {
      inView = false;
    } else if (x > width) {
      inView = false;
    } else if (y < -height) {
      inView = false;
    } else if (y > height) {
      inView = false;
    }
  }

  void checkInBounds() {
    inBounds = true;

    if (x < 0) {
      inBounds = false;
    } else if (x > width - w) {
      inBounds = false;
    } else if (y < 0) {
      inBounds = false;
    } else if (y > height - h) {
      inBounds = false;
    }

    if (!inBounds) {
      forceInBounds();
    }
  }

  void forceInBounds() {
    //Check if out of left side of window.
    if (x < 0) {
      x = 0;
    } 

    //Check if out of right side of window.
    if (x > width - w) {
      x = width - w;
    } 

    //Check if out of top of window.
    if (y < 0) {
      y = 0;
    } 

    //Check if out of bottom of window.
    if (y > height - h) {
      y = height - h;
    }
  }
}