<script setup lang="ts">
const config = useRuntimeConfig()
const baseURL = config.app.baseURL
const route = useRoute()
</script>

<template>
  <div class="min-h-screen relative">
    <!-- Planet (centered, outside border) -->
    <div class="absolute left-1/2 -translate-x-1/2 top-0 w-[50vw] md:w-[30vw] max-w-[32rem] px-4 z-10">
      <div class="relative">
        <img :src="`${baseURL}planet.png`" alt="Planet" class="w-full object-contain" />

        <!-- Orbiting Planets -->
        <div class="orbit-container orbit-1">
          <div class="small-planet"></div>
        </div>
        <div class="orbit-container orbit-2">
          <div class="small-planet"></div>
        </div>
        <div class="orbit-container orbit-3">
          <div class="small-planet"></div>
        </div>
        <div class="orbit-container orbit-4">
          <div class="small-planet"></div>
        </div>
      </div>
    </div>

    <div class="min-h-screen bg-[#e8e4db] rounded-xl relative overflow-hidden">
      <!-- Fixed Bottom Menu (Desktop) -->
      <div class="hidden lg:flex fixed left-1/2 -translate-x-1/2 bottom-8 flex-row gap-4 bg-black rounded-full px-6 py-3 z-50">
        <NuxtLink to="/work" class="w-12 h-12 flex items-center justify-center text-white hover:scale-110 transition-transform" :class="{ 'opacity-50': route.path !== '/work' }">
          <svg class="w-6 h-6" viewBox="0 0 42 40" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M12 29.0062L29 12.0062M18 3.50623C28.9639 3.23213 38 12.0451 38 23.0125V23.5062" stroke="currentColor" stroke-width="7" stroke-linecap="round"/>
            <circle cx="3.5" cy="36.5062" r="3.5" fill="currentColor"/>
          </svg>
        </NuxtLink>
        <div class="w-px bg-white/20 my-2"></div>
        <NuxtLink to="/work/games" class="w-12 h-12 flex items-center justify-center hover:scale-110 transition-transform" :class="{ 'opacity-50': route.path !== '/work/games' }">
          <img :src="`${baseURL}icon_games.svg`" alt="Games" class="w-6 h-6" />
        </NuxtLink>
        <NuxtLink to="/work/web" class="w-12 h-12 flex items-center justify-center hover:scale-110 transition-transform" :class="{ 'opacity-50': route.path !== '/work/web' }">
          <img :src="`${baseURL}icon_web.svg`" alt="Web" class="w-6 h-6" />
        </NuxtLink>
        <NuxtLink to="/work/illustration" class="w-12 h-12 flex items-center justify-center hover:scale-110 transition-transform" :class="{ 'opacity-50': route.path !== '/work/illustration' }">
          <img :src="`${baseURL}icon_illustration.svg`" alt="Illustration" class="w-6 h-6" />
        </NuxtLink>
        <NuxtLink to="/work/3d" class="w-12 h-12 flex items-center justify-center hover:scale-110 transition-transform" :class="{ 'opacity-50': route.path !== '/work/3d' }">
          <img :src="`${baseURL}icon_3d.svg`" alt="3D" class="w-6 h-6" />
        </NuxtLink>
      </div>

      <!-- Mobile Bottom Navigation -->
      <div class="lg:hidden fixed bottom-0 left-0 right-0 bg-black/90 backdrop-blur-sm z-50">
        <div class="flex justify-around items-center px-4 py-3">
          <NuxtLink to="/work" class="w-12 h-12 flex items-center justify-center text-white" :class="{ 'opacity-50': route.path !== '/work' }">
            <svg class="w-6 h-6" viewBox="0 0 42 40" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M12 29.0062L29 12.0062M18 3.50623C28.9639 3.23213 38 12.0451 38 23.0125V23.5062" stroke="currentColor" stroke-width="7" stroke-linecap="round"/>
              <circle cx="3.5" cy="36.5062" r="3.5" fill="currentColor"/>
            </svg>
          </NuxtLink>
          <div class="w-px h-8 bg-white/20"></div>
          <NuxtLink to="/work/games" class="w-12 h-12 flex items-center justify-center" :class="{ 'opacity-50': route.path !== '/work/games' }">
            <img :src="`${baseURL}icon_games.svg`" alt="Games" class="w-6 h-6" />
          </NuxtLink>
          <NuxtLink to="/work/web" class="w-12 h-12 flex items-center justify-center" :class="{ 'opacity-50': route.path !== '/work/web' }">
            <img :src="`${baseURL}icon_web.svg`" alt="Web" class="w-6 h-6" />
          </NuxtLink>
          <NuxtLink to="/work/illustration" class="w-12 h-12 flex items-center justify-center" :class="{ 'opacity-50': route.path !== '/work/illustration' }">
            <img :src="`${baseURL}icon_illustration.svg`" alt="Illustration" class="w-6 h-6" />
          </NuxtLink>
          <NuxtLink to="/work/3d" class="w-12 h-12 flex items-center justify-center" :class="{ 'opacity-50': route.path !== '/work/3d' }">
            <img :src="`${baseURL}icon_3d.svg`" alt="3D" class="w-6 h-6" />
          </NuxtLink>
        </div>
      </div>

      <!-- Main Content -->
      <div class="max-w-6xl mx-auto px-4 lg:px-8">
        <!-- Header with Planet -->
        <header class="relative pt-40 md:pt-12 pb-32 md:pb-64 flex flex-col md:flex-row items-center md:items-start gap-6 md:gap-0 md:justify-between">
          <!-- Logo -->
          <NuxtLink to="/" class="relative z-10">
            <img :src="`${baseURL}logo.svg`" alt="nüage" class="h-12" />
          </NuxtLink>

          <!-- Navigation Icons -->
          <nav class="flex items-center gap-10 relative z-10">
            <NuxtLink to="/" class="hover:scale-110 transition-transform" :class="{ 'opacity-60': route.path !== '/' }">
              <img :src="`${baseURL}icon_home.svg`" alt="Home" class="w-6 h-6" />
            </NuxtLink>
            <NuxtLink to="/work" class="hover:scale-110 transition-transform" :class="{ 'opacity-60': !route.path.startsWith('/work') }">
              <img :src="`${baseURL}icon_work.svg`" alt="Work" class="w-6 h-6" />
            </NuxtLink>
            <NuxtLink to="/notebook" class="hover:scale-110 transition-transform" :class="{ 'opacity-60': route.path !== '/notebook' }">
              <img :src="`${baseURL}icon_notebook.svg`" alt="Notebook" class="w-6 h-6" />
            </NuxtLink>
            <NuxtLink to="/about" class="hover:scale-110 transition-transform" :class="{ 'opacity-60': route.path !== '/about' }">
              <img :src="`${baseURL}icon_about.svg`" alt="About" class="w-6 h-6" />
            </NuxtLink>
          </nav>
        </header>

        <!-- Page Content -->
        <slot />
      </div>
    </div>
  </div>
</template>

<style scoped>
/* Orbiting planets styles */
.orbit-container {
  position: absolute;
  top: 0%;
  left: 50%;
  transform: translate(-50%, -50%);
  animation-timing-function: linear;
  animation-iteration-count: infinite;
}

.orbit-1 {
  width: 170%;
  height: 170%;
  animation: orbit 8s linear infinite;
  animation-delay: -2s;
}

.orbit-2 {
  width: 220%;
  height: 220%;
  animation: orbit 12s linear infinite;
  animation-delay: -9s;
}

.orbit-3 {
  width: 250%;
  height: 250%;
  animation: orbit 15s linear infinite;
  animation-delay: -4s;
}

.orbit-4 {
  width: 180%;
  height: 180%;
  animation: orbit 10s linear infinite;
  animation-delay: -7s;
}

.small-planet {
  position: absolute;
  top: 0;
  left: 50%;
  width: 12px;
  height: 12px;
  background-color: #000;
  border-radius: 50%;
  transform: translateX(-50%);
}

/* Make some planets bigger */
.orbit-2 .small-planet,
.orbit-4 .small-planet {
  width: 24px;
  height: 24px;
}

@keyframes orbit {
  from {
    transform: translate(-50%, -50%) rotate(0deg);
  }
  to {
    transform: translate(-50%, -50%) rotate(360deg);
  }
}
</style>
