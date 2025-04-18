{/* <style> body { background-color:#ccc; } </style>
<script src="//cdnjs.cloudflare.com/ajax/libs/p5.js/0.5.7/p5.js"></script>
<script type="text/javascript"> */}
function setup() {
  createCanvas(512, 512);
  background(255);
}
let x0 = -1;
let y0 = -1;
let x1 = -1;
let y1 = -1;

function mousePressed() {
  x0 = mouseX;
  y0 = mouseY;
}

function mouseDragged() {  
  x1 = mouseX;
  y1 = mouseY;  
  background(255);
  noStroke();
  fill('red');
  ellipse(x0 - 3, y0 - 3, 6);
  fill('green');  
  ellipse(x1 - 3, y1 - 3, 6);
}

function mouseReleased() {
  background(255);
  loadPixels();
  draw_line();
  updatePixels();
}

function set_pixel(x, y, c) {
  let idx = (y * 512 + x) * 4;
  pixels[idx] = c;
  pixels[idx + 1] = c;
  pixels[idx + 2] = c;
  pixels[idx + 3] = 255;
}

function draw_line() {
  let dx = x1 - x0;
  let dy = y1 - y0;
  let a = dy / dx;
  let b = y0 - a * x0;

  if (x0 > x1) {
    [x0, x1] = [x1, x0];
    [y0, y1] = [y1, y0];
    dx = x1 - x0;
    dy = y1 - y0;
    a = dy / dx;
    b = y0 - a * x0;
  }

  for (let x = x0; x <= x1; x++) {
    let y = a * x + b;

    if (x >= 0 && x < 512 && y >= 0 && y < 512) {
      set_pixel(Math.round(x), Math.round(y), 0);
    }
  }
}

// </script>
