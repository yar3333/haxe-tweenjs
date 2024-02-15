package tweenjs;

@:native('createjs.TweenJS')
extern class TweenJS
{
	/**
	 * The version string for this release.
	 * @property version
	 * @type {String}
	 * @static
	 **/
	static var version(default, null) : String;
	
	/**
	 * The build date for this release in UTC format.
	 * @property buildDate
	 * @type {String}
	 * @static
	 **/
	static var buildDate(default, null) : String;
}
