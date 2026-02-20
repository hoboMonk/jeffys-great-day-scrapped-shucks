import flixel.addons.display.FlxBackdrop;

function create() {
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