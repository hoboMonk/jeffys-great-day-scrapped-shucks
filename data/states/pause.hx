import funkin.options.OptionsMenu;
import funkin.editors.charter.Charter;
import funkin.savedata.FunkinSave;
import funkin.backend.MusicBeatState;
import openfl.text.TextField;
import flixel.text.FlxTextAlign;
import flixel.addons.display.FlxBackdrop;

var selections = ['resume','restart','options','exit'];
var selection_group:FlxTypedGroup<FlxText>;
public var selected = 0;

function create(_) {
	_.cancel();

	camPaused = new FlxCamera();
	camPaused.bgColor = 0;
	FlxG.cameras.add(camPaused, false);
	camera = camPaused;

	black = new FunkinSprite(0, 0).makeSolid(FlxG.width, FlxG.height, FlxColor.BLACK);
	black.alpha = 0.6;
	add(black);

	smallerBlack = new FunkinSprite(25, 165).makeSolid(400, 450, FlxColor.BLACK);
	smallerBlack.alpha = 0.5;
	add(smallerBlack);

	selection_group = new FlxGroup();
	add(selection_group);

	for (i in 0...selections.length)
		{
			text = new FlxText(100, 210 + (i * (70 + 30)),0,selections[i],50);
			text.font = Paths.font('Terminal F4.ttf');
			
			selection_group.add(text);
		}

	gamePauseText = new FlxText(FlxG.width * 0.72, 10, 0, "Song Paused", 45);
	gamePauseText.font = Paths.font('Terminal F4.ttf');
	gamePauseText.alignment = FlxTextAlign.RIGHT;
	add(gamePauseText);

	pointer = new FunkinSprite(150, 0);
    pointer.frames = Paths.getFrames("pausePointer");
	pointer.scale.set(0.1, 0.1);
	add(pointer);

	FlxTween.tween(pointer, {x: pointer.x + 15}, 1, {ease: FlxEase.circInOut, type: 4});
}

function update(elapsed:Float) {
	pauseMusic.volume = 0.5;
	pointer.y = selection_group.members[selected].y - 169;
	if (controls.UP_P || controls.DOWN_P) {
    selected = FlxMath.wrap(
        selected + (controls.UP_P ? -1 : 1),
        0,
        selections.length - 1
    );

    FlxG.sound.play(Paths.sound("menu/scroll"), Options.volumeSFX);
}

if (controls.ACCEPT) switch(selections[selected]) {
		case "resume":
			close();
		case "restart":
			FlxG.resetState();
		case "options":
			FlxG.switchState(new OptionsMenu((_) -> FlxG.switchState(new PlayState())));
		case "exit":
			curSelected = menuItems.length - 1;
			selectOption();
	}
}