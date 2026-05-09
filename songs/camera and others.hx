// i referenced this code a little of off silly borja's target offset thing so thank you 

public var camNoteIntensity:Float = 30;

function postUpdate() {
    if (curCameraTarget!=-1) {
        var guy = strumLines.members[curCameraTarget].characters[0];
    switch (guy.animation.curAnim.name) {
        case "singRIGHT": 
            camMove(camNoteIntensity, 0, 0.32);
            //camFollow.x += camNoteIntensity;
        case "singUP": 
            camMove(0, -camNoteIntensity, 0);
            //camFollow.y -= camNoteIntensity;
        case "singDOWN": 
            camMove(0, camNoteIntensity, 0);
            //camFollow.y += camNoteIntensity;
        case "singLEFT": 
            camMove(-camNoteIntensity, 0, -0.32);
            //camFollow.x -= camNoteIntensity;
        default:
            camMove(0, 0, 0);
    }
    } else {
        camMove(0, 0, 0);
    }
}

function camMove(x, y, anglelerp) {
    camFollow.x += x;
    camFollow.y += y;
    camGame.angle = FlxMath.lerp(camGame.angle, anglelerp, 0.05);
}

function onNoteHit(_) {
    for (char in _.characters) {
        if(_.note.isSustainNote && char.lastAnimContest != "MISS") {
            char.lastHit = Conductor.songPosition;
            _.animCancelled = true;
        }
    }
}

function onPlayerMiss(_)  {
    for (char in _.characters) {
        if (_.note.isSustainNote && char.lastAnimContext != "SING") {
            char.lastHit = Conductor.songPosition;
            _.animCancelled = true;
        }
    }
}