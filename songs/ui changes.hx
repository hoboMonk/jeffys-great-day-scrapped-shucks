import flixel.text.FlxText.FlxTextBorderStyle;

public var timetext:FlxText = new FlxText(592.5, 50, 0, "shhhh", 20);
timetext.setFormat(Paths.font("Arial Black.ttf"), 40, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
timetext.alpha = 0;
timetext.borderSize = 3;

public var healthbarFlip:Bool = false;

PauseSubState.script = "data/states/pause";

public var camOther:HudCamera = new HudCamera();
public var camNote:HudCamera = new HudCamera();
doIconBop = false;

function postCreate()
{
    add(timetext);
    trace(timetext.x);
    FlxG.cameras.insert(camOther, 1, false).bgColor = FlxColor.TRANSPARENT;
    FlxG.cameras.insert(camNote, 1, false).bgColor = FlxColor.TRANSPARENT;
    camNote.downscroll = Options.downscroll;
    camOther.downscroll = Options.downscroll;
    strumLines.members[0].camera = strumLines.members[1].camera = camNote;
    timetext.camera = camOther;
    iconP1.scrollFactor.set(1, 1);
iconP2.scrollFactor.set(1, 1);
updateIconPositions = () -> {
    iconP1.y = 570;
    iconP2.y = 570;
    iconP1.health = healthBar.percent / 100;
    iconP2.health =  1 - (healthBar.percent / 100);
};
}

function beatHit() {
    for (icon in [iconP1, iconP2]) {
        icon.scale.set(0.95, 0.95);
        FlxTween.tween(icon.scale, {x: 0.85, y: 0.85}, (0.5 * (1 / (Conductor.bpm / 100))), {ease: FlxEase.circOut});
    }
}

function postUpdate()
{
    iconP1.x = !healthbarFlip ? 890 : 240;
    iconP2.x = !healthbarFlip ? 230 : 900;
    iconP1.flipX = iconP2.flipX = healthBar.flipX = healthbarFlip;

    camNote.zoomMultiplier = camHUD.zoomMultiplier;
    camNote.zoom = camHUD.zoom;
    camOther.zoomMultiplier = camHUD.zoomMultiplier;
    camOther.zoom = camHUD.zoom;

    if (inst != null && timetext != null) {
        var timeRemain = Std.int((inst.length - Conductor.songPosition) / 1000);
        var min = Std.int(timeRemain / 60);
        var sec = CoolUtil.addZeros(Std.string(timeRemain % 60), 2);
        timetext.text = min + ":" + sec;
    }
}

function onPlayerHit(e) {
    if(e.note.isSustainNote)
        return;

    e.showRating = false;
}

function onSongStart() {
    FlxTween.tween(timetext, {alpha: 1}, 0.5, {ease: FlxEase.cubeOut});
}