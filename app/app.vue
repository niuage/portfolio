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
  --accent-dark: hwb(153 2% 85%);
  --accent-light: hwb(153 2% 30%);
  --accent-super-light: hwb(153 2% 16%);
  --menu-glow-opacity: 0.5;
  --nav-glow-size: 40px;
  --nav-glow-opacity: 0.6;
  --glow-fade-duration: 1.5s;
}

body {
  font-size: 20px;
}

h1, h2, h3, h4, h5, h6 {
  color: var(--accent);
}
</style>
