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
import IconTpArtstation from '~/assets/icons/third_party_icons/icon_tp_artstation.svg'
import IconTpTwitter from '~/assets/icons/third_party_icons/icon_tp_twitter.svg'
import IconTpBluesky from '~/assets/icons/third_party_icons/icon_tp_bluesky.svg'
import IconTpYoutube from '~/assets/icons/third_party_icons/icon_tp_youtube.svg'
import IconTpLinktree from '~/assets/icons/third_party_icons/icon_tp_linktree.svg'

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
  artstation: IconTpArtstation,
  twitter: IconTpTwitter,
  bluesky: IconTpBluesky,
  youtube: IconTpYoutube,
  linktree: IconTpLinktree,
}
</script>
