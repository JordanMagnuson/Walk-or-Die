package game
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	
	//SECTION
	
	public class Player extends Entity
	{
		/**
		 * Player speed determines how fast items approach,
		 * as well as animation speed. 100 is normal.
		 */
		public static const SPEED:Number = 100;	//DONE
		public var animSpeed:Number;			//DONE
		
		public static var walking:Boolean = false;	//DONE
		
		/**
		 * Player graphic
		 */
		[Embed(source='../../assets/player.png')] private const PLAYER:Class;
		public var sprPlayer:Spritemap = new Spritemap(PLAYER, 8, 17);	//DONE
		
		/**
		 * Sound
		 */
		[Embed(source='../../assets/sounds.swf', symbol='walking.wav')] private const SND_WALKING:Class;
		public var sndWalking:Sfx = new Sfx(SND_WALKING);			
		
		public function Player() 
		{
			// Graphic					//SECTION DONE
			sprPlayer.add("stand", [0], 20, false);
			animSpeed = Player.SPEED / 10;
			sprPlayer.add("walk", [0, 1, 2, 3], animSpeed, true);0
			graphic = sprPlayer;
			sprPlayer.play("stand");
			
			// Hit box			//SECTION DONE
			sprPlayer.originX = 0;
			sprPlayer.originY = sprPlayer.height;
			sprPlayer.x = 0;
			sprPlayer.y = -sprPlayer.originY;	
			
			setHitbox(sprPlayer.width, sprPlayer.height, sprPlayer.originX, sprPlayer.originY);	//DONE			
			
			// Location
			x = 50;	//DONE
			y = Ground.y;	//GROUND NOT YET IMPLEMENTED BUT TEMPORARY Y ADDED
			
			// Input
			Input.define("X", Key.SPACE);	//DONE
		}
		
		override public function update():void 
		{
			super.update();
			if (Player.walking && !sndWalking.playing)//THIS SECTION IS ADDED, BUT SOUND IS IN SWF SO SOUND IS EMPTY
			{
				sndWalking.loop(0.5);
			}
			
			if (Input.check("X"))	//DONE
			//if (true) 
			{
				Player.walking = true;
				sprPlayer.play("walk");
			}
			else	//DONE
			{
				Player.walking = false;
				sprPlayer.play("stand");
			}
			
			if (Input.released("X"))	//SECTION DONE
			{
				sndWalking.stop();
				var playerDying:PlayerDying = new PlayerDying;
				FP.world.add(playerDying);
				playerDying.x = x;
				playerDying.y = y;
				FP.world.remove(this);
			}
		}
		
	}
}