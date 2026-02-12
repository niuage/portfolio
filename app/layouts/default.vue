<script setup lang="ts">
import LogoSvg from '~/assets/icons/logo.svg'

const route = useRoute()

const currentSection = computed(() => {
  if (route.path.startsWith('/work')) return 'work'
  if (route.path.startsWith('/notebook')) return 'notebook'
  if (route.path.startsWith('/about')) return 'about'
  return 'home'
})

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
    <!-- Planet -->
    <Planet :current-section="currentSection" />

    <!-- Social Sidebar -->
    <SocialSidebar />

    <div class="min-h-screen bg-[var(--bg)] relative overflow-hidden">
      <!-- Work Menu (Desktop + Mobile) -->
      <WorkMenu />

      <!-- Main Content -->
      <div class="max-w-6xl mx-auto px-4 md:pr-8 md:pl-4 lg:px-8">
        <!-- Header with Planet -->
        <header class="relative pt-40 md:pt-12 pb-32 md:pb-60 flex flex-col md:flex-row items-center md:items-center gap-6 md:gap-0 md:justify-between">
          <!-- Logo -->
          <NuxtLink to="/" class="relative z-10 text-[var(--accent)]">
            <div class="logo-glow"></div>
            <LogoSvg class="h-12 relative" />
          </NuxtLink>

          <!-- Navigation Icons -->
          <nav
            ref="navRef"
            class="flex items-center gap-10 relative overflow-visible md:p-12 md:-m-12"
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
        <div class="pb-24 lg:pb-24">
          <slot />
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.nav-icon {
  color: var(--text);
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

.logo-glow {
  display: none;
  position: absolute;
  top: -220px;
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
</style>
