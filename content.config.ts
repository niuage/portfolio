import { defineContentConfig, defineCollection, z } from '@nuxt/content'

export default defineContentConfig({
  collections: {
    content: defineCollection({
      type: 'page',
      source: {
        include: '**',
        exclude: ['projects/**', 'articles/**'],
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
        video: z.string().optional(),
        icon: z.string(),
      }),
    }),
    articles: defineCollection({
      type: 'page',
      source: 'articles/**',
      schema: z.object({
        date: z.string(),
        description: z.string(),
      }),
    }),
  },
})
