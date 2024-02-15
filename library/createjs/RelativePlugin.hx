package createjs;

/**
 * The RelativePlugin for TweenJS enables relative numeric values for tweens. Install using:
 * 
 * 	RotationPlugin.install();
 * 
 * Once installed, you can pass in relative numeric property values as strings beginning with "+" or "-". For example,
 * the following tween would tween the x position of `foo` from its initial value of `200` to `50` (200-150), then to
 * `125` (50+75).
 * 
 * 	foo.x = 200;
 * 	Tween.get(foo).to({x:"-150"}, 500).to({x:"+75"}, 500);
 */
extern class RelativePlugin
{
	/**
	 * READ-ONLY. A unique identifying string for this plugin. Used by TweenJS to ensure duplicate plugins are not installed on a tween.
	 */
	static var ID(default, null) : String;

	/**
	 * Installs this plugin for use with TweenJS. Call this once after TweenJS is loaded to enable this plugin.
	 */
	static function install() : Void;
	/**
	 * Called by TweenJS when a new property initializes on a tween.
	 * See {{#crossLink "SamplePlugin/init"}}{{/crossLink}} for more info.
	 */
	static function init(tween:Tween, prop:String, value:Dynamic) : Dynamic;
	/**
	 * Called when a new step is added to a tween (ie. a new "to" action is added to a tween).
	 * See {{#crossLink "SamplePlugin/step"}}{{/crossLink}} for more info.
	 */
	static function step(tween:Tween, step:TweenStep, props:Dynamic) : Void;
	/**
	 * Called before a property is updated by the tween.
	 * See {{#crossLink "SamplePlugin/change"}}{{/crossLink}} for more info.
	 */
	static function change(tween:Tween, step:TweenStep, prop:String, value:Dynamic, ratio:Float, end:Bool) : Dynamic;
}