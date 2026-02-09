<script setup lang="ts">
const { data: about } = await useAsyncData('about', () =>
  queryCollection('content').path('/about').first()
)
</script>

<template>
  <div>
    <div class="grid grid-cols-1 md:grid-cols-2 gap-12">
      <!-- Content -->
      <div>
        <h1 class="text-4xl font-medium mb-12">About</h1>

        <div v-if="about" class="about-content">
          <ContentRenderer :value="about" />
        </div>

        <h1 class="text-4xl font-medium my-12">Contact</h1>
        <p class="mb-4">Feel free to reach out via <a href="mailto:niuage+portfolio@gmail.com">email</a> or on social media!</p>
      </div>

      <!-- Avatar -->
      <div class="flex items-start justify-center">
        <img src="~/assets/avatar.png" alt="Avatar" class="rounded-3xl w-full max-w-md object-cover" />
      </div>
    </div>
  </div>
</template>

<style scoped>
.about-content :deep(p) {
  margin-bottom: 1rem;
}
</style>
