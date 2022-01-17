/// @description Insert description here
// You can write your code in this editor
randomise();

//NEED TO FIND OUT APPROPRIATE HEIGHT
MAX_HEIGHT = 130;
MIN_HEIGHT = 20;
MAX_SPEED = 0.5;
MIN_SPEED = 0.1;

cloud_speed = MIN_SPEED * random(0.1) * (MAX_SPEED - MIN_SPEED);

//just for testing have to look into making an array for the rest of the clouds
mySpriteCollection = [sprCloud01, sprCloud02, sprCloud03, sprCloud04, sprCloud05, sprCloud06, sprCloud07, sprCloud08];
mySpriteCollection_Random = random(8);

sprite_index = mySpriteCollection_Random;

//depth = 105;
