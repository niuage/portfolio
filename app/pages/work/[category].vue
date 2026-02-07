<script setup lang="ts">
const config = useRuntimeConfig()
const baseURL = config.app.baseURL
const route = useRoute()

const category = route.params.category as string

const categoryLabels: Record<string, string> = {
  games: 'Games',
  web: 'Web',
  illustration: 'Illustration',
  '3d': '3D'
}

const allProjects = [
  {
    id: 1,
    title: '2D Water Simulation',
    date: '12/05/2026',
    category: 'games',
    description: 'A realistic fluid dynamics system for Unity. Features wave propagation, buoyancy physics, and dynamic reflections. Built with compute shaders for optimal performance in 2D games.',
    thumbnail: `${baseURL}project_1_thumbnail.png`,
    icon: `${baseURL}icon_games.svg`
  },
  {
    id: 2,
    title: 'Personal Logo',
    date: '12/05/2026',
    category: 'illustration',
    description: 'Brand identity exploration combining organic forms with modern minimalism. The design reflects themes of nature and technology through simple geometric shapes.',
    thumbnail: `${baseURL}project_2_thumbnail.png`,
    icon: `${baseURL}icon_illustration.svg`
  }
]

const projects = allProjects.filter(p => p.category === category)
const label = categoryLabels[category] ?? category
</script>

<template>
  <div class="pb-24 lg:pb-12">
    <div class="flex items-center gap-4 mb-12">
      <NuxtLink to="/work" class="text-gray-500 hover:text-black transition-colors text-4xl font-medium">Work</NuxtLink>
      <span class="text-gray-400 text-4xl font-light">/</span>
      <h1 class="text-4xl font-medium">{{ label }}</h1>
    </div>

    <div v-if="projects.length" class="space-y-20">
      <div
        v-for="project in projects"
        :key="project.id"
        class="flex items-start gap-6"
      >
        <!-- Project Icon -->
        <div class="hidden sm:flex flex-shrink-0 w-14 h-14 bg-[var(--accent-dark)] rounded-2xl items-center justify-center">
          <img :src="project.icon" :alt="project.title" class="w-7 h-7" />
        </div>

        <!-- Project Card -->
        <div class="flex-1">
          <div class="rounded-3xl overflow-hidden">
            <img
              :src="project.thumbnail"
              :alt="project.title"
              class="w-full h-64 object-cover"
            />
          </div>

          <div class="mt-6 grid grid-cols-2 gap-8">
            <div>
              <h2 class="text-[2rem] font-medium mb-1">{{ project.title }}</h2>
              <p class="text-sm text-gray-600">{{ project.date }}</p>
            </div>
            <div>
              <p class="text-gray-700">{{ project.description }}</p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <p v-else class="text-gray-600">No projects in this category yet.</p>
  </div>
</template>
