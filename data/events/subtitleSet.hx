import flixel.text.FlxText.FlxTextBorderStyle;
import openfl.text.TextField;

public var subtitle = new FunkinText(0, 490, 0, "", 40);
public var subBG = new FunkinSprite(0, 495).makeSolid(100, 56, FlxColor.BLACK);
subtitle.setFormat(Paths.font("Arial Black.ttf"), 40, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);

function postCreate(){
    if(FlxG.save.data.subtitles)  {
    var subCam = new HudCamera();
    subtitle.camera = subBG.camera = subCam;
    subCam.bgColor = 0x00000000;
    FlxG.cameras.add(subCam, false);
    subtitle.borderSize = 3;
    subBG.alpha = 0;
    add(subBG);
    add(subtitle);
    }
}

function onEvent(eventEvent) {

    if (eventEvent.event.name == "subtitleSet" && FlxG.save.data.subtitles) {
        for (a in [subtitle, subBG]) {
            FlxTween.cancelTweensOf(a, ['alpha']);
            FlxTween.cancelTweensOf(a.scale);
        }
        subtitle.scale.set(1.05, 1.05);
        FlxTween.tween(subtitle.scale, {x: 1, y: 1}, 0.5, {ease: FlxEase.circOut});
        subtitle.alpha = 1;
        subBG.alpha = 0.5;
        subtitle.text = eventEvent.event.params[0];
        subtitle.color = eventEvent.event.params[1];
        subBG.scale.x = subtitle.fieldWidth + 35;
        for (a in [subtitle, subBG]) a.screenCenter(FlxAxes.X);
        FlxTween.tween(subBG.scale, {x: subtitle.fieldWidth + 15}, 0.5, {ease: FlxEase.circOut});
    }
}