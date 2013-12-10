OPTIONS+= -src out/data.json
OPTIONS+= --remove-path-prefix native/src
OPTIONS+= --native-package createjs

OPTIONS+= -ifile createjs/utils/IndexOf.js 
OPTIONS+= -ifile tweenjs/version.js
OPTIONS+= -ifile tweenjs/SamplePlugin.js 

#OPTIONS+= -iitem initialize
#OPTIONS+= -iitem Stage.hitArea

#OPTIONS+= --type-map HTMLElement-js.html.Element
#OPTIONS+= --type-map HTMLCanvasElement-js.html.CanvasElement
#OPTIONS+= --type-map CanvasRenderingContext2D-js.html.CanvasRenderingContext2D
#OPTIONS+= --type-map Image-js.html.Image
#OPTIONS+= --type-map HtmlMouseEvent-js.html.MouseEvent

convert:
	yuidoc -p -o out native/src
	haxelib run yuidoc2haxe $(OPTIONS) library
