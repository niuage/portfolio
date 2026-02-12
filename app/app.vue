<template>
  <div>
    <NuxtRouteAnnouncer />
    <NuxtLayout>
      <NuxtPage />
    </NuxtLayout>
  </div>
</template>

<style>
@property --accent {
  syntax: '<color>';
  inherits: true;
  initial-value: hwb(153 2% 80%);
}

@property --bg {
  syntax: '<color>';
  inherits: true;
  initial-value: white;
}

@property --text {
  syntax: '<color>';
  inherits: true;
  initial-value: black;
}

@property --text-muted {
  syntax: '<color>';
  inherits: true;
  initial-value: #6b7280;
}

@property --text-faint {
  syntax: '<color>';
  inherits: true;
  initial-value: #9ca3af;
}

@property --text-separator {
  syntax: '<color>';
  inherits: true;
  initial-value: #d1d5db;
}

@property --heading {
  syntax: '<color>';
  inherits: true;
  initial-value: hwb(153 2% 80%);
}

:root {
  --accent: hwb(153 2% 80%);
  transition: --accent 0.5s, --bg 0.5s, --text 0.5s, --text-muted 0.5s, --text-faint 0.5s, --text-separator 0.5s, --heading 0.5s;
  /* --accent: hwb(256 6% 60%); */
  --accent-dark: hwb(from var(--accent) h w 80%);
  --accent-light: hwb(from var(--accent) h w 60%);
  --accent-super-light: hwb(from var(--accent) h w 16%);
  --accent-nav-active: hwb(from var(--accent) h w 70%);

  --accent-link: hwb(from var(--accent) h w 40%);

  --accent-small-planet: hwb(from var(--accent) h w 50%);
  --planet-falloff: 70%;

  --menu-glow-opacity: 0.5;
  --nav-glow-size: 40px;
  --nav-glow-opacity: 0.6;
  --glow-fade-duration: 1s;
  /* --bg: #f3ebda; */
  --bg: white;
  --text: black;
  --text-muted: #6b7280;
  --text-faint: #9ca3af;
  --text-separator: #d1d5db;
  --heading: var(--accent);
  --main-planet-inner: hwb(from var(--accent) h w 89%);
  --main-planet-outer: var(--accent-dark);
  --planet-ring-inner: var(--bg);
  --planet-ring-outer: var(--bg);
  --planet-shadow-opacity: 0%;
  --planet-icon-top: 25%;
  --orbit-scale: 1.4;
}

@media (min-width: 768px) {
  :root {
    --orbit-scale: 1;
  }
}

body {
  font-size: 24px;
}

h1, h2, h3, h4, h5, h6 {
  color: var(--heading);
}

p {
  color: var(--text);
}

a {
  color: var(--accent-link);
}

a:hover {
  opacity: 0.8;
}

:root.dark {
  --bg: hwb(132 9% 87%);
  --text: #e5e5e5;
  --text-muted: #a3a3a3;
  --text-faint: #737373;
  --text-separator: #525252;
  --heading: white;
  --accent: hwb(48 2% 5%);
  --accent-link: hwb(from var(--accent) h w 12%);
  --accent-dark: hwb(132 9% 89%);
  --accent-super-light: hwb(from var(--bg) h w 50%);
  --accent-nav-active: var(--accent);
  --main-planet-inner: hwb(132 9% 95%);
  --main-planet-outer: hwb(132 9% 84%);
}
</style>
