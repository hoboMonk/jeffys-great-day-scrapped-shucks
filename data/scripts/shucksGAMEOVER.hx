var sfx:FlxSound = FlxG.sound.play(Paths.sound("shucks_gameover"));
var scarysfx:FlxSound = FlxG.sound.play(Paths.sound("scary_sfx"));

var deathText:FlxText = new FlxText(0, 0, 0, "you died", 20);
deathText.setFormat(Paths.font("A Box For.ttf"), 120, FlxColor.WHITE);
deathText.alpha = 0;

function create(e) {
    e.cancel();
    sfx.play();
    scarysfx.play();
    scarysfx.pitch = 0.6;
    deathText.scrollFactor.set();
    deathText.screenCenter();
    deathText.scale.set(0.75, 0.75);
    add(deathText);

    FlxG.camera.flash(FlxColor.RED, 4);

    new FlxTimer().start(18, function(){
        FlxTween.tween(deathText, {alpha: 1}, 6, {ease: FlxEase.linearIn});
        FlxTween.tween(deathText.scale, {x: 1, y: 1}, 6, {ease: FlxEase.cubeOut});
    });

    new FlxTimer().start(24, function(){
    FlxG.switchState(new PlayState());
    });
}