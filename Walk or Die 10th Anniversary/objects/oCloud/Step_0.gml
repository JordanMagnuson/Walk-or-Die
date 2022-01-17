
if(oMyWorldController.fourthFrame == 4)
{
	x -= 1;	
}

if (x < (0 - sprite_width))
{
	instance_destroy(oCloud);
	//show_debug_message("CLOUD GONE");
}
