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
]

const activeColor = ref(colors[0].value)

function setAccent(color: string) {
  activeColor.value = color
  document.documentElement.style.setProperty('--accent', color)
  localStorage.setItem('accent-color', color)
}

onMounted(() => {
  const saved = localStorage.getItem('accent-color')
  if (saved) {
    activeColor.value = saved
    document.documentElement.style.setProperty('--accent', saved)
  }
})
</script>

<template>
  <div class="hidden md:flex fixed right-4 top-1/2 -translate-y-1/2 z-50 flex-col items-center gap-4">
    <div
      class="social-sidebar flex flex-col gap-3 bg-[var(--accent-dark)] rounded-full px-2 py-3 relative overflow-hidden"
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
  box-shadow: 0 0 40px 10px color-mix(in srgb, var(--accent-super-light) 40%, transparent);
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
