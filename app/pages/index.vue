<script setup lang="ts">
const config = useRuntimeConfig()
const baseURL = config.app.baseURL

const projects = [
  {
    id: 1,
    title: '2D Water Simulation',
    date: '12/05/2026',
    description: 'A realistic fluid dynamics system for Unity. Features wave propagation, buoyancy physics, and dynamic reflections. Built with compute shaders for optimal performance in 2D games.',
    thumbnail: `${baseURL}project_1_thumbnail.png`,
    icon: `${baseURL}icon_games.svg`
  },
  {
    id: 2,
    title: 'Personal Logo',
    date: '12/05/2026',
    description: 'Brand identity exploration combining organic forms with modern minimalism. The design reflects themes of nature and technology through simple geometric shapes.',
    thumbnail: `${baseURL}project_2_thumbnail.png`,
    icon: `${baseURL}icon_illustration.svg`
  }
]
</script>

<template>
  <!-- lg:p-3 -->
  <div class="min-h-screen  relative">
    <!-- Planet (centered, outside border) -->
    <div class="absolute left-1/2 -translate-x-1/2 top-0 w-full max-w-[32rem] px-4 z-10">
      <img :src="`${baseURL}planet.png`" alt="Planet" class="w-full object-contain drop-shadow-[0_0_80px_rgba(255,255,255,0.5)]" />
    </div>

    <div class="min-h-screen bg-[#e8e4db] rounded-xl relative overflow-hidden">
    <!-- Fixed Bottom Menu (Desktop) -->
    <div class="hidden lg:flex fixed left-1/2 -translate-x-1/2 bottom-8 flex-row gap-4 bg-black rounded-full px-6 py-3 z-50">
      <button class="w-12 h-12 flex items-center justify-center hover:scale-110 transition-transform">
        <img :src="`${baseURL}icon_games.svg`" alt="Games" class="w-6 h-6" />
      </button>
      <button class="w-12 h-12 flex items-center justify-center hover:scale-110 transition-transform">
        <img :src="`${baseURL}icon_web.svg`" alt="Web" class="w-6 h-6" />
      </button>
      <button class="w-12 h-12 flex items-center justify-center hover:scale-110 transition-transform">
        <img :src="`${baseURL}icon_illustration.svg`" alt="Illustration" class="w-6 h-6" />
      </button>
      <button class="w-12 h-12 flex items-center justify-center hover:scale-110 transition-transform">
        <img :src="`${baseURL}icon_3d.svg`" alt="3D" class="w-6 h-6" />
      </button>
    </div>

    <!-- Mobile Bottom Navigation -->
    <div class="lg:hidden fixed bottom-0 left-0 right-0 bg-black/90 backdrop-blur-sm z-50">
      <div class="flex justify-around items-center px-4 py-3">
        <button class="w-12 h-12 flex items-center justify-center">
          <img :src="`${baseURL}icon_games.svg`" alt="Games" class="w-6 h-6" />
        </button>
        <button class="w-12 h-12 flex items-center justify-center">
          <img :src="`${baseURL}icon_web.svg`" alt="Web" class="w-6 h-6" />
        </button>
        <button class="w-12 h-12 flex items-center justify-center">
          <img :src="`${baseURL}icon_illustration.svg`" alt="Illustration" class="w-6 h-6" />
        </button>
        <button class="w-12 h-12 flex items-center justify-center">
          <img :src="`${baseURL}icon_3d.svg`" alt="3D" class="w-6 h-6" />
        </button>
      </div>
    </div>

    <!-- Main Content -->
    <div class="max-w-6xl mx-auto px-4 lg:px-8">
      <!-- Header with Planet -->
      <header class="relative pt-12 pb-64 flex items-start justify-between">
        <!-- Logo -->
        <div class="relative z-10">
          <img :src="`${baseURL}logo.svg`" alt="nüage" class="h-12" />
        </div>

        <!-- Navigation Icons -->
        <nav class="flex items-center gap-6 relative z-10">
          <button class="hover:scale-110 transition-transform">
            <img :src="`${baseURL}icon_home.svg`" alt="Home" class="w-6 h-6" />
          </button>
          <button class="hover:scale-110 transition-transform">
            <img :src="`${baseURL}icon_work.svg`" alt="Work" class="w-6 h-6" />
          </button>
          <button class="hover:scale-110 transition-transform">
            <img :src="`${baseURL}icon_notebook.svg`" alt="Notebook" class="w-6 h-6" />
          </button>
          <button class="hover:scale-110 transition-transform">
            <img :src="`${baseURL}icon_about.svg`" alt="About" class="w-6 h-6" />
          </button>
        </nav>
      </header>

      <!-- Projects Grid -->
      <div class="space-y-12 pb-24 lg:pb-12">
        <div
          v-for="project in projects"
          :key="project.id"
          class="flex items-start gap-6"
        >
          <!-- Project Icon -->
          <div class="hidden sm:flex flex-shrink-0 w-14 h-14 bg-black rounded-2xl items-center justify-center">
            <img :src="project.icon" :alt="project.title" class="w-7 h-7" />
          </div>

          <!-- Project Card -->
          <div class="flex-1">
            <div class="rounded-3xl overflow-hidden shadow-lg hover:shadow-xl transition-shadow">
              <img
                :src="project.thumbnail"
                :alt="project.title"
                class="w-full h-64 object-cover"
              />
            </div>

            <div class="mt-6 grid grid-cols-2 gap-8">
              <div>
                <h2 class="text-[2rem] font-medium mb-1">{{ project.title }}</h2>
                <p class="text-sm text-gray-600">{{ project.date }}</p>
              </div>
              <div>
                <p class="text-gray-700">{{ project.description }}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
  </div>
</template>
