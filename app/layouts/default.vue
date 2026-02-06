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

// --- Orbit config ---
const orbitTilt = -10        // deg, shared tilt for all orbits
const orbitBaseRx = 12       // vw, smallest orbit X radius
const orbitBaseRy = 5        // vw, smallest orbit Y radius
const orbitGapRx = 4         // vw, X radius increment per orbit
const orbitGapRy = 2         // vw, Y radius increment per orbit

const orbits = [
  { duration: 8,  delay: -2, big: false },
  { duration: 12, delay: -9, big: true },
  { duration: 15, delay: -4, big: false },
  { duration: 10, delay: -7, big: true },
]

const orbitData = computed(() =>
  orbits.map((o, i) => ({
    ...o,
    rx: orbitBaseRx + orbitGapRx * i,
    ry: orbitBaseRy + orbitGapRy * i,
  }))
)
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

        <!-- Orbiting Planets -->
        <!-- Debug ellipses -->
        <svg
          v-for="(o, i) in orbitData"
          :key="'debug-' + i"
          class="orbit-debug"
          :style="{
            width: o.rx * 2 + 'vw',
            height: o.ry * 2 + 'vw',
            transform: `translate(-50%, -50%) rotate(${orbitTilt}deg)`,
          }"
          :viewBox="`${-o.rx} ${-o.ry} ${o.rx * 2} ${o.ry * 2}`"
        >
          <!-- <ellipse cx="0" cy="0" :rx="o.rx" :ry="o.ry" fill="none" stroke="rgba(0, 0, 0, 0.1)" stroke-width="0.15" opacity="0.4" /> -->
        </svg>

        <!-- Orbit planets -->
        <div
          v-for="(o, i) in orbitData"
          :key="'orbit-' + i"
          class="orbit-anchor"
          :style="{ transform: `rotate(${orbitTilt}deg)` }"
        >
          <div
            class="orbit-x"
            :style="{
              '--rx': o.rx + 'vw',
              animationDuration: o.duration + 's',
              animationDelay: o.delay + 's',
            }"
          >
            <div
              class="orbit-y"
              :style="{
                '--ry': o.ry + 'vw',
                animationDuration: o.duration + 's',
                animationDelay: o.delay + 's',
              }"
            >
              <div class="small-planet" :class="{ big: o.big }"></div>
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
  Amplitudes come from CSS custom properties --rx and --ry set per element.
  Only 2 keyframe definitions needed.
*/

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

.small-planet {
  width: 12px;
  height: 12px;
  background-color: #000;
  border-radius: 50%;
  transform: translate(-50%, -50%);
  mix-blend-mode: difference;
}

.small-planet.big {
  width: 24px;
  height: 24px;
}

.orbit-x { animation: ellipse-x infinite; }
.orbit-y { animation: ellipse-y infinite; }

/* Cosine (X): slow at extremes, fast at zero crossings */
@keyframes ellipse-x {
  0%   { transform: translateX(var(--rx));                animation-timing-function: ease-in; }
  25%  { transform: translateX(0);                        animation-timing-function: ease-out; }
  50%  { transform: translateX(calc(var(--rx) * -1));     animation-timing-function: ease-in; }
  75%  { transform: translateX(0);                        animation-timing-function: ease-out; }
  100% { transform: translateX(var(--rx)); }
}

/* Sine (Y): fast at zero crossings, slow at extremes */
@keyframes ellipse-y {
  0%   { transform: translateY(0);                        animation-timing-function: ease-out; }
  25%  { transform: translateY(calc(var(--ry) * -1));     animation-timing-function: ease-in; }
  50%  { transform: translateY(0);                        animation-timing-function: ease-out; }
  75%  { transform: translateY(var(--ry));                animation-timing-function: ease-in; }
  100% { transform: translateY(0); }
}
</style>
