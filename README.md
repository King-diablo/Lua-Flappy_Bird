# Flappy Bird - CS50 2D Game Tutorial

A Lua implementation of Flappy Bird based on the CS50's Introduction to Game Development 2D tutorial.

## Overview

This project is a learning exercise following the CS50 2D game development course. The game recreates the classic Flappy Bird mechanics using LÖVE 2D framework.

## Status

🚧 **In Progress** - Active development

## Project Structure

- `main.lua` - Main game file with love callbacks (load, update, draw)
- `Bird.lua` - Bird class and logic
- `class.lua` - Class utility for object-oriented programming
- `push.lua` - Virtual resolution library for handling window scaling
- Asset files: `bird.png`, `background.png`, `ground.png`

## Features

- Bird sprite rendering
- Virtual resolution handling for different screen sizes
- Object-oriented design using Lua classes
- ✅ Gravity and jump mechanics
- ✅ Bird rotation while jumping

### Self-Learning Notes

✨ **Bird Rotation** - Successfully implemented bird rotation while jumping for more dynamic visual feedback

## How to Run

1. Install [LÖVE 2D](https://love2d.org/)
2. Navigate to the project directory
3. Run: `love .`

## Controls

- **ESC** - Quit the game
- _Spacebar/Click_ - Make the bird jump (to be implemented)

## Requirements

- LÖVE 2D 11.0 or higher
- Lua 5.1+

## Learning Resources

- [CS50's Introduction to Game Development](https://cs50.harvard.edu/games/)
- [LÖVE 2D Documentation](https://love2d.org/wiki/Main_Page)

## Next Steps

- [ ] Implement pipes/obstacles
- [ ] Add collision detection
- [ ] Add scoring system
- [ ] Add sound effects
- [ ] Polish animations and visuals

---

_This is a personal learning project following the CS50 2D game development curriculum._
