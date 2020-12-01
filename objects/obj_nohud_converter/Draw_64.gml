/// @description Insert description here
// You can write your code in this editor
///Draw interface
//Background
draw_sprite_tiled(bg_light, 0, 0, 0);

///Light Theme
draw_set_colour(c_black);
draw_set_font(fnt_opensans_semi_14);
draw_text(16, 20, "File path");

//Draw buttons
draw_roundrect_colour(16, 48, 464, 88, c_black, c_black, 0);
draw_roundrect_colour(16, (48*2) + 16, 464, (88*1.5) + 16, c_black, c_black, 0);

//Draw file path
draw_set_colour(c_white);
draw_set_font(fnt_opensans_12);
if (string_width(nohud_file) > 48)
{
    nohud_path_string = string_copy(nohud_file, 1, 48);
    draw_text(16 + 16, 58, nohud_path_string + "...");
}
else if (string_width(nohud_file) < 48)
{
    draw_text(16 + 16, 58, nohud_file);
}

//Draw button text
draw_set_font(fnt_opensans_12);
draw_set_colour(c_white);
draw_text(16 + (464 / 4) + 24, (48*2) + 24, "Select your No HUD file");

//Draw second batch of buttons
draw_roundrect_colour(16, 296, 464, 328, c_black, c_black, 0);

//Draw button text
draw_set_font(fnt_opensans_12);
draw_set_colour(c_white);
draw_text(16 + (464 / 3.5) + 64, 296 + 8, "Convert");