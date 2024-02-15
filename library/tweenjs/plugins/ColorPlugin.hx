package tweenjs.plugins;

import js.lib.RegExp;

/**
 * The ColorPlugin enables tweening of almost any CSS color values. This includes 3 or 6 digit hex colors (`#00FF00`),
 * rgb, rgba, hsl, and hsla colors (but not named colors, such as `red`).
 * 
 * It can operate in either `rgb` or `hsl` mode. It will convert all colors into that mode, and output them accordingly.
 */
@:native('createjs.ColorPlugin')
extern class ColorPlugin
{
	/**
	 * READ-ONLY. RegExp pattern that detects CSS color values.
	 */
	static var COLOR_RE(default, null) : RegExp;
	/**
	 * READ-ONLY. RegExp pattern that matches rgb or hsl color strings, with groups for each value.
	 */
	static var RGB_HSL_RE(default, null) : RegExp;
	/**
	 * READ-ONLY. RegExp pattern that matches a 3 or 6 digit RGB string with a preceding #.
	 */
	static var HEX_RE(default, null) : RegExp;
	/**
	 * READ-ONLY. A unique identifying string for this plugin. Used by TweenJS to ensure duplicate plugins are not installed on a tween.
	 */
	static var ID(default, null) : String;

	/**
	 * Installs this plugin for use with TweenJS. Call this once after TweenJS is loaded to enable this plugin.
	 */
	static function install(mode:String) : Void;
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