package createjs;

/**
 * Tweens properties for a single target. Methods can be chained to create complex animation sequences:
 * 
 * <h4>Example</h4>
 * 
 * 	createjs.Tween.get(target)
 * 		.wait(500)
 * 		.to({alpha:0, visible:false}, 1000)
 * 		.call(handleComplete);
 * 
 * Multiple tweens can share a target, however if they affect the same properties there could be unexpected
 * behaviour. To stop all tweens on an object, use {{#crossLink "Tween/removeTweens"}}{{/crossLink}} or pass `override:true`
 * in the props argument.
 * 
 * 	createjs.Tween.get(target, {override:true}).to({x:100});
 * 
 * Subscribe to the {{#crossLink "Tween/change:event"}}{{/crossLink}} event to be notified when the tween position changes.
 * 
 * 	createjs.Tween.get(target, {override:true}).to({x:100}).addEventListener("change", handleChange);
 * 	function handleChange(event) {
 * 		// The tween changed.
 * 	}
 * 
 * See the {{#crossLink "Tween/get"}}{{/crossLink}} method also.
 */
extern class Tween extends AbstractTween
{
	/**
	 * Allows you to specify data that will be used by installed plugins. Each plugin uses this differently, but in general
	 * you specify data by assigning it to a property of `pluginData` with the same name as the plugin.
	 * Note that in many cases, this data is used as soon as the plugin initializes itself for the tween.
	 * As such, this data should be set before the first `to` call in most cases.
	 */
	var pluginData : Dynamic;
	/**
	 * The target of this tween. This is the object on which the tweened properties will be changed.
	 */
	var target : Dynamic;
	/**
	 * Indicates the tween's current position is within a passive wait.
	 */
	var passive : Bool;
	/**
	 * Constant returned by plugins to tell the tween not to use default assignment.
	 */
	static var IGNORE : Dynamic;

	function new(target:Dynamic, ?props:Dynamic) : Void;

	/**
	 * Returns a new tween instance. This is functionally identical to using `new Tween(...)`, but may look cleaner
	 * with the chained syntax of TweenJS.
	 * <h4>Example</h4>
	 * 
	 * 	var tween = createjs.Tween.get(target).to({x:100}, 500);
	 * 	// equivalent to:
	 * 	var tween = new createjs.Tween(target).to({x:100}, 500);
	 */
	static function get(target:Dynamic, ?props:Dynamic) : Tween;
	/**
	 * Advances all tweens. This typically uses the {{#crossLink "Ticker"}}{{/crossLink}} class, but you can call it
	 * manually if you prefer to use your own "heartbeat" implementation.
	 */
	static function tick(delta:Float, paused:Bool) : Void;
	/**
	 * Removes all existing tweens for a target. This is called automatically by new tweens if the `override`
	 * property is `true`.
	 */
	static function removeTweens(target:Dynamic) : Void;
	/**
	 * Stop and remove all existing tweens.
	 */
	static function removeAllTweens() : Void;
	/**
	 * Indicates whether there are any active tweens on the target object (if specified) or in general.
	 */
	static function hasActiveTweens(?target:Dynamic) : Bool;
	/**
	 * Adds a wait (essentially an empty tween).
	 * <h4>Example</h4>
	 * 
	 * 	//This tween will wait 1s before alpha is faded to 0.
	 * 	createjs.Tween.get(target).wait(1000).to({alpha:0}, 1000);
	 */
	function wait(duration:Float, ?passive:Bool) : Tween;
	/**
	 * Adds a tween from the current values to the specified properties. Set duration to 0 to jump to these value.
	 * Numeric properties will be tweened from their current value in the tween to the target value. Non-numeric
	 * properties will be set at the end of the specified duration.
	 * <h4>Example</h4>
	 * 
	 * 	createjs.Tween.get(target).to({alpha:0, visible:false}, 1000);
	 */
	function to(props:Dynamic, ?duration:Float, ?ease:Dynamic) : Tween;
	/**
	 * Adds a label that can be used with {{#crossLink "Tween/gotoAndPlay"}}{{/crossLink}}/{{#crossLink "Tween/gotoAndStop"}}{{/crossLink}}
	 * at the current point in the tween. For example:
	 * 
	 * 	var tween = createjs.Tween.get(foo)
	 * 					.to({x:100}, 1000)
	 * 					.label("myLabel")
	 * 					.to({x:200}, 1000);
	 * // ...
	 * tween.gotoAndPlay("myLabel"); // would play from 1000ms in.
	 */
	override function addLabel(label:String) : Tween;
	/**
	 * Adds an action to call the specified function.
	 * <h4>Example</h4>
	 * 
	 * 	//would call myFunction() after 1 second.
	 * 	createjs.Tween.get().wait(1000).call(myFunction);
	 */
	function call(callback:Dynamic, ?params:Array<Dynamic>, ?scope:Dynamic) : Tween;
	/**
	 * Adds an action to set the specified props on the specified target. If `target` is null, it will use this tween's
	 * target. Note that for properties on the target object, you should consider using a zero duration {{#crossLink "Tween/to"}}{{/crossLink}}
	 * operation instead so the values are registered as tweened props.
	 * <h4>Example</h4>
	 * 
	 * 	myTween.wait(1000).set({visible:false}, foo);
	 */
	function set(props:Dynamic, ?target:Dynamic) : Tween;
	/**
	 * Adds an action to play (unpause) the specified tween. This enables you to sequence multiple tweens.
	 * <h4>Example</h4>
	 * 
	 * 	myTween.to({x:100}, 500).play(otherTween);
	 */
	function play(?tween:Tween) : Tween;
	/**
	 * Adds an action to pause the specified tween.
	 * 
	 * 	myTween.pause(otherTween).to({alpha:1}, 1000).play(otherTween);
	 * 
	 * Note that this executes at the end of a tween update, so the tween may advance beyond the time the pause
	 * action was inserted at. For example:
	 * 
	 * myTween.to({foo:0}, 1000).pause().to({foo:1}, 1000);
	 * 
	 * At 60fps the tween will advance by ~16ms per tick, if the tween above was at 999ms prior to the current tick, it
	 * will advance to 1015ms (15ms into the second "step") and then pause.
	 */
	function pause(?tween:Tween) : Tween;
	/**
	 * Returns a string representation of this object.
	 */
	override function toString() : String;

	/**
	 * Called whenever the tween's position changes.
	 */
	inline function addChangeEventListener(handler:Dynamic->Void, ?useCapture:Bool) : Dynamic return addEventListener("change", handler, useCapture);
	inline function removeChangeEventListener(handler:Dynamic->Void, ?useCapture:Bool) : Void removeEventListener("change", handler, useCapture);
}