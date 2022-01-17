package game
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import rooms.MyWorld;
	
	public class Cloud extends Item
	{
		// BLOCK DONE ============================
		public static const MAX_HEIGHT:int = 130;
		public static const MIN_HEIGHT:int = 20;
		public static const MAX_SPEED:Number = 0.5;
		public static const MIN_SPEED:Number = 0.1;
		//========================================
		
		public var speed:Number; // DONE -> Renamed as cloud_speed
		
		/**
		 * Sprites
		 */
		// BLOCK DONE ===================================================
		[Embed(source = '../../assets/cloud01.png')] private const CLOUD01:Class;	
		[Embed(source = '../../assets/cloud02.png')] private const CLOUD02:Class;	
		[Embed(source = '../../assets/cloud03.png')] private const CLOUD03:Class;
		[Embed(source = '../../assets/cloud04.png')] private const CLOUD04:Class;
		[Embed(source = '../../assets/cloud05.png')] private const CLOUD05:Class;
		[Embed(source = '../../assets/cloud06.png')] private const CLOUD06:Class;
		[Embed(source = '../../assets/cloud07.png')] private const CLOUD07:Class;
		[Embed(source = '../../assets/cloud08.png')] private const CLOUD08:Class;
		public var mySpriteCollection:Array = new Array(CLOUD01, CLOUD02, CLOUD03, CLOUD04, CLOUD05, CLOUD06, CLOUD07, CLOUD08);
		//================================================================
		
		public function Cloud() 
		{
			// Random image
			rawSprite = chooseSprite(mySpriteCollection); // DONE FOR NOW RELOOK INTO IT
			
			// Super
			super(rawSprite, 'mid', true);
			type = 'cloud'; // DONE
			
			// Random height and speed within params
			//BLOCK DONE ======================================
			trace(FP.random);
			y = MIN_HEIGHT + FP.random * (MAX_HEIGHT - MIN_HEIGHT); // PORT: TODO Relook into the random portion
			speed = MIN_SPEED + FP.random * (MAX_SPEED - MIN_SPEED); 
			// ================================================
			
			layer = 105; // CLOUD ARE GONE WHEN DEPTH = 105 RELOOK INTO THIS LATER
		}
		
		override public function update():void 
		{

			// DONE BLOCK =========================
			if (MyWorld.fourthFrame == 4)
			{
				x -= 1;
			}

			
			// Destroy when off screen
			if (x < (0 - image.width))
			{
				FP.world.remove(this);
			}
			// =========================================
		}
	}
}