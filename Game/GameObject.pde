public class GameObject {
  PImage image;
  color objColor = color(100, 0, 0);
  double x;
  double y;
  int width;
  int height;

  GameObject(double x, double y, int width, int height) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }

  GameObject(double x, double y, int width, int height, String imageName) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    setImage(imageName);
  }

  void draw() {
    if (image != null) {
      image(image, (int)x, (int)y);
    } else {
      fill(objColor);
      rect((int)x, (int)y, width, height);
    }
  }

  void update() {
  }

  void setColor(int r, int g, int b) {
    r = constrain(r, 0, 255);
    g = constrain(g, 0, 255);
    b = constrain(b, 0, 255);

    objColor = color(r, g, b);
  }

  void setImage(String imageName) {
    image = loadImage(imageName);
    image.resize(width, height);
  }

  public boolean hasGoneOffScreen() {
    if (x > Game.windowWidth || x + this.width < 0 || y > Game.windowHeight || y + this.height < 0) {
      return true;
    }
    return false;
  }
}
