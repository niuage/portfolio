<script setup lang="ts">
// Fetch all projects, sorted by date (newest first)
const { data: projects } = await useAsyncData('projects', () =>
  queryCollection('content')
    .path('/projects')
    .where('_path', '!=', '/projects')  // Exclude the index page itself
    .sort({ date: -1 })
    .all()
)
</script>

<template>
  <div class="container mx-auto px-4 py-12">
    <h1 class="text-4xl font-bold mb-8">Projects</h1>

    <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
      <NuxtLink
        v-for="project in projects"
        :key="project._path"
        :to="project._path"
        class="group border rounded-lg p-6 hover:shadow-lg transition-shadow"
      >
        <!-- Project Image (if you add images later) -->
        <div v-if="project.image" class="mb-4 aspect-video bg-gray-200 rounded overflow-hidden">
          <img :src="project.image" :alt="project.title" class="w-full h-full object-cover">
        </div>

        <!-- Project Title & Description -->
        <h2 class="text-2xl font-semibold mb-2 group-hover:text-blue-600 transition-colors">
          {{ project.title }}
        </h2>
        <p class="text-gray-600 mb-4">{{ project.description }}</p>

        <!-- Tech Stack -->
        <div class="flex flex-wrap gap-2 mb-4">
          <span
            v-for="tech in project.tech"
            :key="tech"
            class="text-sm bg-gray-100 px-2 py-1 rounded"
          >
            {{ tech }}
          </span>
        </div>

        <!-- Date -->
        <div class="text-sm text-gray-500">
          {{ new Date(project.date).toLocaleDateString('en-US', { month: 'long', year: 'numeric' }) }}
        </div>
      </NuxtLink>
    </div>

    <!-- Empty State -->
    <div v-if="!projects || projects.length === 0" class="text-center py-12">
      <p class="text-gray-500">No projects yet. Add some in the <code>content/projects/</code> directory!</p>
    </div>
  </div>
</template>
