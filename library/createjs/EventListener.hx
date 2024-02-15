package createjs;

import haxe.Constraints.Function;
import haxe.extern.EitherType;

typedef EventListener = EitherType<Function, { handleEvent:Function }>;