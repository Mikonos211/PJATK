{/* <style> body { background-color:#ccc; } </style>
<script src="//cdnjs.cloudflare.com/ajax/libs/p5.js/0.5.7/p5.js"></script>
<script type="text/javascript"> */}
var x0 = -1;
var y0 = -1;
var x1 = -1;
var y1 = -1;

function setup() {
    createCanvas(512, 512);
    pixelDensity(1);
    background(255);
}

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
    drawLine();
    updatePixels();
}

function setPixelColor(x, y, color) {
    let idx = Math.round((y * width + x) * 4);
    pixels[idx] = color;
    pixels[idx + 1] = color;
    pixels[idx + 2] = color;
    pixels[idx + 3] = 255;
}

function drawLine() {
    let dx = Math.abs(x1 - x0);
    let dy = Math.abs(y1 - y0);

    let sx = (x0 < x1) ? 1 : -1;
    let sy = (y0 < y1) ? 1 : -1;

    let swap = false;

    if (dy > dx) {
        [x0, y0] = [y0, x0];
        [x1, y1] = [y1, x1];
        [dx, dy] = [dy, dx];
        swap = true;
    }

    let d = 2 * dy - dx;
    let y = y0;

    for (let x = x0; x != x1; x += sx) {
        if (swap) {
            setPixelColor(y, x, 0);
        } else {
            setPixelColor(x, y, 0);
        }

        if (d > 0) {
            y += sy;
            d -= 2 * dx;
        }
        d += 2 * dy;
    }
}


// </script>
