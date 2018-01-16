class Particle {

  PVector velocity;
  float lifespan = 255;
  color c;
  
  PShape part;
  float partSize;
  
  PVector gravity = new PVector(0,-0.1);


  Particle() {
    partSize = random(10,60);
    part = createShape();
    part.beginShape(QUAD);
    part.noStroke();
    part.texture(sprite);
    part.normal(0, 0, 1);
    part.vertex(-partSize/2, -partSize/2, 0, 0);
    part.vertex(+partSize/2, -partSize/2, sprite.width, 0);
    part.vertex(+partSize/2, +partSize/2, sprite.width, sprite.height);
    part.vertex(-partSize/2, +partSize/2, 0, sprite.height);
    part.endShape();
    
    rebirth(width/2,height/2);
    lifespan = random(255);
    
    int r = (int)random(255);
    int g = (int)random(255);
    int b = (int)random(255);
    c = color(r, g, b);
  }

  PShape getShape() {
    return part;
  }
  
  void rebirth(float x, float y) {
    float a = random(TWO_PI);
    float speed = random(0.5,4);
    velocity = new PVector(cos(a), sin(a));
    velocity.mult(speed);
    lifespan = 255;   
    part.resetMatrix();
    part.translate(x, y); 
  }
  
  boolean isDead() {
    if (lifespan < 0) {
     return true;
    } else {
     return false;
    } 
  }
  

  public void update() {
    lifespan = lifespan - 1;
    velocity.add(gravity);
    
    float d = (float)lifespan / 255.0;
    color cc = color(red(c) * d, green(c) * d, blue(c) * d);
    
    part.setTint(cc);
    part.translate(velocity.x, velocity.y);
  }
}