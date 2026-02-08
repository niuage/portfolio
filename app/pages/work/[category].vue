<script setup lang="ts">
const route = useRoute()
const category = route.params.category as string

const categoryLabels: Record<string, string> = {
  games: 'Games',
  web: 'Web',
  illustration: 'Illustration',
  '3d': '3D'
}

const projects = await useProjects(category)
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
      <ProjectCard
        v-for="project in projects"
        :key="project.id"
        :project="project"
      />
    </div>

    <p v-else>No projects in this category yet.</p>
  </div>
</template>
