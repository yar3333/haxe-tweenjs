package createjs;

typedef TickerTickEvent =
{
	var target : Dynamic;
	var type : String;
	var paused : Bool;
	var delta : Float;
	var time : Float;
	var runTime : Float;
}

/**
 * The Ticker provides a centralized tick or heartbeat broadcast at a set interval. Listeners can subscribe to the tick
 * event to be notified when a set time interval has elapsed.
 * 
 * Note that the interval that the tick event is called is a target interval, and may be broadcast at a slower interval
 * when under high CPU load. The Ticker class uses a static interface (ex. `Ticker.framerate = 30;`) and
 * can not be instantiated.
 * 
 * <h4>Example</h4>
 * 
 *      createjs.Ticker.addEventListener("tick", handleTick);
 *      function handleTick(event) {
 *          // Actions carried out each tick (aka frame)
 *          if (!event.paused) {
 *              // Actions carried out when the Ticker is not paused.
 *          }
 *      }
 */
@:native("createjs.Ticker")
extern class Ticker
{
	/**
	 * In this mode, Ticker uses the requestAnimationFrame API, but attempts to synch the ticks to target framerate. It
	 * uses a simple heuristic that compares the time of the RAF return to the target time for the current frame and
	 * dispatches the tick when the time is within a certain threshold.
	 * 
	 * This mode has a higher variance for time between frames than TIMEOUT, but does not require that content be time
	 * based as with RAF while gaining the benefits of that API (screen synch, background throttling).
	 * 
	 * Variance is usually lowest for framerates that are a divisor of the RAF frequency. This is usually 60, so
	 * framerates of 10, 12, 15, 20, and 30 work well.
	 * 
	 * Falls back on TIMEOUT if the requestAnimationFrame API is not supported.
	 */
	static var RAF_SYNCHED : String;
	/**
	 * In this mode, Ticker passes through the requestAnimationFrame heartbeat, ignoring the target framerate completely.
	 * Because requestAnimationFrame frequency is not deterministic, any content using this mode should be time based.
	 * You can leverage {{#crossLink "Ticker/getTime"}}{{/crossLink}} and the tick event object's "delta" properties
	 * to make this easier.
	 * 
	 * Falls back on TIMEOUT if the requestAnimationFrame API is not supported.
	 */
	static var RAF : String;
	/**
	 * In this mode, Ticker uses the setTimeout API. This provides predictable, adaptive frame timing, but does not
	 * provide the benefits of requestAnimationFrame (screen synch, background throttling).
	 */
	static var TIMEOUT : String;
	/**
	 * Specifies the timing api (setTimeout or requestAnimationFrame) and mode to use. See
	 * {{#crossLink "Ticker/TIMEOUT"}}{{/crossLink}}, {{#crossLink "Ticker/RAF"}}{{/crossLink}}, and
	 * {{#crossLink "Ticker/RAF_SYNCHED"}}{{/crossLink}} for mode details.
	 */
	static var timingMode : String;
	/**
	 * Specifies a maximum value for the delta property in the tick event object. This is useful when building time
	 * based animations and systems to prevent issues caused by large time gaps caused by background tabs, system sleep,
	 * alert dialogs, or other blocking routines. Double the expected frame duration is often an effective value
	 * (ex. maxDelta=50 when running at 40fps).
	 * 
	 * This does not impact any other values (ex. time, runTime, etc), so you may experience issues if you enable maxDelta
	 * when using both delta and other values.
	 * 
	 * If 0, there is no maximum.
	 */
	static var maxDelta : Float;
	/**
	 * When the ticker is paused, all listeners will still receive a tick event, but the <code>paused</code> property of the event will be false.
	 * Also, while paused the `runTime` will not increase. See {{#crossLink "Ticker/tick:event"}}{{/crossLink}},
	 * {{#crossLink "Ticker/getTime"}}{{/crossLink}}, and {{#crossLink "Ticker/getEventTime"}}{{/crossLink}} for more info.
	 * 
	 * <h4>Example</h4>
	 * 
	 *      createjs.Ticker.addEventListener("tick", handleTick);
	 *      createjs.Ticker.paused = true;
	 *      function handleTick(event) {
	 *          console.log(event.paused,
	 *          	createjs.Ticker.getTime(false),
	 *          	createjs.Ticker.getTime(true));
	 *      }
	 */
	static var paused : Bool;
	/**
	 * Indicates the target time (in milliseconds) between ticks. Default is 50 (20 FPS).
	 * Note that actual time between ticks may be more than specified depending on CPU load.
	 * This property is ignored if the ticker is using the `RAF` timing mode.
	 */
	static var interval : Float;
	/**
	 * Indicates the target frame rate in frames per second (FPS). Effectively just a shortcut to `interval`, where
	 * `framerate == 1000/interval`.
	 */
	static var framerate : Float;

	/**
	 * Starts the tick. This is called automatically when the first listener is added.
	 */
	static function init() : Void;
	/**
	 * Stops the Ticker and removes all listeners. Use init() to restart the Ticker.
	 */
	static function reset() : Void;
	/**
	 * Returns the average time spent within a tick. This can vary significantly from the value provided by getMeasuredFPS
	 * because it only measures the time spent within the tick execution stack. 
	 * 
	 * Example 1: With a target FPS of 20, getMeasuredFPS() returns 20fps, which indicates an average of 50ms between 
	 * the end of one tick and the end of the next. However, getMeasuredTickTime() returns 15ms. This indicates that 
	 * there may be up to 35ms of "idle" time between the end of one tick and the start of the next.
	 * 
	 * Example 2: With a target FPS of 30, getFPS() returns 10fps, which indicates an average of 100ms between the end of
	 * one tick and the end of the next. However, getMeasuredTickTime() returns 20ms. This would indicate that something
	 * other than the tick is using ~80ms (another script, DOM rendering, etc).
	 */
	static function getMeasuredTickTime(?ticks:Float) : Float;
	/**
	 * Returns the actual frames / ticks per second.
	 */
	static function getMeasuredFPS(?ticks:Float) : Float;
	/**
	 * Returns the number of milliseconds that have elapsed since Ticker was initialized via {{#crossLink "Ticker/init"}}.
	 * Returns -1 if Ticker has not been initialized. For example, you could use
	 * this in a time synchronized animation to determine the exact amount of time that has elapsed.
	 */
	static function getTime(?runTime:Bool) : Float;
	/**
	 * Similar to getTime(), but returns the time on the most recent tick event object.
	 */
	static function getEventTime(runTime:Bool) : Float;
	/**
	 * Returns the number of ticks that have been broadcast by Ticker.
	 */
	static function getTicks(pauseable:Bool) : Float;
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
	static function addEventListener(type:String, listener:Dynamic, ?useCapture:Bool) : Dynamic;
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
	static function on(type:String, listener:Dynamic, ?scope:Dynamic, ?once:Bool, ?data:Dynamic, ?useCapture:Bool) : Dynamic;
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
	static function removeEventListener(type:String, listener:Dynamic, ?useCapture:Bool) : Void;
	/**
	 * A shortcut to the removeEventListener method, with the same parameters and return value. This is a companion to the
	 * .on method.
	 */
	static function off(type:String, listener:Dynamic, ?useCapture:Bool) : Void;
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
	static function removeAllEventListeners(?type:String) : Void;
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
	static function dispatchEvent(eventObj:Dynamic) : Bool;
	/**
	 * Indicates whether there is at least one listener for the specified event type.
	 */
	static function hasEventListener(type:String) : Bool;
	/**
	 * Indicates whether there is at least one listener for the specified event type on this object or any of its
	 * ancestors (parent, parent's parent, etc). A return value of true indicates that if a bubbling event of the
	 * specified type is dispatched from this object, it will trigger at least one listener.
	 * 
	 * This is similar to {{#crossLink "EventDispatcher/hasEventListener"}}{{/crossLink}}, but it searches the entire
	 * event flow for a listener, not just this object.
	 */
	static function willTrigger(type:String) : Bool;
	function toString() : String;

	/**
	 * Dispatched each tick. The event will be dispatched to each listener even when the Ticker has been paused using
	 * {{#crossLink "Ticker/setPaused"}}{{/crossLink}}.
	 * 
	 * <h4>Example</h4>
	 * 
	 *      createjs.Ticker.addEventListener("tick", handleTick);
	 *      function handleTick(event) {
	 *          console.log("Paused:", event.paused, event.delta);
	 *      }
	 */
	static inline function addTickEventListener(handler:TickerTickEvent->Void) : Dynamic return addEventListener("tick", handler);
}