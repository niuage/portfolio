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
  --accent-super-light: hwb(153 2% 16%);
}

body {
  font-size: 20px;
}

h1, h2, h3, h4, h5, h6 {
  color: var(--accent);
}
</style>
