# Community Contribution Repository

This repository is no longer actively maintained. Feel free to use it and contribute to it as needed.

## Installation Guide

### Prerequisites
- Eluna Lua engine installed on your core. You can find the module for AzerothCore [here](https://github.com/azerothcore/mod-eluna). For TrinityCore, you can find the appropriate module online.

### Step-by-Step Installation
1. Download and install [MPQ Editor](https://www.zezula.net/en/mpq/download.html) for creating a patch.
2. Extract the contents of the `Client` folder into your patch using the MPQ Editor.
3. Install the custom required tables from the `Database` folder into your Character Database.
4. Place the `DifficultyMode_by Syn` folder into your `core/lua_scripts` folder.
5. Ensure that you have AIO installed in your core's Lua folder and client side. You can find AIO [here](https://github.com/Rochet2/AIO).

### Final Steps
- Ensure that the following components have been properly installed:
  - Patch Creation
  - Database Installation
  - AIO Client & Core Side
  - Eluna Lua Engine

- Restart your server, and the installation should be complete.

## Contributing
Contributions are welcome! If you have any improvements or bug fixes, feel free to submit a pull request.
