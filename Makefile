OPTIONS+= -src out/data.json
OPTIONS+= --remove-path-prefix native
OPTIONS+= --native-package createjs
OPTIONS+= --apply-native-package

OPTIONS+= -ifile createjs/utils/extend.js 
OPTIONS+= -ifile createjs/utils/indexOf.js 
OPTIONS+= -ifile createjs/utils/promote.js 
OPTIONS+= -ifile tweenjs/version.js
OPTIONS+= -ifile tweenjs/SamplePlugin.js 

convert:
	yuidoc -p -o out native
	haxelib run yuidoc2haxe $(OPTIONS) library
	rm -r out
