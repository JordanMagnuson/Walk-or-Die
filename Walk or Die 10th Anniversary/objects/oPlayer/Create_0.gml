SPEED = 100;
walking = false;

sprite_index = sprPlayer;
image_index = 0;
animSpeed = SPEED/10;
image_speed = 0; //start the player animation on standing

//hit box
sprite_set_offset(sprite_index, sprite_width/2,0);
sprite_collision_mask(sprite_index, true, 1, 0, 0, 0, 0, bboxkind_rectangular,0);
