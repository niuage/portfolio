<script setup lang="ts">
import PlanetSvg from '~/assets/icons/planet2.svg?skipsvgo';

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

// --- Menu glow ---
const menuRef = ref<HTMLElement | null>(null)
const menuGlowX = ref(0)
const menuGlowY = ref(0)
const menuGlowVisible = ref(false)

function onMenuMouseMove(e: MouseEvent) {
  if (!menuRef.value) return
  const rect = menuRef.value.getBoundingClientRect()
  menuGlowX.value = e.clientX - rect.left
  menuGlowY.value = e.clientY - rect.top
  menuGlowVisible.value = true
}

function onMenuMouseLeave() {
  menuGlowVisible.value = false
}

// --- Nav glow ---
const navRef = ref<HTMLElement | null>(null)
const navGlowX = ref(0)
const navGlowY = ref(0)
const navGlowVisible = ref(false)

function onNavMouseMove(e: MouseEvent) {
  if (!navRef.value) return
  const rect = navRef.value.getBoundingClientRect()
  navGlowX.value = e.clientX - rect.left
  navGlowY.value = e.clientY - rect.top
  navGlowVisible.value = true
}

function onNavMouseLeave() {
  navGlowVisible.value = false
}
</script>

<template>
  <div class="min-h-screen relative">
    <!-- Planet (centered, outside border) -->
    <div class="absolute left-1/2 -translate-x-1/2 -top-px w-[50vw] md:w-[30vw] max-w-[32rem] px-4 z-10">
      <div class="relative">
        <PlanetSvg class="w-full h-auto block" />
        <div class="planet-glow"></div>

        <!-- Section Icon Overlay -->
        <div class="absolute left-1/2 -translate-x-1/2 text-white" style="top: var(--planet-icon-top)">
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

        <!-- Orbit planets (2 per ring, opposite sides) -->
        <template v-for="(o, i) in orbitData" :key="'orbit-' + i">
          <!-- Planet 1 -->
          <div
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
                <div class="small-planet" :class="{ big: o.big }" :style="{ '--orbit-duration': o.duration + 's', '--orbit-delay': o.delay + 's' }"></div>
              </div>
            </div>
          </div>
          <!-- Planet 2 (opposite side: delay offset by half the duration) -->
          <div
            class="orbit-anchor"
            :style="{ transform: `rotate(${orbitTilt}deg)` }"
          >
            <div
              class="orbit-x"
              :style="{
                '--rx': o.rx + 'vw',
                animationDuration: o.duration + 's',
                animationDelay: (o.delay - o.duration / 2) + 's',
              }"
            >
              <div
                class="orbit-y"
                :style="{
                  '--ry': o.ry + 'vw',
                  animationDuration: o.duration + 's',
                  animationDelay: (o.delay - o.duration / 2) + 's',
                }"
              >
                <div class="small-planet" :class="{ big: o.big }" :style="{ '--orbit-duration': o.duration + 's', '--orbit-delay': (o.delay - o.duration / 2) + 's' }"></div>
              </div>
            </div>
          </div>
        </template>
      </div>
    </div>

    <div class="min-h-screen bg-[var(--bg)] rounded-xl relative overflow-hidden">
      <!-- Fixed Bottom Menu (Desktop) -->
      <div
        ref="menuRef"
        class="hidden lg:flex fixed left-1/2 -translate-x-1/2 bottom-8 flex-row gap-4 bg-[var(--accent-dark)] rounded-full px-4 py-1 z-50 overflow-hidden"
        @mousemove="onMenuMouseMove"
        @mouseleave="onMenuMouseLeave"
      >
        <div
          class="menu-glow"
          :style="{
            left: menuGlowX + 'px',
            top: menuGlowY + 'px',
            opacity: menuGlowVisible ? 'var(--menu-glow-opacity)' : 0,
          }"
        ></div>
        <NuxtLink to="/work" class="menu-icon" :class="{ 'menu-icon-active': route.path === '/work' }">
          <Icon name="work" />
        </NuxtLink>
        <div class="w-px bg-white/20 my-2"></div>
        <NuxtLink to="/work/games" class="menu-icon" :class="{ 'menu-icon-active': route.path === '/work/games' }">
          <Icon name="games" />
        </NuxtLink>
        <NuxtLink to="/work/web" class="menu-icon" :class="{ 'menu-icon-active': route.path === '/work/web' }">
          <Icon name="web" />
        </NuxtLink>
        <NuxtLink to="/work/illustration" class="menu-icon" :class="{ 'menu-icon-active': route.path === '/work/illustration' }">
          <Icon name="illustration" />
        </NuxtLink>
        <NuxtLink to="/work/3d" class="menu-icon" :class="{ 'menu-icon-active': route.path === '/work/3d' }">
          <Icon name="3d" />
        </NuxtLink>
      </div>

      <!-- Mobile Bottom Navigation -->
      <div class="lg:hidden fixed bottom-0 left-0 right-0 bg-[var(--accent-dark)] backdrop-blur-sm z-50">
        <div class="flex justify-around items-center px-4 py-3">
          <NuxtLink to="/work" class="w-12 h-12 flex items-center justify-center text-white" :class="{ 'opacity-50': route.path !== '/work' }">
            <Icon name="work" />
          </NuxtLink>
          <div class="w-px h-8 bg-white/20"></div>
          <NuxtLink to="/work/games" class="w-12 h-12 flex items-center justify-center text-white" :class="{ 'opacity-50': route.path !== '/work/games' }">
            <Icon name="games" />
          </NuxtLink>
          <NuxtLink to="/work/web" class="w-12 h-12 flex items-center justify-center text-white" :class="{ 'opacity-50': route.path !== '/work/web' }">
            <Icon name="web" />
          </NuxtLink>
          <NuxtLink to="/work/illustration" class="w-12 h-12 flex items-center justify-center text-white" :class="{ 'opacity-50': route.path !== '/work/illustration' }">
            <Icon name="illustration" />
          </NuxtLink>
          <NuxtLink to="/work/3d" class="w-12 h-12 flex items-center justify-center text-white" :class="{ 'opacity-50': route.path !== '/work/3d' }">
            <Icon name="3d" />
          </NuxtLink>
        </div>
      </div>

      <!-- Main Content -->
      <div class="max-w-6xl mx-auto px-4 lg:px-8">
        <!-- Header with Planet -->
        <header class="relative pt-40 md:pt-12 pb-32 md:pb-64 flex flex-col md:flex-row items-center md:items-start gap-6 md:gap-0 md:justify-between">
          <!-- Logo -->
          <NuxtLink to="/" class="relative z-10 text-[var(--accent)]">
            <div class="logo-glow"></div>
            <svg class="h-12 relative" viewBox="0 0 231 70" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd" clip-rule="evenodd" d="M20 10C14.4772 10 10 14.4772 10 20V45C10 47.7614 7.76142 50 5 50C2.23858 50 0 47.7614 0 45V20C0 8.9543 8.9543 0 20 0C31.0457 0 40 8.95431 40 20V45C40 47.7614 37.7614 50 35 50C32.2386 50 30 47.7614 30 45V20C30 14.4772 25.5228 10 20 10Z" fill="currentColor"/>
              <path fill-rule="evenodd" clip-rule="evenodd" d="M120 10C114.477 10 110 14.4772 110 20V45C110 47.7614 107.761 50 105 50C102.239 50 100 47.7614 100 45V20C100 8.9543 108.954 0 120 0C131.046 0 140 8.95431 140 20V45C140 47.7614 137.761 50 135 50C132.239 50 130 47.7614 130 45V20C130 14.4772 125.523 10 120 10Z" fill="currentColor"/>
              <path fill-rule="evenodd" clip-rule="evenodd" d="M170 10C164.477 10 160 14.4772 160 20V30C160 35.5228 164.477 40 170 40C175.523 40 180 35.5228 180 30V20C180 14.4772 175.523 10 170 10ZM150 20C150 8.9543 158.954 0 170 0C181.046 0 190 8.95431 190 20V30C190 41.0457 181.046 50 170 50C158.954 50 150 41.0457 150 30V20Z" fill="currentColor"/>
              <path fill-rule="evenodd" clip-rule="evenodd" d="M200 25C200 11.1929 211.193 0 225 0H225.5C228.261 0 230.5 2.23858 230.5 5C230.5 7.76142 228.261 10 225.5 10H225C216.716 10 210 16.7157 210 25C210 33.2843 216.716 40 225 40H225.5C228.261 40 230.5 42.2386 230.5 45C230.5 47.7614 228.261 50 225.5 50H225C211.193 50 200 38.8071 200 25Z" fill="currentColor"/>
              <path fill-rule="evenodd" clip-rule="evenodd" d="M85 0C87.7614 0 90 2.23858 90 5V30.5C90 41.5457 81.0457 50.5 70 50.5C58.9543 50.5 50 41.5457 50 30.5V25C50 22.2386 52.2386 20 55 20C57.7614 20 60 22.2386 60 25V30.5C60 36.0229 64.4772 40.5 70 40.5C75.5228 40.5 80 36.0228 80 30.5V5C80 2.23858 82.2386 0 85 0Z" fill="currentColor"/>
              <path d="M60 5C60 7.76142 57.7614 10 55 10C52.2386 10 50 7.76142 50 5C50 2.23858 52.2386 0 55 0C57.7614 0 60 2.23858 60 5Z" fill="currentColor"/>
              <path d="M230 25.1C230 27.8614 227.761 30.1 225 30.1C222.239 30.1 220 27.8614 220 25.1C220 22.3386 222.239 20.1 225 20.1C227.761 20.1 230 22.3386 230 25.1Z" fill="currentColor"/>
              <path fill-rule="evenodd" clip-rule="evenodd" d="M185 25C187.761 25 190 27.2386 190 30V48.8197C190 57.5656 185.059 65.5608 177.236 69.4721C174.766 70.7071 171.763 69.706 170.528 67.2361C169.293 64.7662 170.294 61.7628 172.764 60.5279C177.199 58.3105 180 53.7779 180 48.8197V30C180 27.2386 182.239 25 185 25Z" fill="currentColor"/>
              <path fill-rule="evenodd" clip-rule="evenodd" d="M135 15C137.761 15 140 17.2386 140 20C140 28.0225 135.467 35.3565 128.292 38.9443L127.236 39.4721C124.766 40.7071 121.763 39.706 120.528 37.2361C119.293 34.7662 120.294 31.7628 122.764 30.5279L123.82 30C127.607 28.1061 130 24.2348 130 20C130 17.2386 132.239 15 135 15Z" fill="currentColor"/>
            </svg>
          </NuxtLink>

          <!-- Navigation Icons -->
          <nav
            ref="navRef"
            class="flex items-center gap-10 relative z-10 overflow-visible"
            @mousemove="onNavMouseMove"
            @mouseleave="onNavMouseLeave"
          >
            <div
              class="nav-glow"
              :style="{
                left: navGlowX + 'px',
                top: navGlowY + 'px',
                opacity: navGlowVisible ? 'var(--nav-glow-opacity)' : 0,
              }"
            ></div>
            <NuxtLink to="/" class="nav-icon" :class="{ 'nav-icon-active': route.path === '/' }">
              <Icon name="home" />
            </NuxtLink>
            <NuxtLink to="/work" class="nav-icon" :class="{ 'nav-icon-active': route.path.startsWith('/work') }">
              <Icon name="work" />
            </NuxtLink>
            <NuxtLink to="/notebook" class="nav-icon" :class="{ 'nav-icon-active': route.path === '/notebook' }">
              <Icon name="notebook" />
            </NuxtLink>
            <NuxtLink to="/about" class="nav-icon" :class="{ 'nav-icon-active': route.path === '/about' }">
              <Icon name="about" />
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
.nav-icon {
  color: black;
  transition: transform 0.2s, color 0.2s;
}

.nav-icon:hover {
  transform: scale(1.1);
}

.nav-icon-active {
  color: var(--accent-nav-active);
}

.nav-glow {
  position: absolute;
  transform: translate(-50%, -50%);
  width: var(--nav-glow-size);
  height: var(--nav-glow-size);
  border-radius: 9999px;
  background: var(--accent-super-light);
  filter: blur(20px);
  pointer-events: none;
  transition: opacity var(--glow-fade-duration);
}

.menu-icon {
  width: 3rem;
  height: 3rem;
  display: flex;
  align-items: center;
  justify-content: center;
  color: rgba(255, 255, 255, 0.5);
  transition: transform 0.2s, color 0.2s;
}

.menu-icon:hover,
.menu-icon-active {
  transform: scale(1.1);
  color: white;
}

.menu-glow {
  position: absolute;
  transform: translate(-50%, -50%);
  width: 120px;
  height: 120px;
  border-radius: 9999px;
  background: var(--accent-super-light);
  filter: blur(40px);
  pointer-events: none;
  transition: opacity var(--glow-fade-duration);
}

.planet-glow {
  position: absolute;
  top: -40%;
  right: 10%;
  width: 120px;
  height: 120px;
  border-radius: 9999px;
  background: var(--accent-super-light);
  filter: blur(60px);
  pointer-events: none;
}

.logo-glow {
  display: none;
  position: absolute;
  top: -150px;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 160px;
  height: 160px;
  border-radius: 9999px;
  background: var(--accent-super-light);
  filter: blur(60px);
  z-index: -1;
  pointer-events: none;
}

@media (min-width: 768px) {
  .logo-glow {
    display: block;
  }
}

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
  border-radius: 50%;
  transform: translate(-50%, -50%);
  box-shadow: 0 0 20px 3px color-mix(in srgb, var(--bg) var(--planet-shadow-opacity), transparent);
  overflow: hidden;
  position: relative;
}

.small-planet::before {
  content: '';
  position: absolute;
  inset: 0;
  border-radius: 50%;
  background: radial-gradient(circle at 0% 50%, var(--accent-small-planet) 0%, var(--accent-dark) var(--planet-falloff));
  animation: planet-light var(--orbit-duration) var(--orbit-delay) infinite linear;
}

@keyframes planet-light {
  from { transform: rotate(0deg); }
  to { transform: rotate(-360deg); }
}

.small-planet.big {
  width: 24px;
  height: 24px;
}

.orbit-x { animation: ellipse-x infinite; }
.orbit-y { animation: ellipse-y infinite; }

/* Cosine (X): slow at extremes, fast at zero crossings */
@keyframes ellipse-x {
  0%   { transform: translateX(calc(var(--rx) * var(--orbit-scale)));          animation-timing-function: ease-in; }
  25%  { transform: translateX(0);                                             animation-timing-function: ease-out; }
  50%  { transform: translateX(calc(var(--rx) * var(--orbit-scale) * -1));     animation-timing-function: ease-in; }
  75%  { transform: translateX(0);                                             animation-timing-function: ease-out; }
  100% { transform: translateX(calc(var(--rx) * var(--orbit-scale))); }
}

/* Sine (Y): fast at zero crossings, slow at extremes */
@keyframes ellipse-y {
  0%   { transform: translateY(0);                                             animation-timing-function: ease-out; }
  25%  { transform: translateY(calc(var(--ry) * var(--orbit-scale) * -1));     animation-timing-function: ease-in; }
  50%  { transform: translateY(0);                                             animation-timing-function: ease-out; }
  75%  { transform: translateY(calc(var(--ry) * var(--orbit-scale)));          animation-timing-function: ease-in; }
  100% { transform: translateY(0); }
}
</style>
