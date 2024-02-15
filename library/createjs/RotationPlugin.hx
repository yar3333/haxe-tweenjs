package createjs;

/**
 * The RotationPlugin for TweenJS modifies tweens of rotation properties. These properties can be changed when calling
 * `install`. Install using:
 * 
 * 	RotationPlugin.install(props);
 * 
 * After installation, by default all rotation tweens will rotate in the shortest direction. For example, if you
 * tween from `rotation=15` to `rotation=330`, it will rotate counter-clockwise 45 degrees. You can modify this behaviour by
 * specifying a `rotationDir` tween value. A value of `-1` will force CCW rotation, `1` will force CW, and `0` will
 * disable the plugin effects for that portion of the tween.
 * 
 * Note that the `rotationDir` value will persist until overridden in future `to` calls. Set it to null to re-enable the default behavior.
 * 
 * 	// this tween will rotate: CCW, then CCW (because rotationDir persists), then CW.
 * 	myTween.get(foo).to({rotation:30, rotationDir:-1}).to({rotation:60}).to({rotation:10, rotationDir:1});
 * 
 * You can also disable the plugin completely for a tween by setting `tween.pluginData.Rotation_disabled=true`.
 */
extern class RotationPlugin
{
	/**
	 * READ-ONLY. A unique identifying string for this plugin. Used by TweenJS to ensure duplicate plugins are not installed on a tween.
	 */
	static var ID(default, null) : String;

	/**
	 * Installs this plugin for use with TweenJS. Call this once after TweenJS is loaded to enable this plugin.
	 */
	static function install(props:Dynamic) : Void;
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