<script setup lang="ts">
const { data: articles } = await useAsyncData('articles', () =>
  queryCollection('articles').order('date', 'DESC').all()
)
</script>

<template>
  <div>
    <h1 class="text-4xl font-medium mb-12">Notebook</h1>

    <div v-if="articles?.length" class="flex flex-col gap-8">
      <NuxtLink
        v-for="article in articles"
        :key="article._id"
        :to="article.path"
        class="block group"
      >
        <p class="text-sm text-[var(--text-faint)] mb-1">{{ article.date }}</p>
        <h2 class="text-2xl font-medium text-[var(--heading)] group-hover:opacity-80 transition-opacity">{{ article.title }}</h2>
        <p class="text-[var(--text-muted)] mt-1">{{ article.description }}</p>
      </NuxtLink>
    </div>

    <p v-else class="text-[var(--text-muted)]">No articles yet.</p>
  </div>
</template>
