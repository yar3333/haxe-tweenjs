package createjs;

/**
 * A Tween instance tweens properties for a single target. Instance methods can be chained for easy construction and sequencing:
 * 
 * <h4>Example</h4>
 * 
 *      target.alpha = 1;
 * 	    Tween.get(target)
 * 	         .wait(500)
 * 	         .to({alpha:0, visible:false}, 1000)
 * 	         .call(handleComplete);
 * 	    function handleComplete() {
 * 	    	//Tween complete
 * 	    }
 * 
 * Multiple tweens can point to the same instance, however if they affect the same properties there could be unexpected
 * behaviour. To stop all tweens on an object, use {{#crossLink "Tween/removeTweens"}}{{/crossLink}} or pass <code>override:true</code>
 * in the props argument.
 * 
 *      Tween.get(target, {override:true}).to({x:100});
 * 
 * Subscribe to the "change" event to get notified when a property of the target is changed.
 * 
 *      Tween.get(target, {override:true}).to({x:100}).addEventListener("change", handleChange);
 *      function handleChange(event) {
 *          // The tween changed.
 *      }
 * 
 * See the Tween {{#crossLink "Tween/get"}}{{/crossLink}} method for additional param documentation.
 */
extern class Tween extends EventDispatcher
{
	/**
	 * Causes this tween to continue playing when a global pause is active. For example, if TweenJS is using {{#crossLink "Ticker"}}{{/crossLink}},
	 * then setting this to true (the default) will cause this tween to be paused when <code>Ticker.setPaused(true)</code>
	 * is called. See the Tween {{#crossLink "Tween/tick"}}{{/crossLink}} method for more info. Can be set via the props
	 * parameter.
	 */
	var ignoreGlobalPause : Bool;
	/**
	 * If true, the tween will loop when it reaches the end. Can be set via the props param.
	 */
	var loop : Bool;
	/**
	 * Read-only. Specifies the total duration of this tween in milliseconds (or ticks if useTicks is true).
	 * This value is automatically updated as you modify the tween. Changing it directly could result in unexpected
	 * behaviour.
	 */
	var duration : Float;
	/**
	 * Allows you to specify data that will be used by installed plugins. Each plugin uses this differently, but in general
	 * you specify data by setting it to a property of pluginData with the same name as the plugin class.
	 */
	var pluginData : Dynamic;
	/**
	 * Read-only. The target of this tween. This is the object on which the tweened properties will be changed. Changing
	 * this property after the tween is created will not have any effect.
	 */
	var target : Dynamic;
	/**
	 * Read-only. The current normalized position of the tween. This will always be a value between 0 and duration.
	 * Changing this property directly will have no effect.
	 */
	var position : Dynamic;
	/**
	 * Read-only. Indicates the tween's current position is within a passive wait.
	 */
	var passive : Bool;
	/**
	 * Constant defining the none actionsMode for use with setPosition.
	 */
	static var NONE : Float;
	/**
	 * Constant defining the loop actionsMode for use with setPosition.
	 */
	static var LOOP : Float;
	/**
	 * Constant defining the reverse actionsMode for use with setPosition.
	 */
	static var REVERSE : Float;
	/**
	 * Constant returned by plugins to tell the tween not to use default assignment.
	 */
	static var IGNORE : Dynamic;

	function new(target:Dynamic, ?props:Dynamic, ?pluginData:Dynamic) : Void;

	/**
	 * Returns a new tween instance. This is functionally identical to using "new Tween(...)", but looks cleaner
	 * with the chained syntax of TweenJS.
	 */
	static function get(target:Dynamic, ?props:Dynamic, ?pluginData:Dynamic, ?override_:Bool) : Tween;
	/**
	 * Removes all existing tweens for a target. This is called automatically by new tweens if the <code>override</code>
	 * property is <code>true</code>.
	 */
	static function removeTweens(target:Dynamic) : Void;
	/**
	 * Stop and remove all existing tweens.
	 */
	static function removeAllTweens() : Void;
	/**
	 * Indicates whether there are any active tweens (and how many) on the target object (if specified) or in general.
	 */
	static function hasActiveTweens(?target:Dynamic) : Bool;
	/**
	 * Installs a plugin, which can modify how certain properties are handled when tweened. See the {{#crossLink "CSSPlugin"}}{{/crossLink}}
	 * for an example of how to write TweenJS plugins.
	 */
	static function installPlugin(plugin:Dynamic, properties:Array<Dynamic>) : Void;
	/**
	 * Queues a wait (essentially an empty tween).
	 */
	function wait(duration:Float, passive:Bool) : Tween;
	/**
	 * Queues a tween from the current values to the target properties. Set duration to 0 to jump to these value.
	 * Numeric properties will be tweened from their current value in the tween to the target value. Non-numeric
	 * properties will be set at the end of the specified duration.
	 */
	function to(props:Dynamic, ?duration:Float, ?ease:Dynamic) : Tween;
	/**
	 * Queues an action to call the specified function.
	 */
	function call(callback:Dynamic, ?params:Array<Dynamic>, ?scope:Dynamic) : Tween;
	/**
	 * Queues an action to set the specified props on the specified target. If target is null, it will use this tween's
	 * target.
	 */
	function set(props:Dynamic, ?target:Dynamic) : Tween;
	/**
	 * Queues an action to to play (unpause) the specified tween. This enables you to sequence multiple tweens.
	 */
	function play(tween:Tween) : Tween;
	/**
	 * Queues an action to to pause the specified tween.
	 */
	function pause(tween:Tween) : Tween;
	/**
	 * Advances the tween to a specified position.
	 */
	function setPosition(value:Float, ?actionsMode:Float) : Bool;
	/**
	 * Advances this tween by the specified amount of time in milliseconds (or ticks if <code>useTicks</code> is true).
	 * This is normally called automatically by the Tween engine (via <code>Tween.tick</code>), but is exposed for
	 * advanced uses.
	 */
	function tick(delta:Float) : Void;
	/**
	 * Pauses or plays this tween.
	 */
	function setPaused(value:Bool) : Tween;
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