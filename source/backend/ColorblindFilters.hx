// from OS Engine, more filters made from Mic'd Up

package backend;

import openfl.filters.BitmapFilter;
import openfl.filters.ColorMatrixFilter;

class ColorblindFilters {
    // i honesly have no ideas how to make it, so i hope that works
    public static var filterArray:Array<BitmapFilter> = [];
	public static var filterMap:Map<String, {filter:BitmapFilter, ?onUpdate:Void->Void}> = [

        /*
            I found these values in official haxe guides :D
        */

        "Deuteranopia" => {
				var matrix:Array<Float> = [
					0.43, 0.72, -.15, 0, 0,
					0.34, 0.57, 0.09, 0, 0,
					-.02, 0.03,    1, 0, 0,
					   0,    0,    0, 1, 0,
				];

				{filter: new ColorMatrixFilter(matrix)}
			},
			"Protanopia" => {
				var matrix:Array<Float> = [
					0.20, 0.99, -.19, 0, 0,
					0.16, 0.79, 0.04, 0, 0,
					0.01, -.01,    1, 0, 0,
					   0,    0,    0, 1, 0,
				];

				{filter: new ColorMatrixFilter(matrix)}
			},
			"Tritanopia" => {
				var matrix:Array<Float> = [
					0.97, 0.11, -.08, 0, 0,
					0.02, 0.82, 0.16, 0, 0,
					0.06, 0.88, 0.18, 0, 0,
					   0,    0,    0, 1, 0,
				];

				{filter: new ColorMatrixFilter(matrix)}
			},
			"Virtual Boy" => {
				var matrix:Array<Float> = [
					0.9, 0, 0, 0, 1,
					  0, 0, 0, 0, 0,
					  0, 0, 0, 0, 0,
					  0, 0, 0, 1, 0,
				];

				{filter: new ColorMatrixFilter(matrix)}
			},
			"Gameboy" => {
				var matrix:Array<Float> = [
					0, 0,   0, 0, 0,
					0, 1.5, 0, 0, 1,
					0, 0,   0, 0, 0,
					0, 0,   0, 1, 0,
				];

				{filter: new ColorMatrixFilter(matrix)}
			},
			"Downer" => {
				var matrix:Array<Float> = [
					0, 0,   0, 0, 0,
					0, 0,   0, 0, 0,
					0, 0, 1.5, 0, 1,
					0, 0,   0, 1, 0,
				];

				{filter: new ColorMatrixFilter(matrix)}
			},
			"Grayscale" => {
				var matrix:Array<Float> = [
					.3, .3, .3, 0, 1,
					.3, .3, .3, 0, 1,
					.3, .3, .3, 0, 1,
					 0,  0,  0, 1, 0,
				];

				{filter: new ColorMatrixFilter(matrix)}
			},
			"Invert" => {
				var matrix:Array<Float> = [
					-1,  0,  0, 0, 255,
					 0, -1,  0, 0, 255,
					 0,  0, -1, 0, 255,
					 0,  0,  0, 1, 1,
				];

				{filter: new ColorMatrixFilter(matrix)}
			}
			
    ];

    public static function applyFiltersOnGame() {
        filterArray = [];
        FlxG.game.setFilters(filterArray);
        if (ClientPrefs.data.colorblindMode != "None") { // actually self explanatory, isn't it?
            if (filterMap.get(ClientPrefs.data.colorblindMode) != null) { // anticrash system
                var thisF = filterMap.get(ClientPrefs.data.colorblindMode).filter;
                if (thisF != null) {
                    filterArray.push(thisF);
                }
            }
        }
        FlxG.game.setFilters(filterArray);
    }
}