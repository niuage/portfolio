<script setup lang="ts">
const { data: about } = await useAsyncData('about', () =>
  queryCollection('content').path('/about').first()
)
</script>

<template>
  <div class="pb-24 lg:pb-12">
    <h1 class="text-4xl font-medium mb-12">About</h1>

    <div v-if="about" class="about-content">
      <ContentRenderer :value="about" />
    </div>
  </div>
</template>

<style scoped>
.about-content :deep(p) {
  margin-bottom: 1rem;
}
</style>
