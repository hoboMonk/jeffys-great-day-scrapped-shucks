public var camSS:HudCamera = new HudCamera();

var xspeed = 0.5;
var yspeed = 0.5;
var xAdd = -560;
var yAdd = -90;

var screenSaver:FlxText = new FlxText(0, 0, 0, "wip/dev build", 20);
screenSaver.setFormat(Paths.font("basic.ttf"), 80, FlxColor.WHITE);
screenSaver.alpha = 0.15;

function create(){
    FlxG.cameras.insert(camSS, 1, false).bgColor = FlxColor.TRANSPARENT;
    screenSaver.camera = camSS;
    add(screenSaver);
    screenSaver.screenCenter();
}

function postUpdate() {
    screenSaver.x += xspeed;
    screenSaver.y += yspeed;

    if (screenSaver.x == (FlxG.width * 1) + xAdd) {
        xspeed = -xspeed;
        xAdd = 0;
    }
    if (screenSaver.x == (FlxG.width * 0) + xAdd) {
        xspeed = -xspeed;
        xAdd = -560;
    }
    if (screenSaver.y == (FlxG.height * 1) + yAdd) {
        yspeed = -yspeed;
        yAdd = 0;
    }
    if (screenSaver.y == (FlxG.height * 0) + yAdd) {
        yspeed = -yspeed;
        yAdd = -90;
    }
}
