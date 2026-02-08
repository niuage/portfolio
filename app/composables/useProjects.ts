export const useProjects = async (category?: string) => {
  const config = useRuntimeConfig()
  const baseURL = config.app.baseURL

  const { data } = await useAsyncData(`projects-${category || 'all'}`, () =>
    queryCollection('projects').all()
  )

  const projects = computed(() => {
    let items = (data.value || []).map((p: any) => ({
      id: p._id,
      title: p.title,
      date: p.date,
      category: p.category,
      description: p.description,
      thumbnail: `${baseURL}${p.thumbnail}`,
      video: p.video ? `${baseURL}${p.video}` : undefined,
      icon: p.icon,
    }))
    if (category) items = items.filter(p => p.category === category)
    return items
  })

  return projects
}
