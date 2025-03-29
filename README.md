# MyPlugin - Neovim Calculator

A simple Neovim plugin to evaluate mathematical expressions in visual mode using `bc`.

## 📥 Installation

Place `myplugin.lua` inside:

```
~/.config/nvim/lua/myplugin.lua
```

Then, load it in `init.lua`:

```lua
require("myplugin")
```

## ⚡ Usage

1. **Select a math expression** in visual mode (e.g., `10 + 20 / log(10)`).
2. Run the command:

   ```
   :Calc
   ```

3. The expression will be replaced or appended with the result:

   ```
   10 + 20 / log(10) = 16.6615
   ```

## 🔧 Dependencies

- `bc` (should be available by default on most Linux systems)

## 📜 License

MIT

