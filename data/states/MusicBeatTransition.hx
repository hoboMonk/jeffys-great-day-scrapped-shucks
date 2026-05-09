// hey this code is very messy and buggy at times so i disabled it cuz i hate it




//var transistionText:FlxText = new FlxText(30, 1350, 0, FlxG.random.getObject(CoolUtil.coolTextFile(Paths.txt("transition"))), 55);
//var blacksprite = new FunkinSprite(0, 0).makeSolid(FlxG.width, FlxG.height, FlxColor.BLACK);

//function create(){
    //transitionTween.cancel();
    //transitionCamera.flipY = false;
    //remove(blackSpr);
    //remove(transitionSprite);

    //sawBlade = new FunkinSprite().loadGraphic(Paths.image('transition saw'));
    //sawBlade.y = 50;
    
    //sawBlade.x = newState != null ? -1800 : 105;
    //transistionText.alpha = blacksprite.alpha = newState != null ? 0 : 1;
    //transistionText.font = Paths.font("Arial Black.ttf");

    //if (newState != null) {
    //sawBlade.scale.set(0.55, 0.55);
    //} else {
    //sawBlade.scale.set(0.95, 0.95);
    //}

    //blacksprite.scrollFactor.set(0, 0);
    
    //add(sawBlade);
    //add(blacksprite);
    //add(transistionText);
    //if (newState != null) {
    //new FlxTimer().start(0.32, function(){
        //FlxTween.tween(blacksprite, {alpha: 1}, 0.16, {ease: FlxEase.linearOut});
        //FlxTween.tween(transistionText, {alpha: 1}, 0.16, {ease: FlxEase.linearOut});
    //}); } else {
        //FlxTween.tween(blacksprite, {alpha: 0}, 0.16, {ease: FlxEase.linearOut});
        //FlxTween.tween(transistionText, {alpha: 0}, 0.16, {ease: FlxEase.linearOut});
    //}
    //FlxTween.tween(sawBlade, {angle: 360}, 0.5, {ease: FlxEase.linearOut});
    //FlxTween.tween(sawBlade.scale, {x: newState != null ? 0.95 : 0.55, y: newState != null ? 0.95 : 0.55}, 0.5, {ease: newState != null ? FlxEase.circIn : FlxEase.circOut});
    //FlxTween.tween(sawBlade, {x: newState != null ? -375 : 860}, 0.5, {ease: FlxEase.linearOut, onComplete: (e) ->
        //if (newState != null) {
            //FlxG.switchState(newState);
        //} else {
            //remove(sawBlade);
            //remove(blacksprite);
            //remove(transistionText);
        //}});  
//}