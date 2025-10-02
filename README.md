# ✨ Start Screen

[![version](https://img.shields.io/badge/version-1.0.0-blue)](https://github.com/zenixsgames/godot-start-screen)
[![godot](https://img.shields.io/badge/godot-4.5-blue)](https://godotengine.org/)
[![link](https://img.shields.io/badge/link-blue)](https://github.com/zenixsgames/godot-start-screen)

## ⚡ Overview

This project is a simple start screen template, especially designed for sandbox games.
<p align="center">
<img width="600" height="400" alt="Image" src="https://github.com/user-attachments/assets/a70ed0d2-63fc-4b28-801f-c633f4c75c67" />
</p>

```mermaid
---
title: Scene structure
---
flowchart LR
  main[main] --> ts[title
  screen]
  ts --> sp[select
  player]
  sp <--> cp[create
  player]
  sp --> sw[select
  world]
  sw <--> cw[create
  world]
  sw --> game[game]
```

## 🛠️ Installation

```bash
gh repo clone zenixsgames/godot-start-screen
```

## 🚀 Getting Started

1. Download and install the Godot Engine. You can find the official version on the [Godot website](https://godotengine.org/).
2. Download this project and unzip the file.
3. Run the Project in Godot.

## 📝 License
This project is under [MIT License](https://github.com/zenixsgames/godot-start-screen/blob/main/LICENSE).
