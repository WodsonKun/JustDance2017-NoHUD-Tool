/// @description Insert description here
// You can write your code in this editor
///Handles actions and functions
if (mouse_check_button_released(mb_left))
{
    //Get the .mp4 file
    if (point_in_rectangle(mouse_x, mouse_y, 16, (48*2) + 16, 464, (88*1.5) + 16))
    {
        get_nohud = get_open_filename("MP4 files (.mp4)|*.mp4|WEBM files (.webm)|*.webm", "")
        if (get_nohud != "*.mp4")
        {
            nohud_file = get_nohud;
            directory_create(save_dir + string_replace(filename_name(get_nohud), ".mp4", ""));
        }
        if (get_nohud != "*.webm")
        {
            nohud_file = get_nohud;
            directory_create(save_dir + string_replace(filename_name(get_nohud), ".webm", ""));
        }
    }
    
    //Convert it to .m3u8
    if (point_in_rectangle(mouse_x, mouse_y, 16, 296, 464, 328))
    {
        //Create .bat file
		var test = file_text_open_write(game_save_id + "audio_ext.bat");
		if (get_nohud != "*.mp4")
		{
		    output_folder = string_replace(filename_name(get_nohud), ".mp4", "");
		}
		if (get_nohud != "*.webm")
		{
		    output_folder = string_replace(filename_name(get_nohud), ".webm", "");
		}
		file_text_write_string(test, "bin\\ffmpeg.exe -i " + string(nohud_file) + " -ar 48000 " + save_dir + output_folder + ".wav"); //Audio extractor
		file_text_writeln(test);
		file_text_close(test);
	
		var test2 = file_text_open_write(game_save_id + "nohud_con.bat");
		file_text_write_string(test2, "\n" + "bin\\ffmpeg.exe -i " + string(nohud_file) + " -threads:v 4 -sws_flags bicubic -codec:v libvpx -r:v 25 -b:v 8000k -bufsize 6000k -g 120 -rc_lookahead 16 -profile:v 1 -qmax 51 -qmin 11 -slices 4 -quality realtime -an -vol 0 -b:v 7000k -aspect 16:9 -b:v 8000k -filter:v scale=1216:720 " + save_dir + output_folder + "_ready.webm");
		file_text_writeln(test2);
		file_text_close(test2);
	
		//Execute .bat files
		execute_shell(game_save_id + "audio_ext.bat", true);
		execute_shell(game_save_id + "nohud_con.bat", true);
	
		//Show finished message
		show_message("Done!" + "\n" + "Check the 'output' folder to get your files.");

		//Delete .bat file
		file_delete(game_save_id + "audio_ext.bat");
		file_delete(game_save_id + "nohud_con.bat");
	}
}