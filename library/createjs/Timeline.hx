package createjs;

/**
 * The Timeline class synchronizes multiple tweens and allows them to be controlled as a group. Please note that if a
 * timeline is looping, the tweens on it may appear to loop even if the "loop" property of the tween is false.
 */
extern class Timeline extends EventDispatcher
{
	/**
	 * Causes this timeline to continue playing when a global pause is active.
	 */
	var ignoreGlobalPause : Bool;
	/**
	 * Read-only property specifying the total duration of this timeline in milliseconds (or ticks if useTicks is true).
	 * This value is usually automatically updated as you modify the timeline. See updateDuration for more information.
	 */
	var duration : Float;
	/**
	 * If true, the timeline will loop when it reaches the end. Can be set via the props param.
	 */
	var loop : Bool;
	/**
	 * Read-only. The current normalized position of the timeline. This will always be a value between 0 and duration.
	 * Changing this property directly will have no effect.
	 */
	var position : Dynamic;

	function new(tweens:Array<Dynamic>, labels:Dynamic, props:Dynamic) : Void;

	/**
	 * Adds one or more tweens (or timelines) to this timeline. The tweens will be paused (to remove them from the normal ticking system)
	 * and managed by this timeline. Adding a tween to multiple timelines will result in unexpected behaviour.
	 */
	function addTween(tween:Dynamic) : Tween;
	/**
	 * Removes one or more tweens from this timeline.
	 */
	function removeTween(tween:Dynamic) : Bool;
	/**
	 * Adds a label that can be used with {{#crossLink "Timeline/gotoAndPlay"}}{{/crossLink}}/{{#crossLink "Timeline/gotoAndStop"}}{{/crossLink}}.
	 */
	function addLabel(label:String, position:Float) : Void;
	/**
	 * Defines labels for use with gotoAndPlay/Stop. Overwrites any previously set labels.
	 */
	function setLabels(o:Dynamic) : Void;
	/**
	 * Returns a sorted list of the labels defined on this timeline.
	 */
	function getLabels() : Array<Dynamic>;
	/**
	 * Returns the name of the label on or immediately before the current position. For example, given a timeline with
	 * two labels, "first" on frame index 4, and "second" on frame 8, getCurrentLabel would return:<UL>
	 * <LI>null if the current position is 2.</LI>
	 * <LI>"first" if the current position is 4.</LI>
	 * <LI>"first" if the current position is 7.</LI>
	 * <LI>"second" if the current position is 15.</LI></UL>
	 */
	function getCurrentLabel() : String;
	/**
	 * Unpauses this timeline and jumps to the specified position or label.
	 */
	function gotoAndPlay(positionOrLabel:Dynamic) : Void;
	/**
	 * Pauses this timeline and jumps to the specified position or label.
	 */
	function gotoAndStop(positionOrLabel:Dynamic) : Void;
	/**
	 * Advances the timeline to the specified position.
	 */
	function setPosition(value:Float, ?actionsMode:Float) : Bool;
	/**
	 * Pauses or plays this timeline.
	 */
	function setPaused(value:Bool) : Void;
	/**
	 * Recalculates the duration of the timeline.
	 * The duration is automatically updated when tweens are added or removed, but this method is useful
	 * if you modify a tween after it was added to the timeline.
	 */
	function updateDuration() : Void;
	/**
	 * Advances this timeline by the specified amount of time in milliseconds (or ticks if useTicks is true).
	 * This is normally called automatically by the Tween engine (via Tween.tick), but is exposed for advanced uses.
	 */
	function tick(delta:Float) : Void;
	/**
	 * If a numeric position is passed, it is returned unchanged. If a string is passed, the position of the
	 * corresponding frame label will be returned, or null if a matching label is not defined.
	 */
	function resolve(positionOrLabel:Dynamic) : Dynamic;
	/**
	 * Returns a string representation of this object.
	 */
	override function toString() : String;

	/**
	 * Called whenever the timeline's position changes.
	 */
	inline function addChangeEventListener(handler:Dynamic->Void, ?useCapture:Bool) : Dynamic return addEventListener("change", handler, useCapture);
	inline function removeChangeEventListener(handler:Dynamic->Void, ?useCapture:Bool) : Void removeEventListener("change", handler, useCapture);
}