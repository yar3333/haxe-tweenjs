package tweenjs;

/**
 * The Ease class provides a collection of easing functions for use with TweenJS. It does not use the standard 4 param
 * easing signature. Instead it uses a single param which indicates the current linear ratio (0 to 1) of the tween.
 * 
 * Most methods on Ease can be passed directly as easing functions:
 * 
 *      Tween.get(target).to({x:100}, 500, Ease.linear);
 * 
 * However, methods beginning with "get" will return an easing function based on parameter values:
 * 
 *      Tween.get(target).to({y:200}, 500, Ease.getPowIn(2.2));
 * 
 * Please see the <a href="http://www.createjs.com/#!/TweenJS/demos/sparkTable">spark table demo</a> for an overview
 * of the different ease types on <a href="http://tweenjs.com">TweenJS.com</a>.
 * 
 * <i>Equations derived from work by Robert Penner.</i>
 */
@:native("createjs.Ease")
extern class Ease
{
	static function linear() : Void;
	/**
	 * Identical to linear.
	 */
	static function none() : Void;
	/**
	 * Mimics the simple -100 to 100 easing in Flash Pro.
	 */
	static function get(amount:Float) : Void;
	/**
	 * Configurable exponential ease.
	 */
	static function getPowIn(pow:Float) : Void;
	/**
	 * Configurable exponential ease.
	 */
	static function getPowOut(pow:Float) : Void;
	/**
	 * Configurable exponential ease.
	 */
	static function getPowInOut(pow:Float) : Void;
	static function quadIn(t:Float) : Void;
	static function quadOut(t:Float) : Void;
	static function quadInOut(t:Float) : Void;
	static function cubicIn(t:Float) : Void;
	static function cubicOut(t:Float) : Void;
	static function cubicInOut(t:Float) : Void;
	static function quartIn(t:Float) : Void;
	static function quartOut(t:Float) : Void;
	static function quartInOut() : Void;
	static function quintIn(t:Float) : Void;
	static function quintOut(t:Float) : Void;
	static function quintInOut(t:Float) : Void;
	static function sineIn(t:Float) : Void;
	static function sineOut(t:Float) : Void;
	static function sineInOut(t:Float) : Void;
	/**
	 * Configurable "back in" ease.
	 */
	static function getBackIn(amount:Float) : Void;
	static function backIn() : Void;
	/**
	 * Configurable "back out" ease.
	 */
	static function getBackOut(amount:Float) : Void;
	static function backOut(t:Float) : Void;
	/**
	 * Configurable "back in out" ease.
	 */
	static function getBackInOut(amount:Float) : Void;
	static function backInOut(t:Float) : Void;
	static function circIn(t:Float) : Void;
	static function circOut(t:Float) : Void;
	static function circInOut(t:Float) : Void;
	static function bounceIn(t:Float) : Void;
	static function bounceOut(t:Float) : Void;
	static function bounceInOut(t:Float) : Void;
	/**
	 * Configurable elastic ease.
	 */
	static function getElasticIn(amplitude:Float, period:Float) : Void;
	static function elasticIn(t:Float) : Void;
	/**
	 * Configurable elastic ease.
	 */
	static function getElasticOut(amplitude:Float, period:Float) : Void;
	static function elasticOut(t:Float) : Void;
	/**
	 * Configurable elastic ease.
	 */
	static function getElasticInOut(amplitude:Float, period:Float) : Void;
	static function elasticInOut(t:Float) : Void;
}