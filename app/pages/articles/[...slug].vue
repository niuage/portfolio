<script setup lang="ts">
const route = useRoute()

const slug = (route.params.slug as string[]).join('/')
const path = `/articles/${slug}`

const { data: article } = await useAsyncData(`article-${slug}`, () =>
  queryCollection('articles').path(path).first()
)

if (!article.value) {
  throw createError({ statusCode: 404, statusMessage: 'Article not found' })
}
</script>

<template>
  <div v-if="article">
    <div class="mb-12">
      <div class="flex items-center gap-2 mb-4">
        <NuxtLink to="/notebook" class="text-[var(--text-muted)] hover:text-[var(--text)] transition-colors text-lg">Notebook</NuxtLink>
      </div>
      <h1 class="text-5xl font-medium mb-2">{{ article.title }}</h1>
      <p class="text-sm">{{ article.date }}</p>
    </div>

    <div v-if="article.body" class="article-content">
      <ContentRenderer :value="article" />
    </div>
  </div>
</template>

<style scoped>
.article-content :deep(p) {
  margin-bottom: 1rem;
}
</style>
