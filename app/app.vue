<template>
  <div>
    <NuxtRouteAnnouncer />
    <NuxtLayout>
      <NuxtPage />
    </NuxtLayout>
  </div>
</template>

<style>
:root {
  --accent: hwb(153 2% 80%);
  /* --accent: hwb(256 6% 60%); */
  --accent-dark: hwb(from var(--accent) h w 85%);
  --accent-light: hwb(from var(--accent) h w 60%);
  --accent-super-light: hwb(from var(--accent) h w 16%);

  --menu-glow-opacity: 0.5;
  --nav-glow-size: 40px;
  --nav-glow-opacity: 0.6;
  --glow-fade-duration: 1.5s;
  --bg: #f3ebda;
  --planet-ring-inner: white;
  --planet-ring-outer: var(--bg);
  --planet-shadow-opacity: 70%;
  --planet-offset: -25%;
  --planet-icon-top: 17%;
}

body {
  font-size: 20px;
}

h1, h2, h3, h4, h5, h6 {
  color: var(--accent);
}
</style>
