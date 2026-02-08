<script setup lang="ts">
const projects = await useProjects()
</script>

<template>
  <!-- Intro -->
  <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mb-20">
    <h1 class="text-4xl font-medium">A place for the things I make.</h1>
    <p class="pt-2">
      I like to create &mdash; crafting game worlds in Unity, bringing 3D models to life, building websites...
      <br />
      Coding ties it all together, but I'm always looking for ways to blend logic with visuals.
    </p>

  </div>

  <!-- Projects Grid -->
  <div class="space-y-20 pb-24 lg:pb-12">
    <ProjectCard
      v-for="project in projects"
      :key="project.id"
      :project="project"
    />
  </div>
</template>
