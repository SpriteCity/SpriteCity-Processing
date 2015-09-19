//Variables to track time
float lastUpdateTime;
float timeSinceLastUpdate;

int score;

PImage background;

ArrayList<Sprite> spriteList = new ArrayList<Sprite>(); // all sprites are automatically added to this list.
ArrayList<Sprite> spritesToDelete = new ArrayList<Sprite>(); // add a sprite to this list to delete it.
ArrayList<Sprite> spritesToAdd = new ArrayList<Sprite>(); // add a sprite to this list to delete it.
ArrayList<Sprite> destroyedByBullet = new ArrayList<Sprite>();
ArrayList<Sprite> destroysBullet = new ArrayList<Sprite>();

KeyMoveSprite keyMoveSprite = new KeyMoveSprite();
NoStopSprite noStopSprite = new NoStopSprite();
ShootySprite shootySprite = new ShootySprite();
ComputerSprite computerSprite = new ComputerSprite();
TrackingSprite trackingSprite = new TrackingSprite();
WallSprite wallSprite = new WallSprite();
ItemSprite itemSprite = new ItemSprite();

void setup() {
  size(800, 800);

  background = loadImage("SpriteCityBackground.png");

  initializeSprites();
}

void initializeSprites() {
  keyMoveSprite.initialize(random(width), random(height), 100, 100, "KeyMoveSprite.png");

  noStopSprite.initialize(random(width), random(height), 100, 100, "NoStopSprite.png");

  shootySprite.initialize(random(width), random(height), 100, 100, "ShootySprite.png");
  shootySprite.bulletWidth = 50;
  shootySprite.bulletHeight = 50;

  computerSprite.initialize(random(width), random(height), 100, 100, "ComputerSprite.png");

  trackingSprite.initialize(random(width), random(height), 100, 100, "TrackingSprite.png");
  trackingSprite.targetSprite = keyMoveSprite;

  wallSprite.initialize(random(width), random(height), 100, 100, "WallSprite.png");

  itemSprite.initialize(random(width), random(height), 100, 100, "ItemSprite.png");
}

void update() {
  //Update time variables
  float timeNow = millis() / 1000f;
  timeSinceLastUpdate = timeNow - lastUpdateTime;
  lastUpdateTime = timeNow;

  //Update sprites in our list.
  for (Sprite sprite : spriteList) {
    sprite.update();
    sprite.checkCollision();
    sprite.checkInView();
    sprite.checkInBounds();
  }

  updateSpritesLists();
}

void updateSpritesLists() {
  for (Sprite sprite : spritesToDelete) {
    spriteList.remove(sprite);
    destroyedByBullet.remove(sprite);
    destroysBullet.remove(sprite);
  }
  
  spritesToDelete.clear();

  for (Sprite sprite : spritesToAdd) {
    spriteList.add(sprite);
  }
  
  spritesToAdd.clear();
}

void draw() {
  update();

  drawBackground();

  for (Sprite sprite : spriteList) {
    sprite.draw();
  }

  drawScore();
}

void drawBackground() {
  image(background, 0, 0, width, height); //Draw an image for the background.
}

void drawScore() {
  textSize(32);
  fill(0, 240);
  text("Score: " + score, 12+1, 45+1);  // Specify a z-axis value
  fill(0, 102, 153);
  text("Score: " + score, 12, 45);  // Specify a z-axis value
}

void keyPressed() {
  keyMoveSprite.keyPressed();
  noStopSprite.keyPressed();
  shootySprite.keyPressed();
}

void keyReleased() {
  keyMoveSprite.keyReleased();
  shootySprite.keyReleased();
}