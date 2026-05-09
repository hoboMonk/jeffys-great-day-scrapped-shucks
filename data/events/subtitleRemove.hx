function onEvent(eventEvent) {
    if (eventEvent.event.name == "subtitleRemove" && FlxG.save.data.subtitles)
    {
        for (a in [subtitle, subBG]) FlxTween.tween(a, {alpha: 0}, eventEvent.event.params[0]);
    }
}