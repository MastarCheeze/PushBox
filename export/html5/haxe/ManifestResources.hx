package;


import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_pixelfont_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:pathy30:assets%2Fmusic%2Fpush_box.ceoly4:sizei719y4:typey4:TEXTy2:idR1y7:preloadtgoR2i1767701R3y5:MUSICR5y29:assets%2Fmusic%2Fpush_box.oggy9:pathGroupaR8hR6tgoR0y33:assets%2Fimages%2Fexit_button.pngR2i305R3y5:IMAGER5R10R6tgoR0y49:assets%2Fimages%2Finstructions%2Finstruction7.pngR2i805R3R11R5R12R6tgoR0y50:assets%2Fimages%2Finstructions%2Finstruction14.pngR2i1136R3R11R5R13R6tgoR0y50:assets%2Fimages%2Finstructions%2Finstruction16.pngR2i726R3R11R5R14R6tgoR0y56:assets%2Fimages%2Finstructions%2Fmobile_instruction1.pngR2i1388R3R11R5R15R6tgoR0y52:assets%2Fimages%2Finstructions%2Fpc_instruction1.pngR2i1448R3R11R5R16R6tgoR0y49:assets%2Fimages%2Finstructions%2Finstruction8.pngR2i721R3R11R5R17R6tgoR0y35:assets%2Fimages%2Flevel_buttons.pngR2i246R3R11R5R18R6tgoR0y35:assets%2Fimages%2Fpiston_pusher.pngR2i209R3R11R5R19R6tgoR0y35:assets%2Fimages%2Fpush_box_icon.pngR2i487R3R11R5R20R6tgoR0y35:assets%2Fimages%2Fpiston_button.pngR2i223R3R11R5R21R6tgoR0y30:assets%2Fimages%2Fbox_slot.pngR2i201R3R11R5R22R6tgoR0y32:assets%2Fimages%2Fteleporter.pngR2i235R3R11R5R23R6tgoR0y26:assets%2Fimages%2Fwall.pngR2i185R3R11R5R24R6tgoR0y27:assets%2Fimages%2Fcover.pngR2i7442R3R11R5R25R6tgoR0y33:assets%2Fimages%2Fback_button.pngR2i278R3R11R5R26R6tgoR0y33:assets%2Fimages%2Fpiston_base.pngR2i225R3R11R5R27R6tgoR0y29:assets%2Fimages%2Ftileset.pngR2i205R3R11R5R28R6tgoR0y33:assets%2Fimages%2Fplay_button.pngR2i307R3R11R5R29R6tgoR0y25:assets%2Fimages%2Fbox.pngR2i236R3R11R5R30R6tgoR0y34:assets%2Fimages%2Freset_button.pngR2i306R3R11R5R31R6tgoR0y28:assets%2Fimages%2Fplayer.pngR2i263R3R11R5R32R6tgoR2i62850R3y5:SOUNDR5y26:assets%2Fsounds%2Fdrag.wavR9aR34hR6tgoR2i37250R3R33R5y26:assets%2Fsounds%2Fmove.wavR9aR35hR6tgoR2i24792R3R33R5y33:assets%2Fsounds%2Fclick_start.wavR9aR36hR6tgoR2i63512R3R33R5y36:assets%2Fsounds%2Fpiston_retract.wavR9aR37hR6tgoR2i43622R3R33R5y30:assets%2Fsounds%2Fteleport.wavR9aR38hR6tgoR2i63440R3R33R5y35:assets%2Fsounds%2Fpiston_extend.wavR9aR39hR6tgoR2i50010R3R33R5y31:assets%2Fsounds%2Fteleport2.wavR9aR40hR6tgoR2i31196R3R33R5y31:assets%2Fsounds%2Fclick_end.wavR9aR41hR6tgoR2i31412R3R33R5y26:assets%2Fsounds%2Fsnap.wavR9aR42hR6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R43R6tgoR2i356024R3R33R5y29:assets%2Fsounds%2Fblocked.wavR9aR44hR6tgoR2i10616R3y4:FONTy9:classNamey35:__ASSET__assets_fonts_pixelfont_ttfR5y30:assets%2Ffonts%2FPixelFont.ttfR6tgoR0y27:assets%2Fdata%2Flevel2.jsonR2i3245R3R4R5R49R6tgoR0y28:assets%2Fdata%2Flevel10.jsonR2i6375R3R4R5R50R6tgoR0y28:assets%2Fdata%2Flevel11.jsonR2i5436R3R4R5R51R6tgoR0y29:assets%2Fdata%2Fpush_box.ogmoR2i10199R3R4R5R52R6tgoR0y27:assets%2Fdata%2Flevel3.jsonR2i3661R3R4R5R53R6tgoR0y27:assets%2Fdata%2Flevel8.jsonR2i4560R3R4R5R54R6tgoR0y28:assets%2Fdata%2Flevel20.jsonR2i6873R3R4R5R55R6tgoR0y27:assets%2Fdata%2Flevel4.jsonR2i4908R3R4R5R56R6tgoR0y28:assets%2Fdata%2Flevel16.jsonR2i5269R3R4R5R57R6tgoR0y28:assets%2Fdata%2Flevel17.jsonR2i3647R3R4R5R58R6tgoR0y27:assets%2Fdata%2Flevel5.jsonR2i4393R3R4R5R59R6tgoR0y28:assets%2Fdata%2Flevel21.jsonR2i5451R3R4R5R60R6tgoR0y27:assets%2Fdata%2Flevel9.jsonR2i5222R3R4R5R61R6tgoR0y28:assets%2Fdata%2Flevel18.jsonR2i5211R3R4R5R62R6tgoR0y28:assets%2Fdata%2Flevel22.jsonR2i7085R3R4R5R63R6tgoR0y28:assets%2Fdata%2Flevel14.jsonR2i3675R3R4R5R64R6tgoR0y27:assets%2Fdata%2Flevel6.jsonR2i5637R3R4R5R65R6tgoR0y27:assets%2Fdata%2Flevel7.jsonR2i4488R3R4R5R66R6tgoR0y28:assets%2Fdata%2Flevel15.jsonR2i3950R3R4R5R67R6tgoR0y28:assets%2Fdata%2Flevel23.jsonR2i6130R3R4R5R68R6tgoR0y28:assets%2Fdata%2Flevel19.jsonR2i6508R3R4R5R69R6tgoR0y28:assets%2Fdata%2Flevel12.jsonR2i6489R3R4R5R70R6tgoR0y28:assets%2Fdata%2Flevel24.jsonR2i8776R3R4R5R71R6tgoR0y28:assets%2Fdata%2Flevel25.jsonR2i5431R3R4R5R72R6tgoR0y27:assets%2Fdata%2Flevel1.jsonR2i1223R3R4R5R73R6tgoR0y28:assets%2Fdata%2Flevel13.jsonR2i5076R3R4R5R74R6tgoR2i39706R3R7R5y28:flixel%2Fsounds%2Fflixel.mp3R9aR75y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i2114R3R7R5y26:flixel%2Fsounds%2Fbeep.mp3R9aR77y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i5794R3R33R5R78R9aR77R78hgoR2i33629R3R33R5R76R9aR75R76hgoR2i15744R3R45R46y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R45R46y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R11R5R83R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R11R5R84R6tgoR0y44:flixel%2Fflixel-ui%2Fimg%2Fdropdown_mark.pngR2i156R3R11R5R85R6tgoR0y40:flixel%2Fflixel-ui%2Fimg%2Fplus_mark.pngR2i147R3R11R5R86R6tgoR0y36:flixel%2Fflixel-ui%2Fimg%2Fradio.pngR2i191R3R11R5R87R6tgoR0y48:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_left.pngR2i459R3R11R5R88R6tgoR0y42:flixel%2Fflixel-ui%2Fimg%2Fbutton_thin.pngR2i247R3R11R5R89R6tgoR0y34:flixel%2Fflixel-ui%2Fimg%2Ftab.pngR2i201R3R11R5R90R6tgoR0y41:flixel%2Fflixel-ui%2Fimg%2Ffinger_big.pngR2i1724R3R11R5R91R6tgoR0y36:flixel%2Fflixel-ui%2Fimg%2Finvis.pngR2i128R3R11R5R92R6tgoR0y43:flixel%2Fflixel-ui%2Fimg%2Fchrome_inset.pngR2i192R3R11R5R93R6tgoR0y44:flixel%2Fflixel-ui%2Fimg%2Ftooltip_arrow.pngR2i18509R3R11R5R94R6tgoR0y49:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_right.pngR2i511R3R11R5R95R6tgoR0y40:flixel%2Fflixel-ui%2Fimg%2Fradio_dot.pngR2i153R3R11R5R96R6tgoR0y37:flixel%2Fflixel-ui%2Fimg%2Fchrome.pngR2i253R3R11R5R97R6tgoR0y40:flixel%2Fflixel-ui%2Fimg%2Fcheck_box.pngR2i922R3R11R5R98R6tgoR0y44:flixel%2Fflixel-ui%2Fimg%2Fbutton_toggle.pngR2i534R3R11R5R99R6tgoR0y46:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_up.pngR2i493R3R11R5R100R6tgoR0y41:flixel%2Fflixel-ui%2Fimg%2Fminus_mark.pngR2i136R3R11R5R101R6tgoR0y42:flixel%2Fflixel-ui%2Fimg%2Fchrome_flat.pngR2i212R3R11R5R102R6tgoR0y37:flixel%2Fflixel-ui%2Fimg%2Fswatch.pngR2i185R3R11R5R103R6tgoR0y43:flixel%2Fflixel-ui%2Fimg%2Fchrome_light.pngR2i214R3R11R5R104R6tgoR0y38:flixel%2Fflixel-ui%2Fimg%2Fhilight.pngR2i129R3R11R5R105R6tgoR0y41:flixel%2Fflixel-ui%2Fimg%2Fcheck_mark.pngR2i946R3R11R5R106R6tgoR0y39:flixel%2Fflixel-ui%2Fimg%2Ftab_back.pngR2i210R3R11R5R107R6tgoR0y34:flixel%2Fflixel-ui%2Fimg%2Fbox.pngR2i912R3R11R5R108R6tgoR0y43:flixel%2Fflixel-ui%2Fimg%2Ffinger_small.pngR2i294R3R11R5R109R6tgoR0y37:flixel%2Fflixel-ui%2Fimg%2Fbutton.pngR2i433R3R11R5R110R6tgoR0y48:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_down.pngR2i446R3R11R5R111R6tgoR0y44:flixel%2Fflixel-ui%2Fxml%2Fdefault_popup.xmlR2i1848R3R4R5R112R6tgoR0y53:flixel%2Fflixel-ui%2Fxml%2Fdefault_loading_screen.xmlR2i1953R3R4R5R113R6tgoR0y39:flixel%2Fflixel-ui%2Fxml%2Fdefaults.xmlR2i1263R3R4R5R114R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_push_box_ceol extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_push_box_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_exit_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_instructions_instruction7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_instructions_instruction14_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_instructions_instruction16_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_instructions_mobile_instruction1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_instructions_pc_instruction1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_instructions_instruction8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_level_buttons_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_piston_pusher_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_push_box_icon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_piston_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_box_slot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_teleporter_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_wall_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_cover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_back_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_piston_base_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_tileset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_play_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_reset_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_player_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_drag_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_move_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_click_start_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_piston_retract_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_teleport_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_piston_extend_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_teleport2_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_click_end_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_snap_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_blocked_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_pixelfont_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level2_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level10_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level11_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_push_box_ogmo extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level3_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level8_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level20_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level4_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level16_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level17_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level5_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level21_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level9_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level18_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level22_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level14_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level6_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level7_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level15_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level23_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level19_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level12_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level24_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level25_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level1_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level13_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/music/push_box.ceol") @:noCompletion #if display private #end class __ASSET__assets_music_push_box_ceol extends haxe.io.Bytes {}
@:keep @:file("assets/music/push_box.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_push_box_ogg extends haxe.io.Bytes {}
@:keep @:image("assets/images/exit_button.png") @:noCompletion #if display private #end class __ASSET__assets_images_exit_button_png extends lime.graphics.Image {}
@:keep @:image("assets/images/instructions/instruction7.png") @:noCompletion #if display private #end class __ASSET__assets_images_instructions_instruction7_png extends lime.graphics.Image {}
@:keep @:image("assets/images/instructions/instruction14.png") @:noCompletion #if display private #end class __ASSET__assets_images_instructions_instruction14_png extends lime.graphics.Image {}
@:keep @:image("assets/images/instructions/instruction16.png") @:noCompletion #if display private #end class __ASSET__assets_images_instructions_instruction16_png extends lime.graphics.Image {}
@:keep @:image("assets/images/instructions/mobile_instruction1.png") @:noCompletion #if display private #end class __ASSET__assets_images_instructions_mobile_instruction1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/instructions/pc_instruction1.png") @:noCompletion #if display private #end class __ASSET__assets_images_instructions_pc_instruction1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/instructions/instruction8.png") @:noCompletion #if display private #end class __ASSET__assets_images_instructions_instruction8_png extends lime.graphics.Image {}
@:keep @:image("assets/images/level_buttons.png") @:noCompletion #if display private #end class __ASSET__assets_images_level_buttons_png extends lime.graphics.Image {}
@:keep @:image("assets/images/piston_pusher.png") @:noCompletion #if display private #end class __ASSET__assets_images_piston_pusher_png extends lime.graphics.Image {}
@:keep @:image("assets/images/push_box_icon.png") @:noCompletion #if display private #end class __ASSET__assets_images_push_box_icon_png extends lime.graphics.Image {}
@:keep @:image("assets/images/piston_button.png") @:noCompletion #if display private #end class __ASSET__assets_images_piston_button_png extends lime.graphics.Image {}
@:keep @:image("assets/images/box_slot.png") @:noCompletion #if display private #end class __ASSET__assets_images_box_slot_png extends lime.graphics.Image {}
@:keep @:image("assets/images/teleporter.png") @:noCompletion #if display private #end class __ASSET__assets_images_teleporter_png extends lime.graphics.Image {}
@:keep @:image("assets/images/wall.png") @:noCompletion #if display private #end class __ASSET__assets_images_wall_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cover.png") @:noCompletion #if display private #end class __ASSET__assets_images_cover_png extends lime.graphics.Image {}
@:keep @:image("assets/images/back_button.png") @:noCompletion #if display private #end class __ASSET__assets_images_back_button_png extends lime.graphics.Image {}
@:keep @:image("assets/images/piston_base.png") @:noCompletion #if display private #end class __ASSET__assets_images_piston_base_png extends lime.graphics.Image {}
@:keep @:image("assets/images/tileset.png") @:noCompletion #if display private #end class __ASSET__assets_images_tileset_png extends lime.graphics.Image {}
@:keep @:image("assets/images/play_button.png") @:noCompletion #if display private #end class __ASSET__assets_images_play_button_png extends lime.graphics.Image {}
@:keep @:image("assets/images/box.png") @:noCompletion #if display private #end class __ASSET__assets_images_box_png extends lime.graphics.Image {}
@:keep @:image("assets/images/reset_button.png") @:noCompletion #if display private #end class __ASSET__assets_images_reset_button_png extends lime.graphics.Image {}
@:keep @:image("assets/images/player.png") @:noCompletion #if display private #end class __ASSET__assets_images_player_png extends lime.graphics.Image {}
@:keep @:file("assets/sounds/drag.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_drag_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/move.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_move_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/click_start.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_click_start_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/piston_retract.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_piston_retract_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/teleport.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_teleport_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/piston_extend.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_piston_extend_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/teleport2.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_teleport2_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/click_end.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_click_end_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/snap.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_snap_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/blocked.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_blocked_wav extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/PixelFont.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_pixelfont_ttf extends lime.text.Font {}
@:keep @:file("assets/data/level2.json") @:noCompletion #if display private #end class __ASSET__assets_data_level2_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level10.json") @:noCompletion #if display private #end class __ASSET__assets_data_level10_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level11.json") @:noCompletion #if display private #end class __ASSET__assets_data_level11_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/push_box.ogmo") @:noCompletion #if display private #end class __ASSET__assets_data_push_box_ogmo extends haxe.io.Bytes {}
@:keep @:file("assets/data/level3.json") @:noCompletion #if display private #end class __ASSET__assets_data_level3_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level8.json") @:noCompletion #if display private #end class __ASSET__assets_data_level8_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level20.json") @:noCompletion #if display private #end class __ASSET__assets_data_level20_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level4.json") @:noCompletion #if display private #end class __ASSET__assets_data_level4_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level16.json") @:noCompletion #if display private #end class __ASSET__assets_data_level16_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level17.json") @:noCompletion #if display private #end class __ASSET__assets_data_level17_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level5.json") @:noCompletion #if display private #end class __ASSET__assets_data_level5_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level21.json") @:noCompletion #if display private #end class __ASSET__assets_data_level21_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level9.json") @:noCompletion #if display private #end class __ASSET__assets_data_level9_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level18.json") @:noCompletion #if display private #end class __ASSET__assets_data_level18_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level22.json") @:noCompletion #if display private #end class __ASSET__assets_data_level22_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level14.json") @:noCompletion #if display private #end class __ASSET__assets_data_level14_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level6.json") @:noCompletion #if display private #end class __ASSET__assets_data_level6_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level7.json") @:noCompletion #if display private #end class __ASSET__assets_data_level7_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level15.json") @:noCompletion #if display private #end class __ASSET__assets_data_level15_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level23.json") @:noCompletion #if display private #end class __ASSET__assets_data_level23_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level19.json") @:noCompletion #if display private #end class __ASSET__assets_data_level19_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level12.json") @:noCompletion #if display private #end class __ASSET__assets_data_level12_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level24.json") @:noCompletion #if display private #end class __ASSET__assets_data_level24_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level25.json") @:noCompletion #if display private #end class __ASSET__assets_data_level25_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level1.json") @:noCompletion #if display private #end class __ASSET__assets_data_level1_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level13.json") @:noCompletion #if display private #end class __ASSET__assets_data_level13_json extends haxe.io.Bytes {}
@:keep @:file("/usr/local/lib/haxe/lib/flixel/4,9,0/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("/usr/local/lib/haxe/lib/flixel/4,9,0/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("/usr/local/lib/haxe/lib/flixel/4,9,0/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("/usr/local/lib/haxe/lib/flixel/4,9,0/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel/4,9,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel/4,9,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/dropdown_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/plus_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/radio.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/button_arrow_left.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/button_thin.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/tab.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/finger_big.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/invis.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/chrome_inset.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/tooltip_arrow.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/button_arrow_right.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/radio_dot.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/chrome.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/check_box.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/button_toggle.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/button_arrow_up.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/minus_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/chrome_flat.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/swatch.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/chrome_light.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/hilight.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/check_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/tab_back.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/box.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/finger_small.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/button.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/images/button_arrow_down.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends lime.graphics.Image {}
@:keep @:file("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/xml/default_popup.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends haxe.io.Bytes {}
@:keep @:file("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/xml/default_loading_screen.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends haxe.io.Bytes {}
@:keep @:file("/usr/local/lib/haxe/lib/flixel-ui/2,3,3/assets/xml/defaults.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends haxe.io.Bytes {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__assets_fonts_pixelfont_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_pixelfont_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/PixelFont"; #else ascender = 1024; descender = -256; height = 1309; numGlyphs = 89; underlinePosition = 77; underlineThickness = 51; unitsPerEM = 1024; #end name = "Early GameBoy Regular"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__assets_fonts_pixelfont_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_pixelfont_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_pixelfont_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__assets_fonts_pixelfont_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_pixelfont_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_pixelfont_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
