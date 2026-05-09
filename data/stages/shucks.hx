import flixel.addons.display.FlxBackdrop;
import openfl.display.BlendMode;

function create() {
for (e in [shadow, light, bg, strumLines.members[0].characters[0], strumLines.members[0].characters[2], strumLines.members[1].characters[0], strumLines.members[1].characters[2], strumLines.members[2].characters[0]]) {
    e.alpha = 0;
}
light.blend = BlendMode.ADD;
photos = new FlxBackdrop().loadGraphic(Paths.image('stages/shucks/photoos'));
wall = new FunkinSprite().loadGraphic(Paths.image('stages/shucks/tempRUN'));
whiteBg = new FunkinSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
whiteBg.scrollFactor.set(0, 0);
whiteBg.zoomFactor = whiteBg.alpha = photos.alpha = wall.alpha = 0;
photos.repeatAxes = 0x01;
wall.x = -1100;
wall.y = -100;
FlxG.state.insert(3, whiteBg);

strumLines.members[0].characters[0].visible = strumLines.members[0].characters[1].visible = strumLines.members[1].characters[0].visible = strumLines.members[1].characters[1].visible = false;
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
        strumLines.members[0].characters[0].visible = strumLines.members[1].characters[0].visible = true;
        strumLines.members[0].characters[2].visible = strumLines.members[1].characters[2].visible = false;
        case 688:
        for (a in [dad, boyfriend]) FlxTween.color(a, 0.8, FlxColor.WHITE, FlxColor.BLACK, {ease: FlxEase.linear});
        FlxTween.tween(whiteBg, {alpha: 1}, 0.8, {ease: FlxEase.linear});  
        case 744:
        for (a in [dad, boyfriend]) FlxTween.color(a, 1, FlxColor.BLACK, FlxColor.WHITE, {ease: FlxEase.linear});
        FlxTween.tween(whiteBg, {alpha: 0}, 1, {ease: FlxEase.linear});  
        case 1068:
        FlxTween.tween(boyfriend, {x: -400}, 1.4, {ease: FlxEase.cubeIn});
        case 1072:
        FlxTween.tween(strumLines.members[0].characters[1], {x: 400}, 2.8, {ease: FlxEase.cubeOut});
        FlxTween.tween(strumLines.members[1].characters[1], {x: -1370}, 2.8, {ease: FlxEase.cubeOut});
        strumLines.members[0].characters[0].visible = strumLines.members[1].characters[0].visible = false;
        strumLines.members[0].characters[1].visible = strumLines.members[1].characters[1].visible = true;
        FlxG.state.insert(2, photos);
        FlxG.state.insert(1, wall);
        photos.alpha = wall.alpha = 1;
        photos.velocity.x = 2100;
        remove(bg);
        remove(light);
        remove(shadow);
        case 1198:
        FlxTween.tween(strumLines.members[0].characters[1], {x: -100}, 0.62, {ease: FlxEase.circIn});
    }
}