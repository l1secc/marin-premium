-- ============================================================================
--  Marin Premium — look'n'feel
--
--  Omarchy's default look is square and flat: decoration:rounding = 0, no
--  shadows, no blur. This is the softer, glassier Marin variant. It lives in
--  the sancttioned user override (~/.config/hypr/looknfeel.lua), loaded after
--  Omarchy's defaults, so package updates keep improving the defaults without
--  touching it.
--
--  Installed from the theme by tools/marin-bootstrap.
--
--  Two things worth knowing:
--    * The Omarchy shell mirrors decoration:rounding into its own
--      Style.cornerRadius, so this single value also softens the bar, menus,
--      launcher, notifications and OSD. It reads it on shell start and after a
--      theme is applied.
--    * Blur is what makes the translucent terminal (foot's own `alpha`, see
--      foot/marin-foot.ini) read as glass instead of mud.
-- ============================================================================

hl.config({
  decoration = {
    -- Soft, round corners — Marin's "premium" half, not the cute extreme.
    -- Tunable: 10 = subtle, 14 = this, 20 = bubbly.
    rounding = 14,
    -- 2 (default) is a plain circle corner; 3 is the softer squircle.
    rounding_power = 3,

    -- Diffused depth so rounded edges read as soft instead of cut out.
    shadow = {
      enabled = true,
      range = 24,
      render_power = 3,
      color = "rgba(1d0a12a6)",
      color_inactive = "rgba(1d0a1273)",
      offset = { 0, 2 },
    },

    -- Glassmorphism: what shows through a translucent surface is blurred.
    blur = {
      enabled = true,
      size = 6,
      -- 2 passes read the same as 3 for this radius and cost less per frame.
      passes = 2,
      noise = 0.0117,
      contrast = 1.0,
      brightness = 1.0,
      new_optimizations = true,
    },
  },
})

-- ============================================================================
--  App translucency — one notch below Omarchy's default
--
--  Omarchy tags every window `default-opacity` and applies "0.985 0.96"
--  (active / inactive) in default/hypr/windows.lua. This file loads after
--  those defaults, so this rule wins: apps (VS Code, browsers, ...) sit a
--  touch more transparent while their text stays fully crisp, and the blur
--  above turns the see-through background into glass.
--
--  Windows that opted out with `-default-opacity` (video players, PiP, games,
--  screen sharing) are deliberately left alone.
--
--  Tunable: "1.0 0.96" = barely there, "0.96 0.92" = this, "0.9 0.85" = bold.
-- ============================================================================
o.window({ tag = "default-opacity" }, { opacity = "0.96 0.92" })

-- ============================================================================
--  Motion — "Marin glides through the screen"
--
--  Omarchy's default config path is Lua; this theme's bespoke bezier curves
--  and window animations used to live only in the legacy hyprland.conf and so
--  never loaded here. They are defined below so the Lua and legacy paths move
--  the same way: calm, expressive, never jarring.
-- ============================================================================

hl.curve("emphasizedDecel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("emphasizedAccel", { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })
hl.curve("menu_decel", { type = "bezier", points = { { 0.1, 1 }, { 0, 1 } } })
hl.curve("menu_accel", { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })

hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "emphasizedDecel", style = "popin 80%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2, bezier = "emphasizedDecel", style = "popin 90%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3, bezier = "emphasizedDecel", style = "slide" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "emphasizedDecel" })
hl.animation({ leaf = "fade", enabled = true, speed = 4, bezier = "menu_decel" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 3, bezier = "menu_decel" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 2.7, bezier = "menu_accel" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 7, bezier = "menu_decel", style = "slide" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 2.7, bezier = "emphasizedDecel", style = "popin 93%" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 2.4, bezier = "menu_accel", style = "popin 94%" })

-- ============================================================================
--  Group bar — Marin's rose-pink accent instead of the flat default.
--
--  The palette-derived window/group border gradient is generated from
--  colors.toml into the theme's hyprland.lua, so it is deliberately not set
--  here: only the groupbar (which the generated file does not touch) gets the
--  theme's canonical rose-pink / lilac / navy so it reads the same on every
--  photo palette.
-- ============================================================================

hl.config({
  group = {
    groupbar = {
      col = {
        active = "rgba(f2a3c0cc)",
        inactive = "rgba(bba7e666)",
      },
      text_color = "rgba(0f1522ff)",
    },
  },
})
