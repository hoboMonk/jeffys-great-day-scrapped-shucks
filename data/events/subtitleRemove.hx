function onEvent(eventEvent) {
    if (eventEvent.event.name == "subtitleRemove" && FlxG.save.data.subtitles)
    {
        FlxTween.tween(subtitle, {alpha: 0}, eventEvent.event.params[0], {ease: FlxEase.linear,
        onComplete: function(tween:FlxTween) {
        }});
        FlxTween.tween(subBG, {alpha: 0}, eventEvent.event.params[0], {ease: FlxEase.linear,
        onComplete: function(tween:FlxTween) {
        }});
    }
}