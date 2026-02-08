<script setup lang="ts">
defineProps<{
  project: {
    icon: string
    thumbnail: string
    video?: string
    title: string
    date: string
    description: string
  }
}>()

const videoRef = ref<HTMLVideoElement>()
const videoVisible = ref(false)

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
    <div class="hidden sm:flex flex-shrink-0 w-14 h-14 bg-[var(--accent-dark)] rounded-2xl items-center justify-center text-white">
      <Icon :name="project.icon" />
    </div>

    <!-- Project Card -->
    <div class="flex-1">
      <div class="rounded-3xl overflow-hidden">
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
      </div>

      <div class="mt-6 grid grid-cols-1 md:grid-cols-2 gap-8">
        <div>
          <h2 class="text-[2rem] font-medium mb-1">{{ project.title }}</h2>
          <p class="text-sm">{{ project.date }}</p>
        </div>
        <div>
          <p>{{ project.description }}</p>
        </div>
      </div>
    </div>
  </div>
</template>
