<script setup lang="ts">
defineProps<{
  project: {
    icon: string
    path: string
    thumbnail: string
    video?: string
    title: string
    date: string
    description: string
    category: string
  }
}>()

const videoRef = ref<HTMLVideoElement>()
const videoVisible = ref(false)

const glowX = ref(0)
const glowY = ref(0)
const glowVisible = ref(false)

function onIconMouseMove(e: MouseEvent) {
  const el = e.currentTarget as HTMLElement
  const rect = el.getBoundingClientRect()
  glowX.value = e.clientX - rect.left
  glowY.value = e.clientY - rect.top
  glowVisible.value = true
}

function onIconMouseLeave() {
  glowVisible.value = false
}

onMounted(() => {
  if (!videoRef.value) return
  const observer = new IntersectionObserver(
    ([entry]) => {
      if (entry.isIntersecting) {
        videoVisible.value = true
        observer.disconnect()
      }
    },
    { rootMargin: '200px' }
  )
  observer.observe(videoRef.value)
})
</script>

<template>
  <div class="flex items-start gap-6">
    <!-- Project Icon -->
    <NuxtLink
      :to="`/work/${project.category}`"
      class="hidden sm:flex flex-shrink-0 w-14 h-14 bg-[var(--accent-dark)] rounded-2xl items-center justify-center text-white relative overflow-hidden"
      @mousemove="onIconMouseMove"
      @mouseleave="onIconMouseLeave"
    >
      <div
        class="icon-glow"
        :style="{
          left: glowX + 'px',
          top: glowY + 'px',
          opacity: glowVisible ? 'var(--menu-glow-opacity)' : 0,
        }"
      ></div>
      <Icon :name="project.icon" class="relative z-10" />
    </NuxtLink>

    <!-- Project Card -->
    <div class="flex-1">
      <NuxtLink :to="project.path" class="block rounded-3xl overflow-hidden">
        <video
          v-if="project.video"
          ref="videoRef"
          :src="videoVisible ? project.video : undefined"
          :poster="project.thumbnail"
          autoplay
          loop
          muted
          playsinline
          class="w-full h-64 object-cover"
        />
        <img
          v-else
          :src="project.thumbnail"
          :alt="project.title"
          class="w-full h-64 object-cover"
        />
      </NuxtLink>

      <div class="mt-6 grid grid-cols-1 md:grid-cols-2 gap-8">
        <div>
          <NuxtLink :to="project.path" class="hover:opacity-80 transition-opacity">
            <h2 class="text-[2rem] font-medium mb-1">{{ project.title }}</h2>
          </NuxtLink>
          <p class="text-sm">{{ project.date }}</p>
        </div>
        <div>
          <p>{{ project.description }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.icon-glow {
  position: absolute;
  transform: translate(-50%, -50%);
  width: 80px;
  height: 80px;
  border-radius: 9999px;
  background: var(--accent-super-light);
  filter: blur(20px);
  pointer-events: none;
  transition: opacity var(--glow-fade-duration);
}
</style>
