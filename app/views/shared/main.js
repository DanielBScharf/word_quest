var canvas = document.querySelector('canvas');
var c = canvas.getContext('2d');

canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

var images = [];
var numImages = 3;
var loadedImages = 0;

for (var i = 1; i <= numImages; i++) {
  images[i - 1] = new Image();
  images[i - 1].src = 'Walk (' + i.toString() + ').png';
  images[i - 1].addEventListener('load', function () {
    loadedImages++;
    if (loadedImages === numImages) {
      startAnimation();
    }
  });
}

var sprite1 = document.getElementById('sprite');
var spritePosition = { x: 100, y: 100 };
var i = 0;

function startAnimation() {
  setInterval(function () {
    i++;
    if (i >= numImages) {
      i = 0;
    }
    c.clearRect(0, 0, canvas.width, canvas.height);
    c.drawImage(images[i], spritePosition.x, spritePosition.y, 100, 100);
    sprite1.style.backgroundImage = 'url(' + images[i].src + ')';
  }, 100);
}
