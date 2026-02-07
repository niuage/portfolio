import { defineContentConfig, defineCollection, z } from '@nuxt/content'

export default defineContentConfig({
  collections: {
    content: defineCollection({
      type: 'page',
      source: {
        include: '**',
        exclude: ['projects/**'],
      },
    }),
    projects: defineCollection({
      type: 'page',
      source: 'projects/**',
      schema: z.object({
        date: z.string(),
        category: z.string(),
        description: z.string(),
        thumbnail: z.string(),
        icon: z.string(),
      }),
    }),
  },
})
