# Flappy Bird - CS50 2D Game Tutorial

A complete Lua implementation of Flappy Bird based on the CS50's Introduction to Game Development 2D tutorial. This project successfully replicates the classic game with additional enhancements and polish.

## Overview

This project completes the CS50 2D game development course tutorial. The game is a fully playable implementation of Flappy Bird using the LÖVE 2D framework, featuring game states, collision detection, scoring, audio, and animations.

## Status

✅ **Complete** - CS50 lecture completed with enhanced features

## Project Structure

### Core Files
- `main.lua` - Main game file with LÖVE callbacks and state machine initialization
- `StateMachine.lua` - State management system for different game modes
- `Bird.lua` - Bird class with gravity, jumping, and rotation mechanics

### Game States
- `states/Base.lua` - Base state class
- `states/TitleScreen.lua` - Title/menu state
- `states/Countdown.lua` - Pre-game countdown state
- `states/Play.lua` - Main gameplay state
- `states/Score.lua` - Score display state after death

### Game Logic
- `Pipe.lua` - Single pipe obstacle class
- `PipePair.lua` - Paired pipes (top and bottom) class
- `class.lua` - Lua class utility for OOP
- `push.lua` - Virtual resolution library for window scaling

### Assets
- Images: `bird.png`, `background.png`, `ground.png`, `pipe.png`
- Fonts: `flappy.ttf`, `font.ttf`
- Audio: Jump, explosion, hurt, score sounds, and background music

## Features

### Core Gameplay
- ✅ Bird sprite rendering with smooth pulsing animation (sine wave effect)
- ✅ Gravity and physics-based jump mechanics
- ✅ Bird rotation based on velocity (tilts while jumping/falling)
- ✅ Scrolling background and ground
- ✅ Pipe obstacle generation and collision detection
- ✅ Score tracking and display during gameplay
- ✅ Game over detection and score screen

### Game Flow & UI
- ✅ Title screen state
- ✅ Countdown timer before gameplay starts
- ✅ Pause functionality
- ✅ Score display in-game and on game over screen
- ✅ State machine for managing game flow
- ✅ Font hierarchy for UI (title, HUD, score display)

### Audio & Polish
- ✅ Sound effects (jump, collision, score, explosion)
- ✅ Background music with looping
- ✅ Virtual resolution for consistent gameplay across screen sizes
- ✅ Multiple font sizes for visual hierarchy

### Self-Learning Achievements
- ✨ **Bird Rotation** - Implemented dynamic bird rotation based on velocity for enhanced visual feedback
- ✨ **Sine Wave Animation** - Created smooth pulsing bird scale animation using sine waves for natural motion

## How to Run

### Prerequisites
1. Install [LÖVE 2D](https://love2d.org/) (version 11.0 or higher)

### Execution
```bash
love .
```
Or simply drag the project folder onto the LÖVE 2D executable.

## Controls

- **Spacebar** or **Click** - Make the bird jump
- **ESC** - Quit the game
- **P** - Pause/Resume (if implemented)

## Requirements

- LÖVE 2D 11.0 or higher
- Lua 5.1+

## Game Mechanics

### Scoring
- Score increases by 1 for each pipe pair successfully passed
- Score is displayed in real-time during gameplay
- Final score shown on game over screen

### Difficulty
- Consistent pipe spacing and gap size
- Pipes spawn continuously as player progresses
- Scrolling speed creates progressive challenge feel

### Physics
- Gravity constantly pulls the bird downward
- Jump provides instant upward velocity
- Bird rotation indicates velocity (up = tilts up, down = tilts down)
- Collision detection with pipes, ground, and ceiling

## Learning Resources

- [CS50's Introduction to Game Development](https://cs50.harvard.edu/games/)
- [LÖVE 2D Documentation](https://love2d.org/wiki/Main_Page)
- [Lua Programming Guide](https://www.lua.org/pil/)

## Architecture Highlights

- **State Pattern**: Game flow managed through StateMachine for clean separation of concerns
- **OOP Design**: Class-based architecture for reusable Bird, Pipe, and PipePair objects
- **Virtual Resolution**: `push.lua` provides consistent rendering across different screen sizes
- **Modular Structure**: Separated game logic into dedicated files for maintainability

---

_A completed personal learning project following the CS50 2D game development curriculum. Successfully demonstrates game state management, collision detection, scoring systems, and audio integration._
