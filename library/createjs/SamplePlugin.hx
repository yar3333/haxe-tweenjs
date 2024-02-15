package createjs;

/**
 * A sample TweenJS plugin. This plugin is purely for demonstration, and contains documentation and helpful tips on
 * building plugins.
 * 
 * It sets the y position of the target based on a sinusoidal function of its x position.
 * 
 * NOTE: The code for this class is heavily commented. Please look at it if you'd like to write a plugin.
 * 
 * A TweenJS plugin is simply an object that exposes two properties (id, priority), and three methods (init, step, and change).
 * Generally a plugin will also expose an <code>install</code> method as well, though this is not strictly necessary.
 */
extern class SamplePlugin
{
	/**
	 * Used by TweenJS to determine when to call this plugin relative to others.
	 * Plugins with higher priority read first, and write last.
	 * 
	 * For example, if plugin A has `priority=0`, and plugin B has `priority=9` then B's `init` and `step` methods would
	 *  be called before A's, but B's `change` method would be called *after* A's.
	 */
	static var priority : Float;
	
    /**
	 * READ-ONLY. A unique identifying string for this plugin. Used by TweenJS to ensure duplicate plugins are not installed on a tween.
	 */
	static var ID(default, null) : String;

	/**
	 * Installs this plugin for use with TweenJS. Call this once after TweenJS is loaded to enable this plugin.
	 */
	static function install() : Void;
	/**
	 * Called by TweenJS when a new property initializes on a tween. Generally, the call
	 * to `Plugin.init` will be immediately followed by a call to `Plugin.step`.
	 * 
	 * For example:
	 * 
	 * 	foo.x = 0;
	 * 	foo.y = 100;
	 * 	Tween.get(foo)
	 * 		.to({x:10}) // init called with prop = "x", value = 0
	 * 		.to({x:20}) // init is NOT called, since x was already inited
	 * 		.to({y:200}) // init called with prop = "y", value = 100
	 */
	static function init(tween:Tween, prop:String, value:Dynamic) : Dynamic;
	/**
	 * Called when a new step is added to a tween (ie. a new "to" action is added to a tween).
	 * 
	 * For example:
	 * 	Tween.get(foo)
	 * 		.to({x:10}) // step called
	 * 		.wait(100) // step is NOT called
	 * 		.to({x:20, y:200}) // step called
	 */
	static function step(tween:Tween, step:TweenStep, props:Dynamic) : Void;
	/**
	 * Called before a property is updated by the tween.
	 */
	static function change(tween:Tween, step:TweenStep, prop:String, value:Dynamic, ratio:Float, end:Bool) : Dynamic;
}