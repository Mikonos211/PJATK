{/* <style> body { background-color:#ccc; } </style>
<script src="//cdnjs.cloudflare.com/ajax/libs/p5.js/0.5.7/p5.js"></script>
<body oncontextmenu="return false;">
<script type="text/javascript"> */}
function setup() {
    createCanvas(512, 512); 
    background(255);       
}

let last_x = -1;
let last_y = -1;

function mouseDragged() {
    if (mouseButton !== LEFT) return; 
    if (last_x > 0) {
        line(last_x, last_y, mouseX, mouseY); 
    }
    last_x = mouseX;
    last_y = mouseY;
}

function mouseReleased() {
    last_x = last_y = -1; 

    if (mouseButton === RIGHT) {
        loadPixels();            
        flood_fill(mouseX, mouseY); 
        updatePixels();         
    }
}

function set_pixel(x, y, c) {
    let idx = (Math.round(y) * width + Math.round(x)) * 4; 
    pixels[idx] = c;        
    pixels[idx + 1] = c;  
    pixels[idx + 2] = c;  
    pixels[idx + 3] = 255; 
}

function get_pixel(x, y) {
    let idx = (Math.round(y) * width + Math.round(x)) * 4; 
    return pixels[idx];
}

function flood_fill(x, y) {
    let stos = []; 
    stos.push([x, y]); 

    while (stos.length > 0) {
        let [currX, currY] = stos.pop(); 

        if (currX < 0 || currX >= width || currY < 0 || currY >= height) {
            continue;
        }

        let currentColor = get_pixel(currX, currY);
        if (currentColor !== 255) { 
            continue;
        }

        set_pixel(currX, currY, 0);

        stos.push([currX + 1, currY]);
        stos.push([currX - 1, currY]); 
        stos.push([currX, currY + 1]); 
        stos.push([currX, currY - 1]); 
    }
}
// </script>
// </body>