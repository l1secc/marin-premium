# Marin Premium · Omarchy Theme

A professional, low eye-strain **dark mode** theme for [Omarchy](https://omarchy.org/) — Linux desktop, *inspired by* **Marin Kitagawa** from *My Dress-Up Darling* (*Sono Bisque Doll wa Koi wo Suru*).

It blends Marin's iconic character palette into a restrained, high-contrast "professional anime aesthetic" that stays comfortable in the terminal, IDE, and status bar all day.

---

## Color Story

| Source (canon)            | Token         | Hex       | Used as                          |
|---------------------------|---------------|-----------|----------------------------------|
| Hair (honey blonde)       | `primary`     | `#e8c98f` | Titles, focused states           |
| Eyes & makeup (rose pink) | `accent`      | `#f2a3c0` | Primary accent, focus borders    |
| Accessories (lilac)       | `secondary`   | `#bba7e6` | Info chips, links                |
| School uniform (deep navy)| `background`  | `#0f1522` | Base canvas                      |

**Why "premium, low eye-strain":**
- Every foreground sits at ≥ 7:1 contrast on the deepest navy.
- All accent colors are pulled ~10–15% toward warm/dusty to avoid LED glare.
- No pure black, no pure white — only layered surfaces with depth.
- The active border is a **3-stop diagonal gradient** (pink → lilac → gold) flowing through Marin's full palette at 45°.

---

## Files

| File             | Purpose                                                                |
|------------------|------------------------------------------------------------------------|
| `colors.toml`    | Master color scheme (drives every generated config)                   |
| `hyprland.conf`  | Window manager: 3-stop gradient border, blur, shadows, animations      |
| `shell.toml`     | Omarchy bar / OSD / launcher / lock / polkit surfaces (Quattro shell)  |
| `ghostty.conf`   | 16-color ANSI terminal matrix (Ghostty; Alacritty/Kitty/Foot auto-gen) |
| `waybar.css`     | Glassmorphism Waybar with module-specific color hints                 |
| `backgrounds/`   | 6 original gradient backgrounds (1920×1080, ~636 KB total)             |

---

## Backgrounds

The theme ships **6 original procedural backgrounds** in `backgrounds/`. All are 1920×1080 JPG, generated from the theme's own palette — *no copyrighted image data* is included.

| File    | Mood                                                                 |
|---------|----------------------------------------------------------------------|
| `BG1.jpg` | Three-orb composition — pink upper-left, lilac right, gold lower-right |
| `BG2.jpg` | Diagonal band flow — pink top, lilac middle, gold bottom             |
| `BG3.jpg` | Starry night — subtle lilac glow + faint star field                   |
| `BG4.jpg` | Horizon — pink at top, lilac mid, deep navy                          |
| `BG5.jpg` | Anime-poster radial — pink upper-left, lilac upper-right             |
| `BG6.jpg` | Minimal vignette — pure deep navy with soft center                   |

---

## ⚠️ A note on copyright

Marin Kitagawa's character design is the copyrighted work of **Shinichi Fukuda** (manga) and **CloverWorks** (anime). The colors in this theme are *inspired* by her design — color inspiration is not copying, but redistributing someone else's artwork under our name is.

**What this theme is:** the theme's *colors*, *config files*, and *original procedural backgrounds*. These are our work.

**What this theme is not:** a wallpaper pack of official or fan-art Marin artwork. We don't ship any.

### Want real Marin wallpapers for personal use?

If you want actual art of Marin as your wallpaper (legal for personal use, **not** to redistribute), the safest paths are:

1. **Buy official goods** — Yen Press / Kodansha releases, Aniplex Plus, Good Smile Company sometimes include wallpapers with Blu-rays.
2. **Official anime site** → check the show's official site / seasonal downloads.
4. **Hire a fan artist** to create original art inspired by the character — both your own and the artist's license.

If you do obtain a licensed wallpaper and want it in this theme:

```bash
# Drop the file into the theme's backgrounds folder (PNG/JPG/WEBP works)
cp /path/to/your/licensed/marin-wallpaper.png \
   ~/.config/omarchy/themes/marin-premium/backgrounds/

# Or use Omarchy's per-theme background slot (does not modify the theme):
cp /path/to/your/licensed/marin-wallpaper.png \
   ~/.config/omarchy/backgrounds/marin-premium/

omarchy theme bg next    # cycle through backgrounds
```

---

## Install

### From your local checkout (you're already there)

```bash
omarchy theme set "Marin Premium"
```

### From a fresh install

```bash
git clone https://github.com/l1secc/marin-premium.git \
  ~/.config/omarchy/themes/marin-premium
omarchy theme set "Marin Premium"
```

> A theme cloned from a git repo skips the `*.lua` / `*.toml` / `*.json` files Omarchy treats as executable; the rest (including the 6 backgrounds) stays.

---

## Customization

### Tweak the palette

Edit `colors.toml`. Then:

```bash
omarchy theme set "Marin Premium"     # re-apply
omarchy restart terminal              # re-render ghostty
omarchy restart shell                 # re-render bar / launcher / OSD
hyprctl reload                        # reload hyprland config
```

### Adjust window animations

Edit `hyprland.conf` — all bezier curves are commented with intent. Save and Hyprland auto-reloads; check for errors with:

```bash
hyprctl configerrors
```

### Change the Waybar

Edit `waybar.css` — the file is fully tokenized with `@define-color` at the top. The bar reads this file on save; if Waybar doesn't, restart it with `omarchy restart waybar` (varies by setup).

### Add a wallpaper

Drop any 1920×1080 (or higher) PNG/JPG/WEBP into `backgrounds/`. Cycle through them with `Super + Alt + Space` → Style → Background, or:

```bash
omarchy theme bg next
```

---

## License

[MIT](LICENSE)

This applies to the theme configuration, the colors, and the procedural backgrounds. *Marin Kitagawa* is a copyrighted character; the colors are referenced under fair-use / nominative-fair-use for the sake of palette inspiration only.