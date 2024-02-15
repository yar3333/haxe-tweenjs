package createjs;

/**
 * Contains properties and methods shared by all events for use with
 * {{#crossLink "EventDispatcher"}}{{/crossLink}}.
 * 
 * Note that Event objects are often reused, so you should never
 * rely on an event object's state outside of the call stack it was received in.
 */
extern class Event
{
	/**
	 * The type of event.
	 */
	var type : String;
	/**
	 * The object that generated an event.
	 */
	var target : Dynamic;
	/**
	 * The current target that a bubbling event is being dispatched from. For non-bubbling events, this will
	 * always be the same as target. For example, if childObj.parent = parentObj, and a bubbling event
	 * is generated from childObj, then a listener on parentObj would receive the event with
	 * target=childObj (the original target) and currentTarget=parentObj (where the listener was added).
	 */
	var currentTarget : Dynamic;
	/**
	 * For bubbling events, this indicates the current event phase:<OL>
	 * 	<LI> capture phase: starting from the top parent to the target</LI>
	 * 	<LI> at target phase: currently being dispatched from the target</LI>
	 * 	<LI> bubbling phase: from the target to the top parent</LI>
	 * </OL>
	 */
	var eventPhase : Int;
	/**
	 * Indicates whether the event will bubble through the display list.
	 */
	var bubbles : Bool;
	/**
	 * Indicates whether the default behaviour of this event can be cancelled via
	 * {{#crossLink "Event/preventDefault"}}{{/crossLink}}. This is set via the Event constructor.
	 */
	var cancelable : Bool;
	/**
	 * The epoch time at which this event was created.
	 */
	var timeStamp : Float;
	/**
	 * Indicates if {{#crossLink "Event/preventDefault"}}{{/crossLink}} has been called
	 * on this event.
	 */
	var defaultPrevented : Bool;
	/**
	 * Indicates if {{#crossLink "Event/stopPropagation"}}{{/crossLink}} or
	 * {{#crossLink "Event/stopImmediatePropagation"}}{{/crossLink}} has been called on this event.
	 */
	var propagationStopped : Bool;
	/**
	 * Indicates if {{#crossLink "Event/stopImmediatePropagation"}}{{/crossLink}} has been called
	 * on this event.
	 */
	var immediatePropagationStopped : Bool;
	/**
	 * Indicates if {{#crossLink "Event/remove"}}{{/crossLink}} has been called on this event.
	 */
	var removed : Bool;

	function new(type:String, bubbles:Bool, cancelable:Bool) : Void;

	/**
	 * Sets {{#crossLink "Event/defaultPrevented"}}{{/crossLink}} to true if the event is cancelable.
	 * Mirrors the DOM level 2 event standard. In general, cancelable events that have `preventDefault()` called will
	 * cancel the default behaviour associated with the event.
	 */
	function preventDefault() : Void;
	/**
	 * Sets {{#crossLink "Event/propagationStopped"}}{{/crossLink}} to true.
	 * Mirrors the DOM event standard.
	 */
	function stopPropagation() : Void;
	/**
	 * Sets {{#crossLink "Event/propagationStopped"}}{{/crossLink}} and
	 * {{#crossLink "Event/immediatePropagationStopped"}}{{/crossLink}} to true.
	 * Mirrors the DOM event standard.
	 */
	function stopImmediatePropagation() : Void;
	/**
	 * Causes the active listener to be removed via removeEventListener();
	 * 
	 * 		myBtn.addEventListener("click", function(evt) {
	 * 			// do stuff...
	 * 			evt.remove(); // removes this listener.
	 * 		});
	 */
	function remove() : Void;
	/**
	 * Returns a clone of the Event instance.
	 */
	function clone() : Event;
	/**
	 * Provides a chainable shortcut method for setting a number of properties on the instance.
	 */
	function set(props:Dynamic) : Event;
	/**
	 * Returns a string representation of this object.
	 */
	function toString() : String;
}