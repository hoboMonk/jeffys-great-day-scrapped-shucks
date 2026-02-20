// okay
import haxe.ds.ObjectMap;

var frozenCharacters:ObjectMap<Character, Bool> = new ObjectMap();

function onNoteHit(e) {
    for (char in e.characters){
        if (e.note.isSustainNote) frozenCharacters.set(char, true);
        if (e.note.animation.name == "holdend") frozenCharacters.set(char, false);
    }
}

function postUpdate(elapsed:Float) {
    for (char in frozenCharacters.keys()) {
        var bool = frozenCharacters.get(char);
        if (char.animateAtlas == null) char.animation.paused = bool;
        else {
            var isPaused = char.animateAtlas.anim.paused;
            if (bool && !isPaused) char.animateAtlas.anim.pause();
            else if (!bool && isPaused) char.animateAtlas.anim.play();
        }
    }
}

function onPlayerMiss(e)
    for (a in e.characters) frozenCharacters.set(a, false);
