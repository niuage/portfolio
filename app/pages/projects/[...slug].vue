<script setup lang="ts">
const route = useRoute()
const config = useRuntimeConfig()
const baseURL = config.app.baseURL

const slug = (route.params.slug as string[]).join('/')
const path = `/projects/${slug}`

const { data: project } = await useAsyncData(`project-${slug}`, () =>
  queryCollection('projects').path(path).first()
)

if (!project.value) {
  throw createError({ statusCode: 404, statusMessage: 'Project not found' })
}

const categoryLabels: Record<string, string> = {
  games: 'Games',
  web: 'Web',
  illustration: 'Illustration',
  '3d': '3D',
}

const categoryLabel = computed(() => {
  if (!project.value) return ''
  return categoryLabels[project.value.category] ?? project.value.category
})

const thumbnail = computed(() => project.value ? `${baseURL}${project.value.thumbnail}` : '')
const video = computed(() => project.value?.video ? `${baseURL}${project.value.video}` : undefined)
</script>

<template>
  <div v-if="project" class="pb-24 lg:pb-12">
    <div class="mb-12">
      <div class="flex items-center gap-2 mb-4">
        <NuxtLink to="/work" class="text-[var(--text-muted)] hover:text-[var(--text)] transition-colors text-lg">Work</NuxtLink>
        <span class="text-[var(--text-separator)] text-lg">/</span>
        <NuxtLink :to="`/work/${project.category}`" class="text-[var(--text-muted)] hover:text-[var(--text)] transition-colors text-lg">{{ categoryLabel }}</NuxtLink>
      </div>
      <h1 class="text-5xl font-medium mb-2">{{ project.title }}</h1>
      <p class="text-sm">{{ project.date }}</p>
    </div>

    <div class="rounded-3xl overflow-hidden mb-12">
      <video
        v-if="video"
        :src="video"
        :poster="thumbnail"
        autoplay
        loop
        muted
        playsinline
        class="w-full object-cover"
      />
      <img
        v-else
        :src="thumbnail"
        :alt="project.title"
        class="w-full object-cover"
      />
    </div>

    <p class="mb-8">{{ project.description }}</p>

    <div v-if="project.body" class="project-content">
      <ContentRenderer :value="project" />
    </div>
  </div>
</template>

<style scoped>
.project-content :deep(p) {
  margin-bottom: 1rem;
}
</style>
