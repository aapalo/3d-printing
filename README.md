# 3d-printing
My notes, tips, and setup for 3d Printing

## Current mods/software in use 
- updated 2021-03-26
- Raspberry Pi 3
  - klipper, [https://www.klipper3d.org/Overview.html]
  - mainsail, [https://docs.mainsail.xyz/] 
- SuperSlicer, [https://github.com/supermerill/SuperSlicer/releases]
- 3DTouch leveling sensor
- mellow's nozzle
- printed mods
	- fan shroud, [https://www.thingiverse.com/thing:3972011]
	  - mount and calibration disk, [https://www.thingiverse.com/thing:3716043]
	- z rod supports, [https://www.thingiverse.com/thing:4444589]
	- cable protector, [https://www.thingiverse.com/thing:4295171]
	- cable ribbon clamp, [https://www.thingiverse.com/thing:4281143]
	- bed cable strain relief, [https://www.prusaprinters.org/prints/55642-genius-zx-adjustable-bed-cable-strain-relief]
	- filament dust filter, [https://www.thingiverse.com/thing:190118]
	- cable chain


## Leveling process
- heat up the bed and wait for a few minutes
- take A5 sized copy paper
- close the gap between the nozzle and the bed until you can still move the paper by pulling, but can't move the paper by pushing

## Replacement parts
- nozzle: volcano
	- aliexpress: trianglelabs or mellow
- heatbreak
	- if the cooler plate has two holes: smooth heatbreak, "kraken"


## Misc tips
- [https://community.octoprint.org/t/put-tape-on-the-5v-pin-why-and-how/13574 Tape out the 5V line from Pi to mainboard]
- detach the 2-wired reset connector between TFT and mainboard: when flashing firmware, keep the reset button pressed to keep the TFT off
