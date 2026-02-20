import flixel.text.FlxText.FlxTextBorderStyle;
import openfl.text.TextField;

public var subtitle:FlxText = new FlxText(0, 0, 0, "", 55);
public var subBG = new FunkinSprite(0, 0).makeSolid(100, 50, FlxColor.BLACK);
var subCam:FlxCamera;
subtitle.setFormat(Paths.font("Arial Black.ttf"), 35, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);

function postCreate(){
    if(FlxG.save.data.subtitles)  {
    subCam= new HudCamera();
    subCam.bgColor = 0x00000000;
    FlxG.cameras.add(subCam, false);
    subtitle.camera = subCam;
    subtitle.borderSize = 3;

    subBG.alpha = 0; 
    subBG.scrollFactor.set();
    subBG.camera = subCam;
    subBG.screenCenter();
    subBG.y = 494;
    }
}

function onEvent(eventEvent) {

    if (eventEvent.event.name == "subtitleSet" && FlxG.save.data.subtitles) {
        remove(subtitle);
        FlxTween.cancelTweensOf(subtitle, ['alpha']);
        FlxTween.cancelTweensOf(subtitle.scale);
        FlxTween.cancelTweensOf(subBG, ['alpha']);
        FlxTween.cancelTweensOf(subBG.scale);
        subtitle.scale.set(1.05, 1.05);
        subtitle.alpha = 1;
        subBG.alpha = 0.5;
        FlxTween.tween(subtitle.scale, {x: 1, y: 1}, 0.5, {ease: FlxEase.cubeOut});
        subtitle.text = eventEvent.event.params[0];
        subtitle.color = eventEvent.event.params[1];
        FlxG.state.insert(1, subBG);
        add(subtitle);
        subBG.scale.x = subtitle.fieldWidth + 50;
        subBG.scale.x = subBG.scale.x * 1.05;
        FlxTween.tween(subBG.scale, {x: subBG.scale.x * 0.95}, 0.5, {ease: FlxEase.cubeOut});
        subtitle.screenCenter();
        subtitle.y = 490;
    }
}