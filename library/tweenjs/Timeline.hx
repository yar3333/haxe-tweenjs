package tweenjs;

/**
 * The Timeline class synchronizes multiple tweens and allows them to be controlled as a group. Please note that if a
 * timeline is looping, the tweens on it may appear to loop even if the "loop" property of the tween is false.
 */
@:native('createjs.Timeline')
extern class Timeline extends AbstractTween
{
	function new(?props:Dynamic) : Void;

	/**
	 * Adds one or more tweens (or timelines) to this timeline. The tweens will be paused (to remove them from the
	 * normal ticking system) and managed by this timeline. Adding a tween to multiple timelines will result in
	 * unexpected behaviour.
	 */
	function addTween(tween:Tween) : Tween;

	/**
	 * Removes one or more tweens from this timeline.
	 */
	function removeTween(tween:Tween) : Bool;

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
	 * Pauses or plays this timeline.
	 */
	function setPaused(value:Bool) : Void;

	/**
     * Recalculates the duration of the timeline. The duration is automatically updated when tweens are added or removed,
     * but this method is useful if you modify a tween after it was added to the timeline.
     */
	function updateDuration() : Void;

	/**
	 * Advances this timeline by the specified amount of time in milliseconds (or ticks if useTicks is true).
	 * This is normally called automatically by the Tween engine (via Tween.tick), but is exposed for advanced uses.
	 */
	function tick(delta:Float) : Void;
}