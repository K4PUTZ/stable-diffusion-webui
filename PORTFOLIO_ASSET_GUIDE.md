# Stable Diffusion WebUI - Quick Start Guide

## Installation Complete!
Stable Diffusion WebUI is being installed at:
`/Volumes/Expansion/----- PESSOAL -----/PYTHON/stable-diffusion-webui`

## How to Launch

1. **Start the Server:**
   ```bash
   cd "/Volumes/Expansion/----- PESSOAL -----/PYTHON/stable-diffusion-webui"
   ./webui.sh
   ```

2. **Access the Web Interface:**
   - Open your browser to: `http://127.0.0.1:7860`
   - The URL will be shown in the terminal when the server starts

## Creating Assets for Your Portfolio

### For Cinematic/Premiere Theme Backgrounds:
```
Prompt: "dark luxurious textured background, film premiere gala aesthetic, subtle film grain, carbon fiber texture, deep blacks and dark grays with gold amber accents, elegant, professional, high resolution, 4k"

Negative: "bright, colorful, cartoon, low quality, blurry"

Settings:
- Steps: 30-40
- CFG Scale: 7-8
- Size: 2048x1024 (wide background)
```

### For Ornamental Separators:
```
Prompt: "elegant art deco film strip separator, geometric ornamental divider, gold and black, cinema theme, symmetrical, professional broadcasting, high detail, transparent background style"

Negative: "medieval, fantasy, game ui, cluttered"

Settings:
- Steps: 30-40
- CFG Scale: 7-8  
- Size: 2048x256 (horizontal separator)
```

### For Skill Badge Icons:
```
Prompt: "minimalist professional icon, [SKILL NAME], dark background, gold accent, clean lines, modern, broadcasting equipment, vector style"

Examples:
- "minimalist after effects icon, video editing symbol, gold and black"
- "minimalist audio waveform icon, 5.1 surround sound, gold and black"
- "minimalist quality control checklist icon, professional, gold and black"

Settings:
- Steps: 25-30
- CFG Scale: 7
- Size: 512x512
```

## Model Recommendations

The default model (SD 1.5 or SD 2.1) will work, but for better results consider downloading:

1. **Realistic Vision** - Great for professional/realistic textures
2. **DreamShaper** - Good for stylized professional graphics
3. **SDXL** - Higher quality but slower

## Tips for Best Results

1. **Use img2img** for refining - generate base, then refine
2. **Inpainting** - Fix specific areas without regenerating
3. **ControlNet** (optional extension) - More precise control
4. **Batch generate** - Create multiple variations, pick best
5. **Use upscalers** - Generate at lower res, then upscale

## File Locations

- Generated images: `stable-diffusion-webui/outputs/txt2img-images/`
- Models folder: `stable-diffusion-webui/models/Stable-diffusion/`
- Your working directory: `/Volumes/Expansion/----- PESSOAL -----/REEL/MateusRibeiro 5/home/premiere/`

## Stopping the Server

Press `Ctrl+C` in the terminal where webui.sh is running

---

**First Launch Note:** The initial startup downloads the base SD model (~4GB). This happens automatically and takes 5-10 minutes depending on your connection.
