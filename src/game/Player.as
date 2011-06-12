package game
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	
	public class Player extends Entity
	{
		/**
		 * Player speed determines how fast items approach,
		 * as well as animation speed. 100 is normal.
		 */
		public static const SPEED:Number = 100;
		public var animSpeed:Number;
		
		public static var walking:Boolean = false;
		
		/**
		 * Player graphic
		 */
		[Embed(source='../../assets/player.png')] private const PLAYER:Class;
		public var sprPlayer:Spritemap = new Spritemap(PLAYER, 8, 17);	
		
		/**
		 * Sound
		 */
		[Embed(source='../../assets/sounds.swf', symbol='walking.wav')] private const SND_WALKING:Class;
		public var sndWalking:Sfx = new Sfx(SND_WALKING);			
		
		public function Player() 
		{
			// Graphic
			sprPlayer.add("stand", [0], 20, false);
			animSpeed = Player.SPEED / 10;
			sprPlayer.add("walk", [0, 1, 2, 3], animSpeed, true);
			graphic = sprPlayer;
			sprPlayer.play("stand");
			
			// Hit box
			sprPlayer.originX = 0;
			sprPlayer.originY = sprPlayer.height;
			sprPlayer.x = 0;
			sprPlayer.y = -sprPlayer.originY;	
			
			setHitbox(sprPlayer.width, sprPlayer.height, sprPlayer.originX, sprPlayer.originY);				
			
			// Location
			x = 50;
			y = Ground.y;
			
			// Input
			Input.define("X", Key.SPACE);
		}
		
		override public function update():void 
		{
			super.update();
			if (Player.walking && !sndWalking.playing)
			{
				sndWalking.loop(0.5);
			}
			
			if (Input.check("X"))
			//if (true) 
			{
				Player.walking = true;
				sprPlayer.play("walk");
			}
			else
			{
				Player.walking = false;
				sprPlayer.play("stand");
			}
			
			if (Input.released("X"))
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