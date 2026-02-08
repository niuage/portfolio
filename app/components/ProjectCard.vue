<script setup lang="ts">
defineProps<{
  project: {
    icon: string
    thumbnail: string
    title: string
    date: string
    description: string
  }
}>()
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
        <img
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
