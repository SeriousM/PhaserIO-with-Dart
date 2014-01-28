import 'package:js/js.dart' as js;

var ph, game, background, filter;

void main() {
  ph = js.context.Phaser;

  drawWaves();
}

drawWaves() {
  var options = js.map({
    "preload":new js.FunctionProxy(preload),
    "create":new js.FunctionProxy(create),
    "update":new js.FunctionProxy(update)
  });
  game = new js.Proxy(ph.Game, 800, 600, ph.WEBGL, 'phaser-example', options);
}

void preload(p){
  game.load.image('s', 'assets/undersea.jpg');
  game.load.image('phaser', 'assets/phaser.png');
  game.load.script('filter', 'filters/CheckerWave.js');
}

void create(p){
  game.add.sprite(0, 0, 's');

  background = game.add.sprite(0, 0);
  background.width = 800;
  background.height = 600;

  filter = game.add.filter('CheckerWave', 800, 600);
  filter.alpha = 0.2;

  background.filters = js.array([filter]);

  var logo = game.add.sprite(game.world.centerX, 100, 'phaser');
  logo.anchor.setTo(0.5, 0.5);

  drawText_create(null);
}

void update(p){
  filter.update();
}

void drawText_create(p){
  var text = "with a sprinkle of \n pixi dust \n and DART ;D";
  var style = js.map({ "font": "65px Arial", "fill": "#ff0044", "align": "center" });

  var t = game.add.text(game.world.centerX-250, 200, text, style);
}