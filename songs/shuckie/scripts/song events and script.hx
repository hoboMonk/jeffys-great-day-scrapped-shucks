import funkin.backend.scripting.Script;

introLength = 0;

GameOverSubstate.script = "data/scripts/shucksGAMEOVER";


test = new CustomShader("ColorCorrection");
if (FlxG.save.data.shaders) {
test.contrast = 30;
test.hue = -10;
test.saturation = -10;
}

var missWarn:FlxText = new FlxText(10, 670, 0, "you've got 15 misses...", 20);
missWarn.setFormat(Paths.font("A Box For 3.ttf"), 120, FlxColor.WHITE);
missWarn.alpha = 0;

var topBlackBar = new FunkinSprite(0, 0).makeSolid(FlxG.width, FlxG.height, FlxColor.BLACK); // hi simpsons
var bottomBlackBar = new FunkinSprite(0, 0).makeSolid(FlxG.width, FlxG.height, FlxColor.BLACK);
topBlackBar.alpha = 0;
bottomBlackBar.alpha = 0;
if (downscroll) {
topBlackBar.y = 570;
bottomBlackBar.y = -530;
} else {
topBlackBar.y = 530;
bottomBlackBar.y = -570;
}

function postCreate()
{
    topBlackBar.camera = camNote; // dont ask why its in cam note its the only thing that works :(
    bottomBlackBar.camera = camNote;
    FlxG.state.insert(1, topBlackBar);
    FlxG.state.insert(1, bottomBlackBar);
    strumLines.members[0].characters[0].cameraOffset.set(-2040, -100);
    strumLines.members[1].characters[0].cameraOffset.set(-1590, 500);
    strumLines.members[0].characters[1].x = 2000;
    strumLines.members[1].characters[1].x = 1800;
    strumLines.members[0].characters[1].y = 60;
    strumLines.members[1].characters[1].y = 60;
    strumLines.members[0].characters[1].alpha = 0;
    strumLines.members[1].characters[1].alpha = 0;
    missWarn.camera = camOther;
    missWarn.screenCenter();
    missWarn.scale.set(0, 0);
    if (downscroll) {
    camNote.y = 100;
    camHUD.y = -100;
    } else {
    camNote.y = -100;
    camHUD.y = 100;   
    }
    camNote.alpha = 0;
    camHUD.alpha = 0;

    if (FlxG.save.data.shaders) {
        camGame.addShader(test);
        camHUD.addShader(test);
        camOther.addShader(test);
    }
}

function update()
{
    if (misses == 16 && FlxG.save.data.mechanics){
    gameOver();  
    }
}

function onDadHit(e) {
    if (health > 0.5) {
    health -= 0.0175;
    }
}

function beatHit(curBeat:Int) 
{
    if (curBeat > 1072) {
        strumLines.members[0].characters[1].y = 90;  
        strumLines.members[1].characters[1].y = 90;
        FlxTween.tween(strumLines.members[0].characters[1], {y: 60}, Conductor.stepCrochet / 300, {ease: FlxEase.linearIn});
        FlxTween.tween(strumLines.members[1].characters[1], {y: 60}, Conductor.stepCrochet / 300, {ease: FlxEase.linearIn});
    }
    switch (curBeat) {
        case 5:
        if (FlxG.save.data.mechanics) {
        add(missWarn);
        FlxTween.tween(missWarn.scale, {x: 1, y: 1}, 6, {ease: FlxEase.circInOut});
        FlxTween.tween(missWarn, {alpha: 1}, 4, {ease: FlxEase.linearIn});
        }
        case 30:
        if (FlxG.save.data.mechanics) {
        FlxTween.tween(missWarn, {y: 900}, 3, {ease: FlxEase.cubeIn});
        FlxTween.tween(missWarn.scale, {x: 1.3, y: 0.7}, 3, {ease: FlxEase.cubeIn});
        FlxTween.tween(missWarn, {alpha: 0}, 2.5, {ease: FlxEase.cubeIn});
        }
        case 56:
        FlxTween.tween(camNote, {y: 0}, 2, {ease: FlxEase.cubeOut});
        FlxTween.tween(camNote, {alpha: 1}, 2.5, {ease: FlxEase.cubeOut});
        camHUD.y = 0;
        case 60: 
        if (FlxG.save.data.mechanics) {
        remove(missWarn);
        }
        case 126:
        FlxTween.tween(camNote, {alpha: 0}, 0.7, {ease: FlxEase.cubeIn});
        case 140:
        FlxTween.tween(camNote, {alpha: 1}, 1.4, {ease: FlxEase.cubeIn});
        FlxTween.tween(camHUD, {alpha: 1}, 1.4, {ease: FlxEase.cubeIn});
        case 432:
        if (FlxG.save.data.shaders) {
        test.contrast = 100;
        test.saturation = 10;
        }
        case 558:
        for(a in strumLines.members[0].members) { FlxTween.tween(a, {x : (FlxG.width * -1) + (Note.swagWidth * (a.ID - 2))}, 1, {ease: FlxEase.cubeIn});}
        for(a in strumLines.members[1].members) { FlxTween.tween(a, {x : (FlxG.width * 0.5) + (Note.swagWidth * (a.ID - 2))}, 1, {ease: FlxEase.circInOut});}
        FlxTween.tween(camHUD, {alpha: 0}, 1, {ease: FlxEase.linearIn});
        FlxTween.tween(timetext, {alpha: 0}, 1, {ease: FlxEase.linearIn});
        case 624:
        FlxTween.tween(camNote, {alpha: 0}, 1, {ease: FlxEase.linearIn});
        if (FlxG.save.data.shaders) {
        FlxTween.tween(test, {saturation: 5}, 1, {ease: FlxEase.linearIn});
        FlxTween.tween(test, {contrast: 200}, 1, {ease: FlxEase.linearIn});
        }
        case 688:
        if (FlxG.save.data.shaders) {
        FlxTween.tween(test, {saturation: -50}, 0.8, {ease: FlxEase.linearIn});
        }
        FlxTween.color(dad, 0.8, FlxColor.WHITE, FlxColor.BLACK, {ease: FlxEase.linear});
        FlxTween.color(boyfriend, 0.8, FlxColor.WHITE, FlxColor.BLACK, {ease: FlxEase.linear});
        case 744:
        FlxTween.tween(camNote, {alpha: 1}, 1.4, {ease: FlxEase.linearIn});
        FlxTween.tween(test, {saturation: -40}, 1.4, {ease: FlxEase.linearIn});
        FlxTween.color(dad, 1, FlxColor.BLACK, FlxColor.WHITE, {ease: FlxEase.linear});
        FlxTween.color(boyfriend, 1, FlxColor.BLACK, FlxColor.WHITE, {ease: FlxEase.linear});
        case 814:
        FlxTween.tween(camNote, {alpha: 0}, 0.8, {ease: FlxEase.linearIn});
        for(a in strumLines.members[0].members) { FlxTween.tween(a, {x : (FlxG.width * 0.21) + (Note.swagWidth * (a.ID - 2))}, 2, {ease: FlxEase.circIn});}
        for(a in strumLines.members[1].members) { FlxTween.tween(a, {x : (FlxG.width * 0.8) + (Note.swagWidth * (a.ID - 2))}, 6, {ease: FlxEase.circIn});}
        case 874:
        FlxTween.tween(camNote, {alpha: 1}, 1.4, {ease: FlxEase.linearIn});
        FlxTween.tween(camHUD, {alpha: 1}, 1.4, {ease: FlxEase.linearIn});
        FlxTween.tween(timetext, {alpha: 1}, 1.4, {ease: FlxEase.linearIn});
        case 1068:
        FlxTween.tween(boyfriend, {x: -400}, 1.4, {ease: FlxEase.cubeIn});
        FlxTween.tween(timetext, {y: -100}, 0.8, {ease: FlxEase.cubeIn});
        FlxTween.tween(camHUD, {alpha: 0}, 0.8, {ease: FlxEase.cubeIn});
        for(a in strumLines.members[0].members) { FlxTween.tween(a, {x : (FlxG.width * 0.8) + (Note.swagWidth * (a.ID - 2))}, 2.8, {ease: FlxEase.cubeInOut});}
        for(a in strumLines.members[0].members) { FlxTween.tween(a, {alpha : 0}, 0.8, {ease: FlxEase.cubeIn});}
        for(a in strumLines.members[0].notes) { FlxTween.tween(a, {alpha : 0}, 0.8, {ease: FlxEase.cubeIn});}
        for(a in strumLines.members[1].members) { FlxTween.tween(a, {x : (FlxG.width * 0.21) + (Note.swagWidth * (a.ID - 2))}, 2.8, {ease: FlxEase.cubeInOut});}
        case 1072:
        strumLines.members[0].characters[0].alpha = 0;
        strumLines.members[1].characters[0].alpha = 0;
        strumLines.members[2].characters[0].alpha = 0;
        strumLines.members[0].characters[1].alpha = 1;
        strumLines.members[1].characters[1].alpha = 1;
        topBlackBar.alpha = 1;
        bottomBlackBar.alpha = 1;
        FlxTween.tween(strumLines.members[0].characters[1], {x: 400}, 2.8, {ease: FlxEase.cubeOut});
        FlxTween.tween(strumLines.members[1].characters[1], {x: -1370}, 2.8, {ease: FlxEase.cubeOut});
        FlxTween.tween(camHUD, {alpha: 1}, 2.8, {ease: FlxEase.cubeOut});
        healthbarFlip = true;
        if (FlxG.save.data.shaders) {
        FlxTween.tween(test, {saturation: 10}, 3, {ease: FlxEase.cubeOut});
        FlxTween.tween(test, {contrast: 100}, 3, {ease: FlxEase.cubeOut});
        }
        case 1073:
        FlxTween.tween(timetext, {y: 50}, 0.8, {ease: FlxEase.cubeOut});
        for(a in strumLines.members[0].members) { FlxTween.tween(a, {alpha : 1}, 0.8, {ease: FlxEase.cubeOut});}
        for(a in strumLines.members[0].notes) { FlxTween.tween(a, {alpha : 1}, 0.8, {ease: FlxEase.cubeOut});}
        case 1198:
        FlxTween.tween(strumLines.members[0].characters[1], {x: -100}, 0.62, {ease: FlxEase.circIn});
        case 1200:
        FlxTween.tween(camNote, {alpha: 0}, 0.6, {ease: FlxEase.linearIn});
        FlxTween.tween(camHUD, {alpha: 0}, 0.6, {ease: FlxEase.linearIn});
        FlxTween.tween(camOther, {alpha: 0}, 0.6, {ease: FlxEase.linearIn});
    }
}