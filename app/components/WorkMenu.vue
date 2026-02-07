<script setup lang="ts">
const route = useRoute()

const menuRef = ref<HTMLElement | null>(null)
const glowX = ref(0)
const glowY = ref(0)
const glowVisible = ref(false)

function onMouseMove(e: MouseEvent) {
  if (!menuRef.value) return
  const rect = menuRef.value.getBoundingClientRect()
  glowX.value = e.clientX - rect.left
  glowY.value = e.clientY - rect.top
  glowVisible.value = true
}

function onMouseLeave() {
  glowVisible.value = false
}
</script>

<template>
  <!-- Fixed Bottom Menu (Desktop) -->
  <div
    ref="menuRef"
    class="hidden lg:flex fixed left-1/2 -translate-x-1/2 bottom-8 flex-row gap-4 bg-[var(--accent-dark)] rounded-full px-4 py-1 z-50 overflow-hidden"
    @mousemove="onMouseMove"
    @mouseleave="onMouseLeave"
  >
    <div
      class="menu-glow"
      :style="{
        left: glowX + 'px',
        top: glowY + 'px',
        opacity: glowVisible ? 'var(--menu-glow-opacity)' : 0,
      }"
    ></div>
    <NuxtLink to="/work" class="menu-icon" :class="{ 'menu-icon-active': route.path === '/work' }">
      <Icon name="work" class="!w-5 !h-5" />
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
</template>

<style scoped>
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
</style>
