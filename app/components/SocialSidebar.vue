<script setup lang="ts">
const glowX = ref(0)
const glowY = ref(0)
const glowVisible = ref(false)

function onMouseMove(e: MouseEvent) {
  const el = e.currentTarget as HTMLElement
  const rect = el.getBoundingClientRect()
  glowX.value = e.clientX - rect.left
  glowY.value = e.clientY - rect.top
  glowVisible.value = true
}

function onMouseLeave() {
  glowVisible.value = false
}

// --- Color picker ---
const colors = [
  { name: 'green', value: 'hwb(153 2% 80%)' },
  { name: 'purple', value: 'hwb(256 6% 60%)' },
  { name: 'blue', value: 'hwb(210 5% 70%)' },
  { name: 'pink', value: 'hwb(320 5% 80%)' },
  { name: 'teal', value: 'hwb(180 5% 70%)' },
  { name: 'black', value: 'hwb(0 0% 100%)' },
]

const activeColor = ref(colors[0].value)

const derivedProps = ['--accent-dark', '--accent-light', '--accent-super-light', '--accent-nav-active', '--accent-small-planet'] as const

function applyAccent(color: string) {
  const root = document.documentElement.style
  root.setProperty('--accent', color)

  const isBlack = color === 'hwb(0 0% 100%)'
  if (isBlack) {
    // Override derived colors with achromatic greys (W+B=100% keeps hue invisible)
    root.setProperty('--accent-dark', 'hwb(0 20% 80%)')
    root.setProperty('--accent-light', 'hwb(0 40% 60%)')
    root.setProperty('--accent-super-light', 'hwb(0 84% 16%)')
    root.setProperty('--accent-nav-active', 'hwb(0 30% 70%)')
    root.setProperty('--accent-small-planet', 'hwb(0 50% 50%)')
  } else {
    // Clear overrides so CSS relative color derivation takes over
    for (const prop of derivedProps) root.removeProperty(prop)
  }
}

function setAccent(color: string) {
  activeColor.value = color
  applyAccent(color)
  localStorage.setItem('accent-color', color)
}

onMounted(() => {
  const saved = localStorage.getItem('accent-color')
  if (saved) {
    activeColor.value = saved
    applyAccent(saved)
  }
})
</script>

<template>
  <div class="hidden md:flex fixed right-4 lg:right-auto lg:left-4 top-1/2 -translate-y-1/2 z-50 flex-col items-center gap-4">
    <div
      class="social-sidebar flex flex-col gap-3 bg-[var(--accent-dark)] rounded-full px-2 py-3 lg:px-3 lg:py-4 relative overflow-hidden"
      @mousemove="onMouseMove"
      @mouseleave="onMouseLeave"
    >
      <div
        class="social-glow"
        :style="{
          left: glowX + 'px',
          top: glowY + 'px',
          opacity: glowVisible ? 'var(--menu-glow-opacity)' : 0,
        }"
      ></div>
      <a href="https://www.youtube.com/@niuage" target="_blank" class="social-icon">
        <Icon name="youtube" />
      </a>
      <a href="https://niuage.artstation.com" target="_blank" class="social-icon">
        <Icon name="artstation" />
      </a>
      <a href="https://twitter.com/niuage" target="_blank" class="social-icon">
        <Icon name="twitter" />
      </a>
      <a href="https://bsky.app/profile/niuage.bsky.social" target="_blank" class="social-icon">
        <Icon name="bluesky" />
      </a>
      <a href="https://linktr.ee/niuage" target="_blank" class="social-icon">
        <Icon name="linktree" />
      </a>
    </div>

    <!-- Color Picker -->
    <div class="flex flex-col gap-2">
      <button
        v-for="color in colors"
        :key="color.name"
        class="color-dot"
        :class="{ active: activeColor === color.value }"
        :style="{ '--dot-color': color.value }"
        @click="setAccent(color.value)"
      ></button>
    </div>
  </div>

  <!-- Mobile floating Linktree button -->
  <a
    href="https://linktr.ee/niuage"
    target="_blank"
    class="md:hidden fixed right-8 bottom-24 z-50 w-14 h-14 rounded-full bg-[var(--accent-dark)] flex items-center justify-center text-white shadow-lg"
  >
    <Icon name="linktree" />
  </a>
</template>

<style scoped>
.social-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  color: rgba(255, 255, 255, 0.5);
  transition: color 0.2s;
  padding: 2px;
}

.social-icon :deep(svg) {
  width: 16px;
  height: 16px;
}

.social-icon:hover {
  color: white;
}

@media (min-width: 1024px) {
  .social-icon {
    padding: 4px;
  }
  .social-icon :deep(svg) {
    width: 20px;
    height: 20px;
  }
}

.social-glow {
  position: absolute;
  transform: translate(-50%, -50%);
  width: 80px;
  height: 80px;
  border-radius: 9999px;
  background: var(--accent-super-light);
  filter: blur(30px);
  pointer-events: none;
  transition: opacity var(--glow-fade-duration);
}

.social-sidebar {
  box-shadow: 0 0 40px 10px color-mix(in srgb, var(--accent-super-light) 20%, transparent);
  transition: box-shadow var(--glow-fade-duration);
}

.social-sidebar:hover {
  box-shadow: 0 0 40px 10px transparent;
}

.color-dot {
  width: 12px;
  height: 12px;
  border-radius: 50%;
  background: var(--dot-color);
  border: 2px solid transparent;
  cursor: pointer;
  transition: transform 0.2s, border-color 0.2s;
}

.color-dot:hover {
  transform: scale(1.3);
}

.color-dot.active {
  border-color: var(--dot-color);
  box-shadow: 0 0 0 2px var(--bg);
}
</style>
