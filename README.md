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
| `colors.toml`    | **Active** palette (drives terminals, editors, bar, menus, lock screen) |
| `hyprland.conf`  | Active window manager: gradient border, blur, shadows, animations      |
| `shell.toml`     | Active Omarchy bar / OSD / launcher / menu / lock surfaces             |
| `waybar.css`     | Active Glassmorphism Waybar styles                                     |
| `backgrounds/`   | 20 Marin wallpapers (1920×1080) — the theme's gallery                  |
| `palettes/`      | 20 palette bundles; `marin-next` copies one to the root on switch      |
| `tools/`         | `marin_generate.py` (palette generator) + `marin-next` (photo switcher) |

---

## One theme, all photos

All 20 Marin photos live under the **single** `marin-premium` theme. Each photo
has a palette bundle in `palettes/<num>-<slug>/`; `marin-next` copies the chosen
bundle's `colors.toml` / `shell.toml` / `waybar.css` / `hyprland.conf` to the
theme root, re-applies the theme — so Omarchy regenerates every terminal,
editor, bar, menu, launcher and lock-screen config from that photo's palette —
and then pins the matching wallpaper.

One roof holds everything: one theme entry, one gallery of 20 wallpapers, one
palette per photo.

| # | Title | Palette bundle |
|---|-------|----------------|
| 01 | Klasik · Festival Gecesi | `palettes/01-marin-premium` |
| 02 | Kimono Gün Batımı | `palettes/02-marin-premium-02-kimono` |
| 03 | Kalp Kalbe | `palettes/03-marin-premium-03-kalpler` |
| 04 | Zarif Duruş | `palettes/04-marin-premium-04-zarif` |
| 05 | Parkta Mola | `palettes/05-marin-premium-05-park` |
| 06 | Sahil Molası | `palettes/06-marin-premium-06-sahil` |
| 07 | Yumuşak Bakış | `palettes/07-marin-premium-07-profil` |
| 08 | Tatlı Gülüş | `palettes/08-marin-premium-08-gulus` |
| 09 | Dantel Beyaz | `palettes/09-marin-premium-09-dantel` |
| 10 | Şapkalı Yaz | `palettes/10-marin-premium-10-sapka` |
| 11 | Selfie Anı | `palettes/11-marin-premium-11-selfie` |
| 12 | Pencere Işığı | `palettes/12-marin-premium-12-pencere` |
| 13 | Utangaç An | `palettes/13-marin-premium-13-utangac` |
| 14 | Kafe Keyfi | `palettes/14-marin-premium-14-kafe` |
| 15 | Sokakta | `palettes/15-marin-premium-15-sokak` |
| 16 | Yumuşak Işık | `palettes/16-marin-premium-16-yumusak` |
| 17 | Deniz Esintisi | `palettes/17-marin-premium-17-esinti` |
| 18 | Pembe Enerji | `palettes/18-marin-premium-18-pembe` |
| 19 | Şehir Işıkları | `palettes/19-marin-premium-19-sehir` |
| 20 | Keyif Anı | `palettes/20-marin-premium-20-keyif` |

Switch photo + whole desktop palette together:

```bash
marin-next          # next photo: wallpaper + every surface retinted
marin-next prev     # previous photo
marin-next 20       # jump to photo #20
marin-next bokeh    # jump by name match
marin-next sync     # re-align palette with the current background
```

Regenerate the bundles and wallpapers after editing the classic master configs:

```bash
python3 tools/marin_generate.py                 # all palettes + wallpapers
python3 tools/marin_generate.py --only marin-premium-20-kalpler
python3 tools/marin_generate.py --dry-run       # check palettes without writing
```

---

## Backgrounds

The single theme ships **20 Marin wallpapers** in `backgrounds/`. Each is
1920×1080, cropped to 16:9 and given a photo-tinted top scrim so the bar stays
readable. The earlier near-black procedural `BG1–BG6` backgrounds were removed.

`marin-next` keeps the wallpaper and the palette in sync. Omarchy's own
`omarchy theme bg next` can cycle the gallery without retinting; run
`marin-next sync` afterwards to align the desktop with that wallpaper.

---

## ⚠️ A note on copyright

Marin Kitagawa's character design is the copyrighted work of **Shinichi Fukuda** (manga) and **CloverWorks** (anime). The colors in this theme are *inspired* by her design — color inspiration is not copying, but redistributing someone else's artwork under our name is.

**What this theme is:** the theme's *colors* and *config files* — our work. The photo
themes are a personal wallpaper set; the artwork belongs to its original creators and
is used locally for a personal desktop only, **not** for redistribution of the art.

If you want to add your own wallpaper to the gallery instead, see
[CREDITS.md](CREDITS.md) for the provenance of the bundled artwork and drop your
file in `backgrounds/`:

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

### Through Omarchy's own theme installer (recommended)

```bash
omarchy theme install https://github.com/l1secc/marin-premium.git
~/.config/omarchy/themes/marin-premium/install.sh
```

`omarchy theme install` clones the repo and applies the theme in one go. Because
Omarchy never runs code from a theme it installed, the second line is the
one-time bootstrap that puts the photo switcher on your PATH. It is idempotent,
and a `theme-set` hook keeps it current after `omarchy theme update` or a
re-apply.

### One command (clone + apply + bootstrap)

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/l1secc/marin-premium/master/bootstrap.sh)
```

### From a local checkout (development)

```bash
./install.sh
omarchy theme set "Marin Premium"
```

> Omarchy keeps a theme installed from a git repo colours-only: any `*.lua`, the
> terminal configs (`alacritty.toml`, `foot.ini`, `ghostty.conf`, `kitty.conf`)
> and `vscode.json` are dropped and regenerated from `colors.toml` instead.
> Everything else — `backgrounds/`, `palettes/`, `tools/` — is kept as written.

### Showing up in the Omarchy theme picker

The built-in picker reads the community list from
[omarchy-site](https://github.com/omacom/omarchy-site) `src/data/themes.json`.
Adding this theme there is a PR that pairs a 16:9 preview image under
`assets/themes/` with one entry:

```json
{ "repo": "https://github.com/l1secc/marin-premium", "image": "/assets/themes/marin-premium.webp", "name": "Marin Premium" }
```

---

## Customization

### Tweak the classic palette

The root `colors.toml` is the *active* palette and is replaced on every
`marin-next` switch. To change the default (classic) palette, edit
`palettes/01-marin-premium/colors.toml`, regenerate the other bundles from it,
then apply:

```bash
python3 tools/marin_generate.py     # retint all bundles from the classic
marin-next 1                        # apply the classic palette
```

### Adjust window animations

Edit `hyprland.conf` — all bezier curves are commented with intent. Save and Hyprland auto-reloads; check for errors with:

```bash
hyprctl configerrors
```

### Change the Waybar

Edit `waybar.css` — the file is fully tokenized with `@define-color` at the top. The bar reads this file on save; if Waybar doesn't, restart it with `omarchy restart waybar` (varies by setup).

### Add a wallpaper to the gallery

Drop any 1920×1080 (or higher) PNG/JPG/WEBP into `backgrounds/`, then add a
matching bundle under `palettes/` (or point `marin-next` at it). Cycle the
gallery with `Super + Alt + Space` → Style → Background, or:

```bash
omarchy theme bg next   # wallpaper only
marin-next sync         # retint the desktop to that wallpaper
```

---

## License

[MIT](LICENSE)

This applies to the theme configuration and the colors. *Marin Kitagawa* is a copyrighted character; the colors are referenced under fair-use / nominative-fair-use for the sake of palette inspiration only. Wallpaper artwork remains the property of its original creators.