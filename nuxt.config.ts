import svgLoader from 'vite-svg-loader'

// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  vite: {
    plugins: [
      svgLoader({
        defaultImport: 'component',
        svgoConfig: {
          plugins: [
            {
              name: 'preset-default',
              params: {
                overrides: {
                  removeViewBox: false,
                },
              },
            },
            {
              name: 'convertColors',
              params: {
                currentColor: true,
              },
            },
          ],
        },
      }),
    ],
  },
  modules: [
    '@nuxt/content',
    '@nuxtjs/tailwindcss',
  ],
  devtools: { enabled: true },
  compatibilityDate: '2024-04-03',
  ssr: false,
  target: 'static',
  app: {
    baseURL: '/portfolio/',
    head: {
      link: [
        { rel: 'preconnect', href: 'https://fonts.googleapis.com' },
        { rel: 'preconnect', href: 'https://fonts.gstatic.com', crossorigin: '' },
        { rel: 'stylesheet', href: 'https://fonts.googleapis.com/css2?family=Fredoka:wght@300..700&display=swap' },
      ],
    },
  },
  tailwindcss: {
    config: {
      theme: {
        extend: {
          fontFamily: {
            sans: ['Fredoka', 'sans-serif'],
          },
        },
      },
    },
  },
})
