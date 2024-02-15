package tweenjs.plugins;

import js.lib.RegExp;

/**
 * A TweenJS plugin for working with numeric CSS string properties (ex. top, left). To use simply install after
 * TweenJS has loaded:
 * 
 * 	createjs.CSSPlugin.install();
 * 
 * CSSPlugin works with almost any style property or unit. It identifies CSS values by looking for an initial value
 * on the element's `style` object. It also uses this initial value to parse out the units to use with that value.
 * 
 * In the following example, `top` would be tweened as a style using `em` units using CSSPlugin, but `width` 
 * would be not be tweened as a style (because there is no initial inline style value for it).
 * 
 * 	myEl.style.top = "10em";
 * 	createjs.Tween.get(myEl).to({top:20, width:100}, 1000);
 * 
 * CSSPlugin can also use computed styles. Please see {{#crossLink "AbstractTween/compute:property"}}{{/crossLink}}
 * for more information.
 * 
 * CSSPlugin has specific handling for the `transform` style, and will tween any transforms as long as their operations
 * and units match. For example:
 * 
 * 	myEl.style.transform = "translate(20px, 30px)";
 * 	createjs.Tween.get(myEl)
 * 		.to({transform: "translate(40px, 50px)"}, 900) // would be tweened, everything matches
 * 		.to({transform: "translate(5em, 300px)"}, 900) // would NOT be tweened, different units (px vs em)
 * 		.to({transform: "scaleX(2)"}, 900) // would NOT be tweened, different operations (translate vs rotate)
 * 
 * You can also use `*` to copy the operation at that position from the previous transform.
 * 
 * 	myEl.style.transform = "translate(0px, 0px) rotate(0deg)";
 * 	createjs.Tween.get(myEl)
 * 		.to({transform: "translate(50px, 50px) *"}, 900) // would copy the "rotate" operation
 * 		.to({transform: "* rotate(90deg)"}, 900) // would copy the "translate" operation
 * 
 * Please note that the CSS Plugin is not included in the TweenJS minified file.
 */
@:native('createjs.CSSPlugin')
extern class CSSPlugin
{
	/**
	 * READ-ONLY. A unique identifying string for this plugin. Used by TweenJS to ensure duplicate plugins are not installed on a tween.
	 */
	static var ID(default, null) : String;

	/**
	 * READ-ONLY.
	 */
	static var VALUE_RE(default, null) : RegExp;

	/**
	 * By default, CSSPlugin uses only inline styles on the target element (ie. set via the style attribute, `style` property, or `cssText`)
	 * to determine which properties should be tweened via CSS, and what units to use.
	 * 
	 * Setting `compute` to `true` causes CSSPlugin to use `getComputedStyle` for this purpose. This has the advantage of
	 * including all styles that effect the target element, however there are some important considerations for its use:<UL>
	 * 	<LI> `getComputedStyle` is computationally expensive, which could lead to performance issues if you are creating a large
	 * 	number of tweens at once.
	 * 	<LI> styles are normalized. For example, a width value specified as a `%` may be computed as `px`, which CSSPlugin will
	 * 	use for the tween. Different browsers _may_ normalize values differently.
	 * 	<LI> there are a large number of computed styles, which increases the chance that a property will be identified as a style.
	 * 	<LI> does not work with IE8 or below.
	 * 	</UL>
	 * 	
	 * 	The `compute` setting can be overridden on a per-tween basis by setting `tween.pluginData.CSS_compute`. For example,
	 * 	to enable computed styles for a new tween, you could use:
	 * 	
	 * 		createjs.Tween.get(el, {pluginData:{CSS_compute:true}}).to({top:20}, 1000);
	 * 	
	 * 	Given the considerations for `compute`, it is recommended that you keep the default global setting of `false` and override it
	 * 	in specific cases via `pluginData`.
	 */
	static var compute : Bool;

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