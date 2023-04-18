# Fruit-ninja-on-FPGA
We aim to create a fruit ninja that can run on THE DE-10 FPGA. The objective of the game is to earn points after destroying different types of fruits that appear from the bottom of the screen. The game will continue to proceed until the player misses three fruits or slices through a bomb which appears from the bottom of the screen. This game is a well known mobile game that has quite the popularity. We intend to add features in the development of the game in order to make the design to earn more difficulty points which will be discussed later. The slicer in the game will be navigated and controlled by the USB interface in which a wired keyboard will be used as the input to the MAX3421E USB. Overall, the keyboard’s keycodes pressed will need to align with each fruit's matching keycode in order to destroy it, however, if the wrong keycode is pressed you will lose a life (3 lives in total). Additionally, if you pressed the keycode of a bomb then you will lose the game instantly ignoring the amount of lives you have.


## List of Features:

### Baseline features:

#### 1. Reset and start feature: 
allows the player to restart their current game or start a new game if they choose to do so. This is a great feature to have as it allows the bugs to be traced in certain areas of the game. In order for the user to reset and start they will use the FPGA board and press the assigned push buttons. 

#### 2.Scoring system:
The scores will be displayed on the HEX display. This will allow the user to keep track of their score. The scoring system must be constructed in a way so that it will fit in the range of the amount of HEX values we are capable of displaying.

#### 3. Creating a sprite for each type of fruit, keycode, and bomb in order for the game to fully be known as Fruit Ninja.
The sprites will allow the user to be able to interact with the different fruits and avoid the bombs that will be floating onto the screen. 

#### 4. Keyboard input to act as the slice for the game. 
The keyboard input will allow the different fruits and bombs to be removed depending on the keycodes pressed by the user. If the keycode that is pressed validates the keycode of the fruit then it is correct, however, if the wrong keycode is pressed then you will lose a life. 

#### 5. The alter in speed of the fruits and bombs as certain scores have been reached.
This allows the difficulty to rise as the player continues to proceed in the game so that eventually the game will come to an end. 

#### 6. Game end
Game ends when a certain amount of missed fruits on the screen or bomb is pressed

#### 7. The alignment of the keycodes and the assigned fruits/bombs. 
The alignment ensures that depending on the keycode pressed by the user will dictate if a certain fruit or bomb will be removed. 

### Additional Features

#### 1. The amount of lives that the user has until the game will end. 
There will be three lives that the user starts with at the beginning of the game and will decrease as a penalty has been made. The amount of the lives will be displayed on the corner of the VGA screen.

#### 2. A leaderboard in which it will be displayed on the VGA display with the help of font rom.
This will allow the user to keep know their final score. Additionally it will remove the constraint of the score that can be displayed. 

#### 3. The ability of changing the input interface of the game from a wired keyboard to a mouse. 
The mouse would remove the keycodes on the screen and instead consist of a slicing mechanism.

#### 4. An animation when the keycodes of the wired keyboard align with the fruit or bomb.
For instance, if the keycode matched the fruits assigned keycode then the fruit would either explode or slice in half.

#### 5. The ability of getting bonus points for destroying multiple fruits on the same slice.
In the original Fruit Ninja more points are rewarded if the user slices multiple fruits in one go. Therefore, a bonus points system will be set up. 

#### 6. Sound for the game to have when the fruits are sliced and when the bomb is sliced.
The ability to add sound is unknown to us, however, if the project is moving at a great pace then we could learn how we can implement sounds to the game. 

#### 7. A main menu in which it will be displayed on the VGA display with the help of font rom.
This will allow the originally mentioned start process of the push button on the FPGA to be instead interactive with the VGA display. The main menu will primarily consist of start, scoreboard, set difficulty. 
