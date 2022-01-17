SPEED = 100;
walking = false;

sprite_index = sprPlayer;
image_index = 0;
animSpeed = SPEED/10;
image_speed = 0; //start the player animation on standing

//hit box
sprite_set_offset(sprite_index, 0,sprite_height);
sprite_collision_mask(sprite_index, true, 1, sprite_width, sprite_height, 0, sprite_height, bboxkind_rectangular,0);
