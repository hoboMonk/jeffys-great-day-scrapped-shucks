import funkin.options.OptionsMenu;
import funkin.menus.credits.CreditsMain;
import funkin.menus.ModSwitchMenu;
import funkin.editors.EditorPicker;

var curSelect:Int = 0;
var options:Array<String> = ['play', 'options', 'credits'];
var buttons:FlxTypedGroup<FlxText>;
var canSelect:Bool = true;

function create() {
    CoolUtil.playMenuSong();

    var title = new FunkinText(570, 30, 0, "JEFFY's gREAT DAY\nshucks scrapped build", 50);
    title.alignment = "right";
    add(title);

    var author = new FunkinText(820, 670, 0, "made by spike and hobo", 30);
    add(author);

    title.font = author.font = Paths.font("ransom2.ttf");


    buttons = new FlxGroup();
    add(buttons);

    for (i in 0...options.length) {
        var text = new FlxText(50 + (i * 50), 100 + (i * 160), 0, options[i], 120);
        text.font = Paths.font("ransom1.ttf");
        FlxTween.tween(text, {y: text.y + 5}, 1, {startDelay: 0.2 * i, ease: FlxEase.sineInOut, type: 4});
        buttons.add(text);
    }
}

function update(elapsed:Float) {
    if(canSelect) {
        for (i=>item in buttons.members) { 
            item.color = (i == curSelect) ? FlxColor.RED : FlxColor.WHITE;
        }

        if(controls.RIGHT_P || controls.DOWN_P) {
            curSelect = FlxMath.wrap(curSelect + 1, 0, options.length-1);
            FlxG.sound.play(Paths.sound("menu/scroll"), Options.volumeSFX);
        }
        if(controls.LEFT_P || controls.UP_P) {
            curSelect = FlxMath.wrap(curSelect - 1, 0, options.length-1);
            FlxG.sound.play(Paths.sound("menu/scroll"), Options.volumeSFX);
        }
  
    if(controls.DEV_ACCESS) {
        persistentUpdate = !(persistentDraw = true);
        openSubState(new EditorPicker());
    }

    if(controls.SWITCHMOD) {
        persistentUpdate = !(persistentDraw = true);
        openSubState(new ModSwitchMenu());
    }

    for (i=>item in buttons.members) if (controls.ACCEPT) {
        switch (curSelect) {
            case 0:
                canSelect = false;
                FlxTween.tween(FlxG.sound.music, {pitch: 0}, 1.2, {ease: FlxEase.cubeIn});
                FlxTween.tween(FlxG.camera, {zoom: 2, angle: 15, alpha: 0}, 1.2, {ease: FlxEase.cubeIn});
                new FlxTimer().start(1.3, () ->{
                    PlayState.loadSong('shuckie', 'hard');
                    FlxG.switchState(new PlayState());
                });
            case 1:
                FlxG.switchState(new OptionsMenu());
            case 2:
                FlxG.switchState(new CreditsMain());
        }
    }
    }
}