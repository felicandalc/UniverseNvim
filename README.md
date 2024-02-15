<h1 align="center">UniverseNvim</h1>

<div align="center">
    <a href="https://github.com/felicandalc/nvim/releases/latest">
        <img alt="Latest release" src="https://img.shields.io/github/v/release/felicandalc/nvim?style=flat-square&logo=starship&color=DCD7C9&labelColor=2C3639&logoColor=DCD7C9" />
    </a>
    <a href="https://github.com/felicandalc/nvim/LICENSE">
    <img alt="License" src="https://img.shields.io/github/license/felicandalc/nvim?style=flat-square&color=DCD7C9&labelColor=2C3639" />
    </a>
    <img alt="PRs Welcome" src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square&color=DCD7C9&labelColor=2C3639" />
    <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/felicandalc/nvim/master?style=flat-square&color=DCD7C9&labelColor=2C3639" />
    <img alt="Neovim version" src="https://img.shields.io/badge/Neovim->=0.9-57A143?style=flat-square&logo=neovim&color=DCD7C9&labelColor=2C3639" />
</div>

<hr / >
<br />

<details>
  <summary>Contents</summary>
  <ul>
    <li><a href="#introduction">Introduction</a></li>
    <li>
      Getting Started
        <ul>
          <li><a href="#pre-requisites">Pre-requisites</a></li>
          <li><a href="#installation">Installation</a></li>
        </ul>
    </li>
  </ul>
</details>

### Introduction

This is a lightweight and fast Neovim configuration fully written in [Lua](https://www.lua.org/), it is being constantly iterated.
You can freely use it <strong>out-of-the-box</strong> or you can install it and modify it to meet your personal requirements.

### Pre-requisites

- Check Neovim version, you'll need at least the [latest release](https://github.com/neovim/neovim/releases/tag/stable)
- Install [Nerd Font](https://www.nerdfonts.com) and set it as your terminal font (optional)
- Install [Ripgrep](https://github.com/BurntSushi/ripgrep), it is required for Telescope searches (optional)

### Installation

<details open="open">
<summary>For Linux/MacOS users</summary>

<br />

- Create a backup

  ```sh
  mv ~/.config/nvim ~/.config/nvim.bak
  mv ~/.local/share/nvim ~/.local/share/nvim.bak
  ```

- Clone configuration

  ```sh
  git clone https://github.com/felicandalc/nvim ~/.config/nvim
  ```

</details>

<details>
<summary>For Windows users</summary>

<br />

- Create a backup

  ```sh
  Move-Item -Path $HOME\AppData\Local\nvim -Destination $HOME\AppData\Local\nvim.bak
  Move-Item -Path $HOME\AppData\Local\nvim-data -Destination $HOME\AppData\Local\nvim-data.bak
  ```

- Clone configuration

  ```sh
  git clone https://github.com/felicandalc/nvim $HOME\AppData\Local\nvim
  ```

</details>
