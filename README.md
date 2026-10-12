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
| `backgrounds/`   | `Marin-01-festival-night.jpg` — the master theme's 1920×1080 wallpaper |
| `tools/`         | Per-photo theme generator (`marin_generate.py`), manifest, `marin-next` |

---

## Photo themes

Every Marin photo becomes its own Omarchy theme under `~/.config/omarchy/themes/`:
its wallpaper **and** its whole palette (terminal, bar, menus, launcher, lock screen,
window borders) are sampled from that photo. Switching photo and switching desktop
colours is therefore one action.

| # | Theme | Title |
|---|-------|-------|
| 01 | `marin-premium` | Klasik · Festival Gecesi (master, hand-authored palette) |
| 02 | `marin-premium-02-pink` | Pembe Portre |
| 03 | `marin-premium-03-pastel` | Pastel Tam Boy |
| 04 | `marin-premium-04-duo` | İkili Lila |
| 05 | `marin-premium-05-sky` | Gökyüzü |
| 06 | `marin-premium-06-wink` | Göz Kırpma |
| 07 | `marin-premium-07-peace` | Barış İşareti |
| 08 | `marin-premium-08-typography` | Tipografi |
| 09 | `marin-premium-09-kimono` | Kimono Gün Batımı |
| 10 | `marin-premium-10-hanami` | Sakura Kimono |
| 11 | `marin-premium-11-uniform` | Üniforma Kalp |
| 12 | `marin-premium-12-sakura` | Sakura Rüzgarı |
| 13 | `marin-premium-13-deniz` | Deniz Kıyısı |
| 14 | `marin-premium-14-orman` | Orman Fısıltısı |
| 15 | `marin-premium-15-kalp` | Kalp Pozu |
| 16 | `marin-premium-16-isilti` | Işıltı |
| 17 | `marin-premium-17-lila` | Lila Huzur |
| 18 | `marin-premium-18-sehir` | Şehir Yürüyüşü |
| 19 | `marin-premium-19-neseli` | Neşeli An |
| 20 | `marin-premium-20-kalpler` | Kalp Kalbe |
| 21 | `marin-premium-21-altin` | Altın Gyaru |
| 22 | `marin-premium-22-bokeh` | Bokeh Gülüş |
| 23 | `marin-premium-23-seytan` | Şeytani Marin |

Cycle through them (photo + full palette together):

```bash
marin-next        # next photo theme
marin-next prev   # previous photo theme
```

Regenerate any variant after editing the master configs:

```bash
python3 tools/marin_generate.py                 # all photo themes
python3 tools/marin_generate.py --only marin-premium-20-kalpler
python3 tools/marin_generate.py --dry-run       # check palettes without writing
```

---

## Backgrounds

The master theme ships one wallpaper, `backgrounds/Marin-01-festival-night.jpg`
(1920×1080, cropped and given a soft top scrim for bar legibility). The earlier
near-black procedural `BG1–BG6` backgrounds were removed.

Each photo theme carries its own wallpaper under its own `backgrounds/` folder.
All wallpapers are prepared 1920×1080 with a photo-tinted top scrim so the bar
stays readable.

---

## ⚠️ A note on copyright

Marin Kitagawa's character design is the copyrighted work of **Shinichi Fukuda** (manga) and **CloverWorks** (anime). The colors in this theme are *inspired* by her design — color inspiration is not copying, but redistributing someone else's artwork under our name is.

**What this theme is:** the theme's *colors* and *config files* — our work. The photo
themes are a personal wallpaper set; the artwork belongs to its original creators and
is used locally for a personal desktop only, **not** for redistribution of the art.

If you want real Marin wallpapers for personal use, respect the artists' licenses and
do not republish their work.

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

> A theme cloned from a git repo skips the `*.lua` / `*.toml` / `*.json` files Omarchy treats as executable; the rest (including the background) stays.

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

This applies to the theme configuration and the colors. *Marin Kitagawa* is a copyrighted character; the colors are referenced under fair-use / nominative-fair-use for the sake of palette inspiration only. Wallpaper artwork remains the property of its original creators.