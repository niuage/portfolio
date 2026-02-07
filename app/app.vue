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
  --accent: #06321E;
  --accent-dark: #042415;
}

body {
  font-size: 20px;
}

h1, h2, h3, h4, h5, h6 {
  color: var(--accent);
}
</style>
