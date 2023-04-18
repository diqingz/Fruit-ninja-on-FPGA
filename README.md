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
