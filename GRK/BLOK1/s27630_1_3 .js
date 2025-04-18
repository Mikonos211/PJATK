function setup() {
  createCanvas(800, 600);
}
 
function draw() {
  background(0); 
  for (y = 0; y < height; y++) {
    for (x = 0; x < width; x++) {
     normalized = (x + y) / (width + height);
     blue = normalized * 255;;
     
     Xdis = x - width / 2;
     Ydis = y - height / 2;
     
     d = sqrt(Xdis*Xdis+Ydis*Ydis)
     green = d;
     red = 255 - d;
     
     pixelColor = color(red, green, blue);
      set(x, y, pixelColor);
    }
  }
  updatePixels(); 
}