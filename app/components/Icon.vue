<template>
  <component :is="icons[name]" class="w-6 h-6" />
</template>

<script setup lang="ts">
import IconHome from '~/assets/icons/icon_home.svg'
import IconWork from '~/assets/icons/icon_work.svg'
import IconNotebook from '~/assets/icons/icon_notebook.svg'
import IconAbout from '~/assets/icons/icon_about.svg'
import IconGames from '~/assets/icons/icon_games.svg'
import IconWeb from '~/assets/icons/icon_web.svg'
import IconIllustration from '~/assets/icons/icon_illustration.svg'
import Icon3d from '~/assets/icons/icon_3d.svg'

defineProps<{ name: string }>()

const icons: Record<string, any> = {
  home: IconHome,
  work: IconWork,
  notebook: IconNotebook,
  about: IconAbout,
  games: IconGames,
  web: IconWeb,
  illustration: IconIllustration,
  '3d': Icon3d,
}
</script>
