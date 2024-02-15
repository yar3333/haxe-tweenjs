package createjs;

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
 * Please see the <a href="http://www.createjs.com/Demos/TweenJS/Tween_SparkTable">spark table demo</a> for an
 * overview of the different ease types on <a href="http://tweenjs.com">TweenJS.com</a>.
 * 
 * <em>Equations derived from work by Robert Penner.</em>
 */
extern class Ease
{
	static function linear(t:Float) : Float;

	/**
	 * Identical to linear.
	 */
	static function none(t:Float) : Float;

	/**
	 * Mimics the simple -100 to 100 easing in Adobe Flash/Animate.
	 */
	static function get(amount:Float) : (t:Float) -> Float;
	/**
	 * Configurable exponential ease.
	 */
	static function getPowIn(pow:Float) : (t:Float) -> Float;
	/**
	 * Configurable exponential ease.
	 */
	static function getPowOut(pow:Float) : (t:Float) -> Float;
	/**
	 * Configurable exponential ease.
	 */
	static function getPowInOut(pow:Float) : (t:Float) -> Float;

	static function quadIn(t:Float) : Float;
	static function quadOut(t:Float) : Float;
	static function quadInOut(t:Float) : Float;
	static function cubicIn(t:Float) : Float;
	static function cubicOut(t:Float) : Float;
	static function cubicInOut(t:Float) : Float;
	static function quartIn(t:Float) : Float;
	static function quartOut(t:Float) : Float;
	static function quartInOut(t:Float) : Float;
	static function quintIn(t:Float) : Float;
	static function quintOut(t:Float) : Float;
	static function quintInOut(t:Float) : Float;
	static function sineIn(t:Float) : Float;
	static function sineOut(t:Float) : Float;
	static function sineInOut(t:Float) : Float;
	
    /**
	 * Configurable "back in" ease.
	 */
	static function getBackIn(amount:Float) : (t:Float) -> Float;
    static function backIn(t:Float) : Float;
	
    /**
	 * Configurable "back out" ease.
	 */
	static function getBackOut(amount:Float) : (t:Float) -> Float;
	static function backOut(t:Float) : Float;

	/**
	 * Configurable "back in out" ease.
	 */
	static function getBackInOut(amount:Float) : (t:Float) -> Float;
	static function backInOut(t:Float) : Float;

	static function circIn(t:Float) : Float;
	static function circOut(t:Float) : Float;
	static function circInOut(t:Float) : Float;
	static function bounceIn(t:Float) : Float;
	static function bounceOut(t:Float) : Float;
	static function bounceInOut(t:Float) : Float;

	/**
	 * Configurable elastic ease.
	 */
	static function getElasticIn(amplitude:Float, period:Float) : (t:Float) -> Float;
	static function elasticIn(t:Float) : Float;

	/**
	 * Configurable elastic ease.
	 */
	static function getElasticOut(amplitude:Float, period:Float) : (t:Float) -> Float;
	static function elasticOut(t:Float) : Float;

	/**
	 * Configurable elastic ease.
	 */
	static function getElasticInOut(amplitude:Float, period:Float) : (t:Float) -> Float;
	static function elasticInOut(t:Float) : Float;
}