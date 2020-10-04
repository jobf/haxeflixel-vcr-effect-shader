package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var isShaderEnabled:Bool;
	var shader:VhsShader;
	var bg:FlxSprite;

	override public function create()
	{
		super.create();

		isShaderEnabled = true;
		shader = new VhsShader();

		bg = new FlxSprite(0, 0, "assets/images/jungle.png");
		bg.shader = shader;
		add(bg);

		initHelpDisplay();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (isShaderEnabled)
		{
			shader.update(elapsed);
		}

		if (FlxG.keys.justPressed.F)
		{
			isShaderEnabled = !isShaderEnabled;
		}
	}

	function initHelpDisplay()
	{
		var helpBg = new FlxSprite(0, 396);
		helpBg.makeGraphic(FlxG.width, FlxG.height - 396, FlxColor.BLACK);
		helpBg.alpha = 0.2;
		add(helpBg);

		var helpText = new FlxText(0, 419, 512, "Press f to toggle shader update off and on", 20);
		helpText.alignment = CENTER;
		add(helpText);
	}
}
