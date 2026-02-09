<script setup lang="ts">
const projects = await useProjects()
</script>

<template>
  <div>
    <h1 class="text-4xl font-medium mb-12">Work</h1>

    <div class="space-y-20">
      <ProjectCard
        v-for="project in projects"
        :key="project.id"
        :project="project"
      />
    </div>
  </div>
</template>
