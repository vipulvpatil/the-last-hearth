I close the door with my back at it. The knee buckles. 
* [Hold] Barely holds me. 
I instinctively wriggle my fingers. The bear took a piece of my arm but most of me has made it here. At the edge of the world, only wilderness beyond...
- The Last Hearth

* [Pull back hood]
- As I take the hood down and wipe off the flakes of snow from my face, a fully lit tavern appears.
Laughter from a table is drowned by an argument on another. A roar of Huzzah accompanies raised goblets around the fireplace. Is that him? I take a small step towards him. He begins to flicker away. I reach out and grasp nothing. Silence calls his name. 

* Julian.

- I read the letter in my trembling hand again.
"Nothing like sitting by the fire after a trek to the Untamed Lands. Only thing warmer is your onion soup. You got to make that when I am back".
I trudge past the dead embers in the fireplace. The leg hurts and I stumble.

* [Hold on to something] I hold the bar counter. -> get_up
* [Stumble on] Thud. The world fades in and out. -> falling

===falling===
* [Let go] I embrace the light and only feel coldness. -> END
* [Hold on] -> get_up


===get_up===
- I {falling:pull myself onto|drag myself to} a stool. Kegs of ale marked "Golden Liquid" linger under the bar. "Goes down like milk. Hits like a brick. Only found at the Last Hearth. I will bring you a bottle. And no, I am not just drowning my life in alcohol. Can you not?"
I try the Golden Liquid. Another swig. Another page. -> drink
===drink===
+ [{!Drink | One more | Chug}] -> drink
* [Read]

- "They have found a new kind of mud. It should help with the leaky roof. I will bring some."
The letter slips from my hand, settles on the counter. I expect to see it littered with tears. Instead the tears are on my cheek.

Frozen.

* [Continue drinking]

- The empty bottle rolls off the bar. More darkness. I get a second bottle and read again.
“Dear Mama,…”

- A howling wind interrupts me. 

* [Look up] -> look_up
* [Ignore] -> ignore
===look_up===
A silhouette stands in the open door. 
-> door_close
===ignore===
Unimportant
-> door_close
==door_close===
- The door pounds to a close.

{look_up:The stranger slowly drifts towards me while unravelling the garb hiding their face.|Footsteps.}

 A wrinkled face fenced by a gray mane reveals the scars of many fights. One in particular has left a deep gash across the left eye.
“I had heard The Last Hearth had been abandoned”. His accent is unfamiliar, maybe Eastern. 
* [Reveal nothing] I remain silent. He continues. 
- "Guess I heard wrong. I also heard there was still some Golden Liquid available. I see that bit is true".
* [Pour drink] I pour him a drink with a steady hand. 
- I go back to my drink until the thud of the door. A pair of coins glint on the counter. 
Cold, unmoving, empty.

-> END
