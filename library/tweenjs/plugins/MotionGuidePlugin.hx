package tweenjs.plugins;

/**
 * A TweenJS plugin for working with motion guides. Defined paths which objects can follow or orient along.
 * 
 * To use the plugin, install the plugin after TweenJS has loaded. To define a path, add
 * 
 * 		createjs.MotionGuidePlugin.install();
 * 
 * <h4>Example</h4>
 * 
 * 		// Using a Motion Guide
 * 		createjs.Tween.get(target).to({guide:{ path:[0,0, 0,200,200,200, 200,0,0,0] }},7000);
 * 		// Visualizing the line
 * 		graphics.moveTo(0,0).curveTo(0,200,200,200).curveTo(200,0,0,0);
 * 
 * Each path needs pre-computation to ensure there's fast performance. Because of the pre-computation there's no
 * built in support for path changes mid tween. These are the Guide Object's properties:<UL>
 * 		<LI> path: Required, Array : The x/y points used to draw the path with a moveTo and 1 to n curveTo calls.</LI>
 * 		<LI> start: Optional, 0-1 : Initial position, default 0 except for when continuing along the same path.</LI>
 * 		<LI> end: Optional, 0-1 : Final position, default 1 if not specified.</LI>
 * 		<LI> orient: Optional, string : "fixed"/"auto"/"cw"/"ccw"<UL>
 * 				<LI>"fixed" forces the object to face down the path all movement (relative to start rotation),</LI>
 * 				<LI>"auto" rotates the object along the path relative to the line.</LI>
 * 				<LI>"cw"/"ccw" force clockwise or counter clockwise rotations including Adobe Flash/Animate-like
 * 				behaviour. This may override your end rotation value.</LI>
 * 		</UL></LI>
 * </UL>
 * Guide objects should not be shared between tweens even if all properties are identical, the library stores
 * information on these objects in the background and sharing them can cause unexpected behaviour. Values
 * outside 0-1 range of tweens will be a "best guess" from the appropriate part of the defined curve.
 */
@:native('createjs.MotionGuidePlugin')
extern class MotionGuidePlugin
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