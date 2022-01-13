randomise();

oddFrame = 1;
thirdFrame = 1;
fourthFrame = 1;
forceClouds = false;

player = instance_create_depth(0, 0, 0, oPlayer);
player.x = 50;
player.y = 100; //should be Ground.y but ground is not made yet

cloud = instance_create_depth(0, 0, 0, oCloud);
cloud.x = 350;
cloud.y = oCloud.MIN_HEIGHT + random(1) * (oCloud.MAX_HEIGHT - oCloud.MIN_HEIGHT); //need to correct MIN and MAX height
show_debug_message(cloud.y);
