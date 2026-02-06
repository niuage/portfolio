<script setup lang="ts">
const config = useRuntimeConfig()
const baseURL = config.app.baseURL
const route = useRoute()

const currentSection = computed(() => {
  if (route.path.startsWith('/work')) return 'work'
  if (route.path.startsWith('/notebook')) return 'notebook'
  if (route.path.startsWith('/about')) return 'about'
  return 'home'
})
</script>

<template>
  <div class="min-h-screen relative">
    <!-- Planet (centered, outside border) -->
    <div class="absolute left-1/2 -translate-x-1/2 top-0 w-[50vw] md:w-[30vw] max-w-[32rem] px-4 z-10">
      <div class="relative">
        <img :src="`${baseURL}planet.png`" alt="Planet" class="w-full object-contain" />

        <!-- Section Icon Overlay -->
        <div class="absolute left-1/2 -translate-x-1/2 text-white" style="top: 20%">
          <!-- Home -->
          <svg v-if="currentSection === 'home'" class="w-6 h-6" viewBox="0 0 37 40" fill="none">
            <path d="M3.5 23.5V18.5C3.5 10.2157 10.2157 3.5 18.5 3.5C26.7843 3.5 33.5 10.2157 33.5 18.5V23.5" stroke="currentColor" stroke-width="7" stroke-linecap="round"/>
            <path d="M18.5 33.5C19.3284 33.5 20 34.1716 20 35C20 35.8284 19.3284 36.5 18.5 36.5C17.6716 36.5 17 35.8284 17 35C17 34.1716 17.6716 33.5 18.5 33.5Z" fill="currentColor" stroke="currentColor" stroke-width="7"/>
          </svg>
          <!-- Work -->
          <svg v-else-if="currentSection === 'work'" class="w-6 h-6" viewBox="0 0 42 40" fill="none">
            <path d="M12 29.0062L29 12.0062M18 3.50623C28.9639 3.23213 38 12.0451 38 23.0125V23.5062" stroke="currentColor" stroke-width="7" stroke-linecap="round"/>
            <circle cx="3.5" cy="36.5062" r="3.5" fill="currentColor"/>
          </svg>
          <!-- Notebook -->
          <svg v-else-if="currentSection === 'notebook'" class="w-6 h-6" viewBox="0 0 38 37" fill="none">
            <path d="M3.5 3.5H33" stroke="currentColor" stroke-width="7" stroke-linecap="round"/>
            <path d="M33.5132 33.5076L33.5 33.5" stroke="currentColor" stroke-width="7" stroke-linecap="round"/>
            <path d="M4 18.5H33.5" stroke="currentColor" stroke-width="7" stroke-linecap="round"/>
            <path d="M3.5 33.5H22.5" stroke="currentColor" stroke-width="7" stroke-linecap="round"/>
          </svg>
          <!-- About -->
          <svg v-else-if="currentSection === 'about'" class="w-6 h-6" viewBox="0 0 37 40" fill="none">
            <path d="M3.5 36.5V32C3.5 23.7157 10.2157 17 18.5 17C26.7843 17 33.5 23.7157 33.5 32V36.5" stroke="currentColor" stroke-width="7" stroke-linecap="round"/>
            <path d="M18.5 3.5C19.3284 3.5 20 4.17157 20 5C20 5.82843 19.3284 6.5 18.5 6.5C17.6716 6.5 17 5.82843 17 5C17 4.17157 17.6716 3.5 18.5 3.5Z" fill="currentColor" stroke="currentColor" stroke-width="7"/>
          </svg>
        </div>

        <!-- Orbiting Planets (X/Y split animation for fixed elliptical paths) -->
        <!-- Debug: orbit path ellipses -->
        <svg class="orbit-debug orbit-anchor-1" viewBox="-12 -7 24 14" style="width:24vw;height:14vw"><ellipse cx="0" cy="0" rx="12" ry="7" fill="none" stroke="red" stroke-width="0.2" opacity="0.4"/></svg>
        <svg class="orbit-debug orbit-anchor-2" viewBox="-15 -9 30 18" style="width:30vw;height:18vw"><ellipse cx="0" cy="0" rx="15" ry="9" fill="none" stroke="blue" stroke-width="0.2" opacity="0.4"/></svg>
        <svg class="orbit-debug orbit-anchor-3" viewBox="-18 -8 36 16" style="width:36vw;height:16vw"><ellipse cx="0" cy="0" rx="18" ry="8" fill="none" stroke="green" stroke-width="0.2" opacity="0.4"/></svg>
        <svg class="orbit-debug orbit-anchor-4" viewBox="-10 -6 20 12" style="width:20vw;height:12vw"><ellipse cx="0" cy="0" rx="10" ry="6" fill="none" stroke="orange" stroke-width="0.2" opacity="0.4"/></svg>

        <div class="orbit-anchor orbit-anchor-1">
          <div class="orbit-x ox-1">
            <div class="orbit-y oy-1">
              <div class="small-planet"></div>
            </div>
          </div>
        </div>
        <div class="orbit-anchor orbit-anchor-2">
          <div class="orbit-x ox-2">
            <div class="orbit-y oy-2">
              <div class="small-planet big"></div>
            </div>
          </div>
        </div>
        <div class="orbit-anchor orbit-anchor-3">
          <div class="orbit-x ox-3">
            <div class="orbit-y oy-3">
              <div class="small-planet"></div>
            </div>
          </div>
        </div>
        <div class="orbit-anchor orbit-anchor-4">
          <div class="orbit-x ox-4">
            <div class="orbit-y oy-4">
              <div class="small-planet big"></div>
            </div>
          </div>
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
/*
  Elliptical orbits using split X/Y animations.
  - orbit-anchor: positioned at planet center, applies tilt rotation
  - orbit-x: animates translateX (cosine motion)
  - orbit-y: animates translateY (sine motion, 90° phase offset)
  - Different X/Y amplitudes = ellipse. Dot stays perfectly round.

  Sine approximation with 12 keyframe steps for smooth motion.
  Amplitudes are in vw units relative to the planet container.
*/

/* Anchor at planet center, tilted */
.orbit-debug {
  position: absolute;
  top: 0%;
  left: 50%;
  overflow: visible;
}

.orbit-anchor {
  position: absolute;
  top: 0%;
  left: 50%;
}

.orbit-anchor-1 { transform: rotate(15deg); }
.orbit-anchor-2 { transform: rotate(-10deg); }
.orbit-anchor-3 { transform: rotate(30deg); }
.orbit-anchor-4 { transform: rotate(-20deg); }

/* Debug ellipses need translate to center on the anchor point */
svg.orbit-anchor-1 { transform: translate(-50%, -50%) rotate(15deg); }
svg.orbit-anchor-2 { transform: translate(-50%, -50%) rotate(-10deg); }
svg.orbit-anchor-3 { transform: translate(-50%, -50%) rotate(30deg); }
svg.orbit-anchor-4 { transform: translate(-50%, -50%) rotate(-20deg); }

.small-planet {
  width: 12px;
  height: 12px;
  background-color: #000;
  border-radius: 50%;
  transform: translate(-50%, -50%);
}

.small-planet.big {
  width: 24px;
  height: 24px;
}

/*
  Cosine (X): extreme → zero → extreme, per-segment easing:
    At extremes velocity=0 (ease-in to leave, ease-out to arrive)
  Sine (Y): zero → extreme → zero, opposite easing
*/

/* --- Orbit 1: rx=12vw, ry=7vw, 8s --- */
.ox-1 { animation: cos-12 8s infinite; animation-delay: -2s; }
.oy-1 { animation: sin-7 8s infinite; animation-delay: -2s; }

/* --- Orbit 2: rx=15vw, ry=9vw, 12s --- */
.ox-2 { animation: cos-15 12s infinite; animation-delay: -9s; }
.oy-2 { animation: sin-9 12s infinite; animation-delay: -9s; }

/* --- Orbit 3: rx=18vw, ry=8vw, 15s --- */
.ox-3 { animation: cos-18 15s infinite; animation-delay: -4s; }
.oy-3 { animation: sin-8 15s infinite; animation-delay: -4s; }

/* --- Orbit 4: rx=10vw, ry=6vw, 10s --- */
.ox-4 { animation: cos-10 10s infinite; animation-delay: -7s; }
.oy-4 { animation: sin-6 10s infinite; animation-delay: -7s; }

/* Cosine: starts at +A (extreme), slows at extremes, fast at zero crossings */
@keyframes cos-12 {
  0%   { transform: translateX(12vw);  animation-timing-function: ease-in; }
  25%  { transform: translateX(0vw);   animation-timing-function: ease-out; }
  50%  { transform: translateX(-12vw); animation-timing-function: ease-in; }
  75%  { transform: translateX(0vw);   animation-timing-function: ease-out; }
  100% { transform: translateX(12vw); }
}

@keyframes cos-15 {
  0%   { transform: translateX(15vw);  animation-timing-function: ease-in; }
  25%  { transform: translateX(0vw);   animation-timing-function: ease-out; }
  50%  { transform: translateX(-15vw); animation-timing-function: ease-in; }
  75%  { transform: translateX(0vw);   animation-timing-function: ease-out; }
  100% { transform: translateX(15vw); }
}

@keyframes cos-18 {
  0%   { transform: translateX(18vw);  animation-timing-function: ease-in; }
  25%  { transform: translateX(0vw);   animation-timing-function: ease-out; }
  50%  { transform: translateX(-18vw); animation-timing-function: ease-in; }
  75%  { transform: translateX(0vw);   animation-timing-function: ease-out; }
  100% { transform: translateX(18vw); }
}

@keyframes cos-10 {
  0%   { transform: translateX(10vw);  animation-timing-function: ease-in; }
  25%  { transform: translateX(0vw);   animation-timing-function: ease-out; }
  50%  { transform: translateX(-10vw); animation-timing-function: ease-in; }
  75%  { transform: translateX(0vw);   animation-timing-function: ease-out; }
  100% { transform: translateX(10vw); }
}

/* Sine: starts at 0 (zero crossing), fast at zero, slow at extremes */
@keyframes sin-7 {
  0%   { transform: translateY(0vw);   animation-timing-function: ease-out; }
  25%  { transform: translateY(-7vw);  animation-timing-function: ease-in; }
  50%  { transform: translateY(0vw);   animation-timing-function: ease-out; }
  75%  { transform: translateY(7vw);   animation-timing-function: ease-in; }
  100% { transform: translateY(0vw); }
}

@keyframes sin-9 {
  0%   { transform: translateY(0vw);   animation-timing-function: ease-out; }
  25%  { transform: translateY(-9vw);  animation-timing-function: ease-in; }
  50%  { transform: translateY(0vw);   animation-timing-function: ease-out; }
  75%  { transform: translateY(9vw);   animation-timing-function: ease-in; }
  100% { transform: translateY(0vw); }
}

@keyframes sin-8 {
  0%   { transform: translateY(0vw);   animation-timing-function: ease-out; }
  25%  { transform: translateY(-8vw);  animation-timing-function: ease-in; }
  50%  { transform: translateY(0vw);   animation-timing-function: ease-out; }
  75%  { transform: translateY(8vw);   animation-timing-function: ease-in; }
  100% { transform: translateY(0vw); }
}

@keyframes sin-6 {
  0%   { transform: translateY(0vw);   animation-timing-function: ease-out; }
  25%  { transform: translateY(-6vw);  animation-timing-function: ease-in; }
  50%  { transform: translateY(0vw);   animation-timing-function: ease-out; }
  75%  { transform: translateY(6vw);   animation-timing-function: ease-in; }
  100% { transform: translateY(0vw); }
}
</style>
