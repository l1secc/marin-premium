# Marin Premium · Omarchy Theme

A professional, low eye-strain dark theme for [Omarchy](https://omarchy.org/) inspired by **Marin Kitagawa** (*My Dress-Up Darling*). It blends her iconic palette — blonde-gold hair, pink eyes & makeup, lilac accessories, and the deep navy of her school uniform — into a restrained, high-contrast "professional anime aesthetic" that stays comfortable in the terminal, IDE, and status bar all day.

## Palette

| Token      | Hex       | Meaning                          |
|------------|-----------|----------------------------------|
| `background` | `#0f1522` | Deep uniform navy                |
| `accent`   | `#f2a3c0` | Marin pink (eyes + makeup)       |
| `primary`  | `#e8c98f` | Blonde gold (hair)               |
| `secondary`| `#bba7e6` | Lilac (accessories)              |
| `red`      | `#e06c8a` | Rose red (errors, readable)      |
| `green`    | `#a3cdb0` | Sage mint (strings/comments)     |
| `blue`     | `#8fb2e8` | Periwinkle (keywords)            |

Active window border: `rgba(f2a3c0ee) rgba(e8c98fee) 45deg` — a pink→gold gradient.

## Files

| File          | Purpose                                             |
|---------------|-----------------------------------------------------|
| `colors.toml` | Master color scheme (drives every generated config) |
| `hyprland.conf` | Window manager: gradient border, rounding, shadow |
| `shell.toml`  | Omarchy bar / OSD / launcher / lock surfaces        |
| `ghostty.conf`| 16-color ANSI terminal matrix                       |
| `waybar.css`  | Glassmorphism Waybar style                          |

## Install

### Via `omarchy theme install`

```bash
omarchy theme install https://github.com/l1secc/marin-premium.git
omarchy theme set marin-premium
```

> A theme installed from a git repo does not ship executable configs (`*.lua`, terminal configs, `vscode.json`). Omarchy regenerates those from `colors.toml`, so the terminal palette still applies automatically.

### Manual

```bash
git clone https://github.com/l1secc/marin-premium.git \
  ~/.config/omarchy/themes/marin-premium
omarchy theme set marin-premium
```

## License

[MIT](LICENSE)
