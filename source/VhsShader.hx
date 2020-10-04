import flixel.system.FlxAssets.FlxShader;

class VhsShader extends FlxShader
{
	@:glFragmentSource('
        #pragma header
        
        uniform float iTime;

        void main()
        {
            gl_FragColor = flixel_texture2D(bitmap, vec2(openfl_TextureCoordv.x, openfl_TextureCoordv.y));
        }')
	public function new()
	{
		super();
		iTime.value = [0.0];
	}

	public function update(elapsed:Float)
	{
		iTime.value[0] = elapsed;
	}
}
