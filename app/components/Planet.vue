<script setup lang="ts">
import PlanetSvg from '~/assets/icons/planet2.svg?skipsvgo';

defineProps<{
  currentSection: string
}>()

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
</template>

<style scoped>
.planet-glow {
  position: absolute;
  top: -40%;
  right: 10%;
  width: 60px;
  height: 60px;
  border-radius: 9999px;
  background: var(--accent-super-light);
  filter: blur(30px);
  pointer-events: none;
}

@media (min-width: 768px) {
  .planet-glow {
    width: 120px;
    height: 120px;
    filter: blur(60px);
  }
}

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
