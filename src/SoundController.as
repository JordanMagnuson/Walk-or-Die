package  
{
	import flash.net.LocalConnection;
	import game.Location;
	import net.flashpunk.Entity;
	import net.flashpunk.Sfx;
	import net.flashpunk.tweens.sound.SfxFader;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import rooms.MyWorld;

	public class SoundController extends Entity
	{
		public const FADE_DURATION:Number = 10;
		
		public var currentSound:Sfx;
		public var newSound:Sfx;
		public var fader:SfxFader;
		public var inProcess:Boolean = false;

		
		public function SoundController(location:Location) 
		{
			currentSound = location.daySound;
			currentSound.loop(1);
			fader = new SfxFader(currentSound, fadeComplete);
			addTween(fader);
		}
		
		override public function update():void
		{
			super.update();
			//trace('in process: ' + inProcess);
		}
		
		public function changeLocation(newLocation:Location):void
		{
			trace('change location');
			if (inProcess == true)
			{
				trace('in process');
				trace('current sound vol: ' + currentSound.volume);
				trace('new sound vol: ' + newSound.volume);
			}
			else
			{
				if ((FP.world as MyWorld).time == 'day')
				{
					newSound = newLocation.daySound;
				}
				else 
				{
					newSound = newLocation.nightSound;
				}
				fader.crossFade(newSound, true, FADE_DURATION, 1);
				currentSound = newSound;
				inProcess = true;
			}
		}
		
		public function fadeComplete():void
		{
			inProcess = false;
			
			if ((FP.world as MyWorld).time == 'day' && currentSound != (FP.world as MyWorld).location.daySound)
			{
				trace('catching up with day');
				startDay();
			}
			else if ((FP.world as MyWorld).time != 'day' && currentSound != (FP.world as MyWorld).location.nightSound)
			{
				trace('catching up with night');
				startNight();
			}
			else 
			{
				trace('no need to catch up');
			}
		}
		
		public function startNight():void
		{
			trace('start night');
			if (inProcess == true)
			{
				trace('in process');
				trace('current sound vol: ' + currentSound.volume);
				trace('new sound vol: ' + newSound.volume);
			}			
			else
			{			
				newSound = (FP.world as MyWorld).location.nightSound;
				fader.crossFade(newSound, true, FADE_DURATION, 1);
				currentSound = newSound;	
				inProcess = true;
			}
		}
		
		public function startDay():void
		{
			trace('start day');
			if (inProcess == true)
			{
				trace('in process');
				trace('current sound vol: ' + currentSound.volume);
				trace('new sound vol: ' + newSound.volume);
			}			
			else
			{					
				newSound = (FP.world as MyWorld).location.daySound;
				fader.crossFade(newSound, true, FADE_DURATION, 1);
				currentSound = newSound;	
				inProcess = true;
			}
		}
		
	}

}