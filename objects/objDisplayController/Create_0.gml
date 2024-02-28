//@description Initial setup for project resolution

//ideal resolution
baseWidth = 1440;
baseHeight = 810;
idealWidth = 1440;
idealHeight = 0;

aspectRatio = display_get_width() / display_get_height();

idealHeight = round(idealWidth / aspectRatio);


//Check for odd height resolutions
if (idealHeight & 1) { idealHeight++; }

//set up room views, this object is in room 0 and we can ignore that room
for (i = 1; i < room_last; i++)
{
	//safety check
	if(room_exists(i))
	{
		room_set_viewport(i, 0, true, 0, 0, idealWidth, idealHeight);
		room_set_view_enabled(i, true);
		room_set_camera(i,0,view_camera[0]);
		room_set_view_enabled(i,true);
	}
}

window_set_size(idealWidth, idealHeight);
surface_resize(application_surface, idealWidth, idealHeight);
display_set_gui_size(idealWidth, idealHeight);
window_center();

room_goto(rmGame);