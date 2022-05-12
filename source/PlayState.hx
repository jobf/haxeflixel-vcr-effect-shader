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
	var noisePercent:Int;

	override public function create()
	{
		super.create();
		noisePercent = 0;

		isShaderEnabled = true;
		shader = new VhsShader();

		bg = new FlxSprite(0, 0, "assets/images/jungle.png");
		bg.shader = shader;
		add(bg);
                FlxG.mouse.visible = false;
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

		if (FlxG.keys.justPressed.UP)
		{
			if (noisePercent < 100)
			{
				noisePercent += 10;
				updateNoise();
			}
		}

		if (FlxG.keys.justPressed.DOWN)
		{
			if (noisePercent > 0)
			{
				noisePercent -= 10;
				updateNoise();
			}
		}
	}

	function updateNoise()
	{
		shader.setNoisePercent(noisePercent / 100);
	}

	function initHelpDisplay()
	{
		var helpBg = new FlxSprite(0, 396);
		helpBg.makeGraphic(FlxG.width, FlxG.height - 396, FlxColor.BLACK);
		helpBg.alpha = 0.2;
		add(helpBg);

		var helpText = new FlxText(0, 419, 512, "Press f to toggle shader \n up or down to increase or decrease noise", 20);
		helpText.alignment = CENTER;
		add(helpText);
	}
}
