package createjs;

/**
 * EventDispatcher provides methods for managing queues of event listeners and dispatching events.
 * 
 * You can either extend EventDispatcher or mix its methods into an existing prototype or instance by using the
 * EventDispatcher {{#crossLink "EventDispatcher/initialize"}}{{/crossLink}} method.
 * 
 * Together with the CreateJS Event class, EventDispatcher provides an extended event model that is based on the
 * DOM Level 2 event model, including addEventListener, removeEventListener, and dispatchEvent. It supports
 * bubbling / capture, preventDefault, stopPropagation, stopImmediatePropagation, and handleEvent.
 * 
 * EventDispatcher also exposes a {{#crossLink "EventDispatcher/on"}}{{/crossLink}} method, which makes it easier
 * to create scoped listeners, listeners that only run once, and listeners with associated arbitrary data. The 
 * {{#crossLink "EventDispatcher/off"}}{{/crossLink}} method is merely an alias to
 * {{#crossLink "EventDispatcher/removeEventListener"}}{{/crossLink}}.
 * 
 * Another addition to the DOM Level 2 model is the {{#crossLink "EventDispatcher/removeAllEventListeners"}}{{/crossLink}}
 * method, which can be used to listeners for all events, or listeners for a specific event. The Event object also 
 * includes a {{#crossLink "Event/remove"}}{{/crossLink}} method which removes the active listener.
 * 
 * <h4>Example</h4>
 * Add EventDispatcher capabilities to the "MyClass" class.
 * 
 *      EventDispatcher.initialize(MyClass.prototype);
 * 
 * Add an event (see {{#crossLink "EventDispatcher/addEventListener"}}{{/crossLink}}).
 * 
 *      instance.addEventListener("eventName", handlerMethod);
 *      function handlerMethod(event) {
 *          console.log(event.target + " Was Clicked");
 *      }
 * 
 * <b>Maintaining proper scope</b><br />
 * Scope (ie. "this") can be be a challenge with events. Using the {{#crossLink "EventDispatcher/on"}}{{/crossLink}}
 * method to subscribe to events simplifies this.
 * 
 *      instance.addEventListener("click", function(event) {
 *          console.log(instance == this); // false, scope is ambiguous.
 *      });
 *      
 *      instance.on("click", function(event) {
 *          console.log(instance == this); // true, "on" uses dispatcher scope by default.
 *      });
 * 
 * If you want to use addEventListener instead, you may want to use function.bind() or a similar proxy to manage scope.
 */
extern class EventDispatcher
{
	function new() : Void;

	/**
	 * Static initializer to mix EventDispatcher methods into a target object or prototype.
	 * 
	 * 		EventDispatcher.initialize(MyClass.prototype); // add to the prototype of the class
	 * 		EventDispatcher.initialize(myObject); // add to a specific instance
	 */
	static function initialize(target:Dynamic) : Void;
	/**
	 * Adds the specified event listener. Note that adding multiple listeners to the same function will result in
	 * multiple callbacks getting fired.
	 * 
	 * <h4>Example</h4>
	 * 
	 *      displayObject.addEventListener("click", handleClick);
	 *      function handleClick(event) {
	 *         // Click happened.
	 *      }
	 */
	function addEventListener(type:String, listener:Dynamic, ?useCapture:Bool) : Dynamic;
	/**
	 * A shortcut method for using addEventListener that makes it easier to specify an execution scope, have a listener
	 * only run once, associate arbitrary data with the listener, and remove the listener.
	 * 
	 * This method works by creating an anonymous wrapper function and subscribing it with addEventListener.
	 * The created anonymous function is returned for use with .removeEventListener (or .off).
	 * 
	 * <h4>Example</h4>
	 * 
	 * 		var listener = myBtn.on("click", handleClick, null, false, {count:3});
	 * 		function handleClick(evt, data) {
	 * 			data.count -= 1;
	 * 			console.log(this == myBtn); // true - scope defaults to the dispatcher
	 * 			if (data.count == 0) {
	 * 				alert("clicked 3 times!");
	 * 				myBtn.off("click", listener);
	 * 				// alternately: evt.remove();
	 * 			}
	 * 		}
	 */
	function on(type:String, listener:Dynamic, ?scope:Dynamic, ?once:Bool, ?data:Dynamic, ?useCapture:Bool) : Dynamic;
	/**
	 * Removes the specified event listener.
	 * 
	 * <b>Important Note:</b> that you must pass the exact function reference used when the event was added. If a proxy
	 * function, or function closure is used as the callback, the proxy/closure reference must be used - a new proxy or
	 * closure will not work.
	 * 
	 * <h4>Example</h4>
	 * 
	 *      displayObject.removeEventListener("click", handleClick);
	 */
	function removeEventListener(type:String, listener:Dynamic, ?useCapture:Bool) : Void;
	/**
	 * A shortcut to the removeEventListener method, with the same parameters and return value. This is a companion to the
	 * .on method.
	 */
	function off(type:String, listener:Dynamic, ?useCapture:Bool) : Void;
	/**
	 * Removes all listeners for the specified type, or all listeners of all types.
	 * 
	 * <h4>Example</h4>
	 * 
	 *      // Remove all listeners
	 *      displayObject.removeAllEventListeners();
	 * 
	 *      // Remove all click listeners
	 *      displayObject.removeAllEventListeners("click");
	 */
	function removeAllEventListeners(?type:String) : Void;
	/**
	 * Dispatches the specified event to all listeners.
	 * 
	 * <h4>Example</h4>
	 * 
	 *      // Use a string event
	 *      this.dispatchEvent("complete");
	 * 
	 *      // Use an Event instance
	 *      var event = new createjs.Event("progress");
	 *      this.dispatchEvent(event);
	 */
	function dispatchEvent(eventObj:Dynamic) : Bool;
	/**
	 * Indicates whether there is at least one listener for the specified event type.
	 */
	function hasEventListener(type:String) : Bool;
	/**
	 * Indicates whether there is at least one listener for the specified event type on this object or any of its
	 * ancestors (parent, parent's parent, etc). A return value of true indicates that if a bubbling event of the
	 * specified type is dispatched from this object, it will trigger at least one listener.
	 * 
	 * This is similar to {{#crossLink "EventDispatcher/hasEventListener"}}{{/crossLink}}, but it searches the entire
	 * event flow for a listener, not just this object.
	 */
	function willTrigger(type:String) : Bool;
	function toString() : String;
}