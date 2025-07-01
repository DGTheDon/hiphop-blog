/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        "electric-gold": "#FFD700",
        "deep-purple": "#1A0033",
        "neon-green": "#39FF14",
        "blood-orange": "#FF4500",
        "platinum": "#E5E4E2",
        "rich-black": "#0A0A0A",
        "charcoal": "#1C1C1C",
        "smoke": "#2D2D2D",
        "ghost-white": "#F8F8FF",
        "silver": "#C0C0C0",
        "pure-white": "#FFFFFF",
        "light-gray": "#F5F5F5",
        "concrete": "#E8E8E8",
        "jet-black": "#0A0A0A",
      },
      fontFamily: {
        heading: ['Druk Wide', 'Bebas Neue', 'Oswald', 'sans-serif'],
        body: ['Inter', 'Helvetica Neue', 'Arial', 'sans-serif'],
        accent: ['Righteous', 'Fredoka One', 'cursive'],
        monospace: ['JetBrains Mono', 'Fira Code', 'monospace'],
      },
    },
  },
  plugins: [],
}
