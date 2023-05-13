# Inventory and Interaction System

## Assets Source:

- Item Icons: https://curiousvault.itch.io/google
- Inventory Textures (for NinePatchRect and TextureRect): https://dragoonwys.itch.io/ad-visual-inventory-free-item-borders
- Inventory Toggle Buttons: https://karwisch.itch.io/pxui-basic
- Fonts: Oswald (https://fonts.google.com/specimen/Oswald?query=oswald) and Carlito (https://fonts.google.com/specimen/Carlito)
- Interactable Items and Tiles: https://piewsook.itch.io/katfood-adventure-game-assets-v08 and https://cainos.itch.io/pixel-art-platformer-village-props
- Player Sprite: https://maytch.itch.io/free-32x64-kanako-platformer-character-sprite-set

## Description:

This is a game prototype of inventory and interaction system created with Godot engine, I tried to recreate the interaction from some of my favourite point and click adventure games that I've played before. (Detention, Lucid Dream (1 & 2), and Re:Turn: One Way Trip.)

In this prototype I use Area2d for both character and items. The items (Static body) that is placed in the Main scene (world) detects when the character (Kinematic body) gets close enough to the item (or has entered another body, since I'm using Staticbody2d and Kinematicbody2d.). Then an icon will appear on top of the item, there are two types of interactions based on their icons:

- circular plus icon: you can add this item to the inventory.
- search icon: if you click on this icon a dialog box will appear, giving what the character though about the item being interacted with.


https://user-images.githubusercontent.com/98946459/236841710-5df82192-ed28-45b6-a53c-61429d2f8d9b.mp4


