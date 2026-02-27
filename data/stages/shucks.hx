import flixel.addons.display.FlxBackdrop;
import openfl.display.BlendMode;

function create() {
for (e in [shadow, light, bg, strumLines.members[0].characters[0], strumLines.members[0].characters[2], strumLines.members[1].characters[0], strumLines.members[1].characters[2], strumLines.members[2].characters[0]]) {
    e.alpha = 0;
}
light.blend = BlendMode.ADD;
photos = new FlxBackdrop().loadGraphic(Paths.image('stages/shucks/photoos'));
wall = new FunkinSprite().loadGraphic(Paths.image('stages/shucks/tempRUN'));
photos.repeatAxes = 0x01;
photos.alpha = 0;
wall.alpha = 0;
wall.x = -1100;
wall.y = -100;
}

function beatHit(curBeat:Int) {
    switch (curBeat) {
        case 30:
        FlxTween.tween(strumLines.members[1].characters[2], {alpha: 1}, 7, {ease: FlxEase.cubeInOut});
        case 54:
        FlxTween.tween(strumLines.members[0].characters[2], {alpha: 1}, 4, {ease: FlxEase.cubeInOut});
        case 124:
        FlxTween.tween(strumLines.members[0].characters[2], {alpha: 0}, 0.7, {ease: FlxEase.cubeIn});
        FlxTween.tween(strumLines.members[1].characters[2], {alpha: 0}, 0.7, {ease: FlxEase.cubeIn});
        case 127:
        for (e in [shadow, light, bg, strumLines.members[0].characters[0], strumLines.members[1].characters[0], strumLines.members[2].characters[0]]) {
            FlxTween.tween(e, {alpha: 1}, 0.2, {ease: FlxEase.cubeOut});  
        }   
        case 1072:
        FlxG.state.insert(2, photos);
        FlxG.state.insert(1, wall);
        photos.alpha = 1;
        wall.alpha = 1;
        FlxTween.tween(photos, {x: 2000000}, 999, {ease: FlxEase.linearIn});
        remove(bg);
        remove(light);
        remove(shadow);
        FlxG.state.insert(3, placeholder);
    }
}