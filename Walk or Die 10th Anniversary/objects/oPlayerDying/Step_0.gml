//only play the dying animation once
if(image_speed > 0){
	if(image_index > image_number-1){
		image_speed = 0;
	}
}

//gravestone alarm
//graveStoneAlarm = alarm_set(0, fadeOut);