var camMovement:Float = 30;
function postUpdate(elapsed:Float) {
    var animName = strumLines.members[curCameraTarget].characters[0].getAnimName();
    if (animName.indexOf("singLEFT") != -1) camFollow.x -= camMovement;
    else if (animName.indexOf("singDOWN") != -1) camFollow.y += camMovement;
    else if (animName.indexOf("singUP") != -1) camFollow.y -= camMovement;
    else if (animName.indexOf("singRIGHT") != -1) camFollow.x += camMovement;
}