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

		data = '{"name":null,"assets":"aoy4:sizei719y4:typey4:TEXTy9:classNamey35:__ASSET__assets_music_push_box_ceoly2:idy30:assets%2Fmusic%2Fpush_box.ceolgoR0i1767701R1y5:MUSICR3y34:__ASSET__assets_music_push_box_oggR5y29:assets%2Fmusic%2Fpush_box.ogggoR0i305R1y5:IMAGER3y38:__ASSET__assets_images_exit_button_pngR5y33:assets%2Fimages%2Fexit_button.pnggoR0i805R1R10R3y52:__ASSET__assets_images_instructions_instruction7_pngR5y49:assets%2Fimages%2Finstructions%2Finstruction7.pnggoR0i1136R1R10R3y53:__ASSET__assets_images_instructions_instruction14_pngR5y50:assets%2Fimages%2Finstructions%2Finstruction14.pnggoR0i726R1R10R3y53:__ASSET__assets_images_instructions_instruction16_pngR5y50:assets%2Fimages%2Finstructions%2Finstruction16.pnggoR0i1388R1R10R3y59:__ASSET__assets_images_instructions_mobile_instruction1_pngR5y56:assets%2Fimages%2Finstructions%2Fmobile_instruction1.pnggoR0i1448R1R10R3y55:__ASSET__assets_images_instructions_pc_instruction1_pngR5y52:assets%2Fimages%2Finstructions%2Fpc_instruction1.pnggoR0i721R1R10R3y52:__ASSET__assets_images_instructions_instruction8_pngR5y49:assets%2Fimages%2Finstructions%2Finstruction8.pnggoR0i246R1R10R3y40:__ASSET__assets_images_level_buttons_pngR5y35:assets%2Fimages%2Flevel_buttons.pnggoR0i209R1R10R3y40:__ASSET__assets_images_piston_pusher_pngR5y35:assets%2Fimages%2Fpiston_pusher.pnggoR0i487R1R10R3y40:__ASSET__assets_images_push_box_icon_pngR5y35:assets%2Fimages%2Fpush_box_icon.pnggoR0i223R1R10R3y40:__ASSET__assets_images_piston_button_pngR5y35:assets%2Fimages%2Fpiston_button.pnggoR0i201R1R10R3y35:__ASSET__assets_images_box_slot_pngR5y30:assets%2Fimages%2Fbox_slot.pnggoR0i235R1R10R3y37:__ASSET__assets_images_teleporter_pngR5y32:assets%2Fimages%2Fteleporter.pnggoR0i185R1R10R3y31:__ASSET__assets_images_wall_pngR5y26:assets%2Fimages%2Fwall.pnggoR0i7442R1R10R3y32:__ASSET__assets_images_cover_pngR5y27:assets%2Fimages%2Fcover.pnggoR0i278R1R10R3y38:__ASSET__assets_images_back_button_pngR5y33:assets%2Fimages%2Fback_button.pnggoR0i225R1R10R3y38:__ASSET__assets_images_piston_base_pngR5y33:assets%2Fimages%2Fpiston_base.pnggoR0i205R1R10R3y34:__ASSET__assets_images_tileset_pngR5y29:assets%2Fimages%2Ftileset.pnggoR0i307R1R10R3y38:__ASSET__assets_images_play_button_pngR5y33:assets%2Fimages%2Fplay_button.pnggoR0i236R1R10R3y30:__ASSET__assets_images_box_pngR5y25:assets%2Fimages%2Fbox.pnggoR0i306R1R10R3y39:__ASSET__assets_images_reset_button_pngR5y34:assets%2Fimages%2Freset_button.pnggoR0i263R1R10R3y33:__ASSET__assets_images_player_pngR5y28:assets%2Fimages%2Fplayer.pnggoR0i62850R1y5:SOUNDR3y31:__ASSET__assets_sounds_drag_wavR5y26:assets%2Fsounds%2Fdrag.wavgoR0i37250R1R55R3y31:__ASSET__assets_sounds_move_wavR5y26:assets%2Fsounds%2Fmove.wavgoR0i24792R1R55R3y38:__ASSET__assets_sounds_click_start_wavR5y33:assets%2Fsounds%2Fclick_start.wavgoR0i63512R1R55R3y41:__ASSET__assets_sounds_piston_retract_wavR5y36:assets%2Fsounds%2Fpiston_retract.wavgoR0i43622R1R55R3y35:__ASSET__assets_sounds_teleport_wavR5y30:assets%2Fsounds%2Fteleport.wavgoR0i63440R1R55R3y40:__ASSET__assets_sounds_piston_extend_wavR5y35:assets%2Fsounds%2Fpiston_extend.wavgoR0i50010R1R55R3y36:__ASSET__assets_sounds_teleport2_wavR5y31:assets%2Fsounds%2Fteleport2.wavgoR0i31196R1R55R3y36:__ASSET__assets_sounds_click_end_wavR5y31:assets%2Fsounds%2Fclick_end.wavgoR0i31412R1R55R3y31:__ASSET__assets_sounds_snap_wavR5y26:assets%2Fsounds%2Fsnap.wavgoR0zR1R2R3y41:__ASSET__assets_sounds_sounds_go_here_txtR5y36:assets%2Fsounds%2Fsounds-go-here.txtgoR0i356024R1R55R3y34:__ASSET__assets_sounds_blocked_wavR5y29:assets%2Fsounds%2Fblocked.wavgoR0i10616R1y4:FONTR3y35:__ASSET__assets_fonts_pixelfont_ttfR5y30:assets%2Ffonts%2FPixelFont.ttfgoR0i3245R1R2R3y32:__ASSET__assets_data_level2_jsonR5y27:assets%2Fdata%2Flevel2.jsongoR0i6375R1R2R3y33:__ASSET__assets_data_level10_jsonR5y28:assets%2Fdata%2Flevel10.jsongoR0i5436R1R2R3y33:__ASSET__assets_data_level11_jsonR5y28:assets%2Fdata%2Flevel11.jsongoR0i10199R1R2R3y34:__ASSET__assets_data_push_box_ogmoR5y29:assets%2Fdata%2Fpush_box.ogmogoR0i3661R1R2R3y32:__ASSET__assets_data_level3_jsonR5y27:assets%2Fdata%2Flevel3.jsongoR0i4560R1R2R3y32:__ASSET__assets_data_level8_jsonR5y27:assets%2Fdata%2Flevel8.jsongoR0i6873R1R2R3y33:__ASSET__assets_data_level20_jsonR5y28:assets%2Fdata%2Flevel20.jsongoR0i4908R1R2R3y32:__ASSET__assets_data_level4_jsonR5y27:assets%2Fdata%2Flevel4.jsongoR0i5269R1R2R3y33:__ASSET__assets_data_level16_jsonR5y28:assets%2Fdata%2Flevel16.jsongoR0i3647R1R2R3y33:__ASSET__assets_data_level17_jsonR5y28:assets%2Fdata%2Flevel17.jsongoR0i4393R1R2R3y32:__ASSET__assets_data_level5_jsonR5y27:assets%2Fdata%2Flevel5.jsongoR0i5451R1R2R3y33:__ASSET__assets_data_level21_jsonR5y28:assets%2Fdata%2Flevel21.jsongoR0i5222R1R2R3y32:__ASSET__assets_data_level9_jsonR5y27:assets%2Fdata%2Flevel9.jsongoR0i5211R1R2R3y33:__ASSET__assets_data_level18_jsonR5y28:assets%2Fdata%2Flevel18.jsongoR0i7085R1R2R3y33:__ASSET__assets_data_level22_jsonR5y28:assets%2Fdata%2Flevel22.jsongoR0i3675R1R2R3y33:__ASSET__assets_data_level14_jsonR5y28:assets%2Fdata%2Flevel14.jsongoR0i5637R1R2R3y32:__ASSET__assets_data_level6_jsonR5y27:assets%2Fdata%2Flevel6.jsongoR0i4488R1R2R3y32:__ASSET__assets_data_level7_jsonR5y27:assets%2Fdata%2Flevel7.jsongoR0i3950R1R2R3y33:__ASSET__assets_data_level15_jsonR5y28:assets%2Fdata%2Flevel15.jsongoR0i6130R1R2R3y33:__ASSET__assets_data_level23_jsonR5y28:assets%2Fdata%2Flevel23.jsongoR0i6508R1R2R3y33:__ASSET__assets_data_level19_jsonR5y28:assets%2Fdata%2Flevel19.jsongoR0i6489R1R2R3y33:__ASSET__assets_data_level12_jsonR5y28:assets%2Fdata%2Flevel12.jsongoR0i8776R1R2R3y33:__ASSET__assets_data_level24_jsonR5y28:assets%2Fdata%2Flevel24.jsongoR0i5431R1R2R3y33:__ASSET__assets_data_level25_jsonR5y28:assets%2Fdata%2Flevel25.jsongoR0i1223R1R2R3y32:__ASSET__assets_data_level1_jsonR5y27:assets%2Fdata%2Flevel1.jsongoR0i5076R1R2R3y33:__ASSET__assets_data_level13_jsonR5y28:assets%2Fdata%2Flevel13.jsongoR0i39706R1R7R3y33:__ASSET__flixel_sounds_flixel_mp3R5y28:flixel%2Fsounds%2Fflixel.mp3goR0i2114R1R7R3y31:__ASSET__flixel_sounds_beep_mp3R5y26:flixel%2Fsounds%2Fbeep.mp3goR0i15744R1R78R3y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfgoR0i29724R1R78R3y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfgoR0i519R1R10R3y36:__ASSET__flixel_images_ui_button_pngR5y33:flixel%2Fimages%2Fui%2Fbutton.pnggoR0i3280R1R10R3y39:__ASSET__flixel_images_logo_default_pngR5y36:flixel%2Fimages%2Flogo%2Fdefault.pnggoR0i156R1R10R3y47:__ASSET__flixel_flixel_ui_img_dropdown_mark_pngR5y44:flixel%2Fflixel-ui%2Fimg%2Fdropdown_mark.pnggoR0i147R1R10R3y43:__ASSET__flixel_flixel_ui_img_plus_mark_pngR5y40:flixel%2Fflixel-ui%2Fimg%2Fplus_mark.pnggoR0i191R1R10R3y39:__ASSET__flixel_flixel_ui_img_radio_pngR5y36:flixel%2Fflixel-ui%2Fimg%2Fradio.pnggoR0i459R1R10R3y51:__ASSET__flixel_flixel_ui_img_button_arrow_left_pngR5y48:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_left.pnggoR0i247R1R10R3y45:__ASSET__flixel_flixel_ui_img_button_thin_pngR5y42:flixel%2Fflixel-ui%2Fimg%2Fbutton_thin.pnggoR0i201R1R10R3y37:__ASSET__flixel_flixel_ui_img_tab_pngR5y34:flixel%2Fflixel-ui%2Fimg%2Ftab.pnggoR0i1724R1R10R3y44:__ASSET__flixel_flixel_ui_img_finger_big_pngR5y41:flixel%2Fflixel-ui%2Fimg%2Ffinger_big.pnggoR0i128R1R10R3y39:__ASSET__flixel_flixel_ui_img_invis_pngR5y36:flixel%2Fflixel-ui%2Fimg%2Finvis.pnggoR0i192R1R10R3y46:__ASSET__flixel_flixel_ui_img_chrome_inset_pngR5y43:flixel%2Fflixel-ui%2Fimg%2Fchrome_inset.pnggoR0i18509R1R10R3y47:__ASSET__flixel_flixel_ui_img_tooltip_arrow_pngR5y44:flixel%2Fflixel-ui%2Fimg%2Ftooltip_arrow.pnggoR0i511R1R10R3y52:__ASSET__flixel_flixel_ui_img_button_arrow_right_pngR5y49:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_right.pnggoR0i153R1R10R3y43:__ASSET__flixel_flixel_ui_img_radio_dot_pngR5y40:flixel%2Fflixel-ui%2Fimg%2Fradio_dot.pnggoR0i253R1R10R3y40:__ASSET__flixel_flixel_ui_img_chrome_pngR5y37:flixel%2Fflixel-ui%2Fimg%2Fchrome.pnggoR0i922R1R10R3y43:__ASSET__flixel_flixel_ui_img_check_box_pngR5y40:flixel%2Fflixel-ui%2Fimg%2Fcheck_box.pnggoR0i534R1R10R3y47:__ASSET__flixel_flixel_ui_img_button_toggle_pngR5y44:flixel%2Fflixel-ui%2Fimg%2Fbutton_toggle.pnggoR0i493R1R10R3y49:__ASSET__flixel_flixel_ui_img_button_arrow_up_pngR5y46:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_up.pnggoR0i136R1R10R3y44:__ASSET__flixel_flixel_ui_img_minus_mark_pngR5y41:flixel%2Fflixel-ui%2Fimg%2Fminus_mark.pnggoR0i212R1R10R3y45:__ASSET__flixel_flixel_ui_img_chrome_flat_pngR5y42:flixel%2Fflixel-ui%2Fimg%2Fchrome_flat.pnggoR0i185R1R10R3y40:__ASSET__flixel_flixel_ui_img_swatch_pngR5y37:flixel%2Fflixel-ui%2Fimg%2Fswatch.pnggoR0i214R1R10R3y46:__ASSET__flixel_flixel_ui_img_chrome_light_pngR5y43:flixel%2Fflixel-ui%2Fimg%2Fchrome_light.pnggoR0i129R1R10R3y41:__ASSET__flixel_flixel_ui_img_hilight_pngR5y38:flixel%2Fflixel-ui%2Fimg%2Fhilight.pnggoR0i946R1R10R3y44:__ASSET__flixel_flixel_ui_img_check_mark_pngR5y41:flixel%2Fflixel-ui%2Fimg%2Fcheck_mark.pnggoR0i210R1R10R3y42:__ASSET__flixel_flixel_ui_img_tab_back_pngR5y39:flixel%2Fflixel-ui%2Fimg%2Ftab_back.pnggoR0i912R1R10R3y37:__ASSET__flixel_flixel_ui_img_box_pngR5y34:flixel%2Fflixel-ui%2Fimg%2Fbox.pnggoR0i294R1R10R3y46:__ASSET__flixel_flixel_ui_img_finger_small_pngR5y43:flixel%2Fflixel-ui%2Fimg%2Ffinger_small.pnggoR0i433R1R10R3y40:__ASSET__flixel_flixel_ui_img_button_pngR5y37:flixel%2Fflixel-ui%2Fimg%2Fbutton.pnggoR0i446R1R10R3y51:__ASSET__flixel_flixel_ui_img_button_arrow_down_pngR5y48:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_down.pnggoR0i1848R1R2R3y47:__ASSET__flixel_flixel_ui_xml_default_popup_xmlR5y44:flixel%2Fflixel-ui%2Fxml%2Fdefault_popup.xmlgoR0i1953R1R2R3y56:__ASSET__flixel_flixel_ui_xml_default_loading_screen_xmlR5y53:flixel%2Fflixel-ui%2Fxml%2Fdefault_loading_screen.xmlgoR0i1263R1R2R3y42:__ASSET__flixel_flixel_ui_xml_defaults_xmlR5y39:flixel%2Fflixel-ui%2Fxml%2Fdefaults.xmlgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
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

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_push_box_ceol extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_push_box_ogg extends flash.utils.ByteArray { }
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
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_drag_wav extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_move_wav extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_click_start_wav extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_piston_retract_wav extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_teleport_wav extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_piston_extend_wav extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_teleport2_wav extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_click_end_wav extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_snap_wav extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_blocked_wav extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_pixelfont_ttf extends flash.text.Font { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level2_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level10_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level11_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_push_box_ogmo extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level3_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level8_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level20_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level4_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level16_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level17_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level5_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level21_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level9_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level18_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level22_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level14_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level6_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level7_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level15_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level23_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level19_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level12_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level24_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level25_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level1_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level13_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends flash.text.Font { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends flash.text.Font { }
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
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends flash.utils.ByteArray { }


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
@:keep @:font("assets/fonts/PixelFont.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_pixelfont_ttf extends lime.text.Font {}
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
@:keep @:font("/usr/local/lib/haxe/lib/flixel/4,9,0/assets/fonts/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("/usr/local/lib/haxe/lib/flixel/4,9,0/assets/fonts/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
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

@:keep @:expose('__ASSET__assets_fonts_pixelfont_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_pixelfont_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/PixelFont.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Early GameBoy Regular"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Monsterrat"; super (); }}


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
