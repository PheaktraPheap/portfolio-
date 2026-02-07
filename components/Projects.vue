<template>
  <section id="projects" class="py-20 bg-gray-50 dark:bg-gray-950">
    <div class="container mx-auto px-6">
      <!-- Section Header -->
      <div class="text-center max-w-3xl mx-auto mb-12">
        <h2 class="text-3xl md:text-4xl font-bold text-gray-900 dark:text-white">
          Featured Projects
        </h2>
        <p class="mt-4 text-lg text-gray-600 dark:text-gray-400">
          A selection of my recent projects showcasing API development and full-stack solutions
        </p>
      </div>

      <!-- Animated Grid -->
      <div class="grid gap-8 md:grid-cols-2 lg:grid-cols-3">
        <div
          v-for="(project, index) in projects"
          :key="project.id"
          ref="projectCards"
          :class="[
            'bg-white dark:bg-gray-800 rounded-xl border border-gray-200 dark:border-gray-700 overflow-hidden shadow-sm transform transition-all duration-700',
            projectVisible[index] ? 'opacity-100 translate-y-0 scale-100' : 'opacity-0 translate-y-12 scale-95'
          ]"
          :style="projectVisible[index] ? `transition-delay: ${index*0.1}s` : ''"
        >
          <div class="p-6">
            <h3 class="text-xl font-semibold text-gray-900 dark:text-white mb-2">
              {{ project.title }}
            </h3>
            <p class="text-gray-600 dark:text-gray-300 mb-4 text-sm leading-relaxed">
              {{ project.description }}
            </p>
            <div class="flex flex-wrap gap-2">
              <span
                v-for="tech in project.technologies"
                :key="tech"
                class="px-3 py-1 bg-gray-100 dark:bg-gray-700 text-gray-700 dark:text-gray-300 text-xs font-medium rounded-full border border-gray-200 dark:border-gray-600"
              >
                {{ tech }}
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'

const projects = [
  { id: 1, title: 'Pisen Dealer App API', description: 'Complete RESTful API for e-commerce with user authentication, product management, and payment integration.', technologies: ['Laravel', 'MySQL', 'Nuxt 2', 'JWT'] },
  { id: 2, title: 'ERA App API', description: 'School management system with real-time notifications, attendance tracking, and reporting features.', technologies: ['Laravel','MySQL', 'Nuxt 3', 'JWT'] },
  { id: 3, title: 'Fashion App API', description: 'Product Clothing e-commerce API with advanced search, filtering, and order processing capabilities.', technologies: ['Laravel','MySQL', 'Nuxt 2', 'JWT'] },
  { id: 4, title: 'AALL App API', description: 'Product Clothing e-commerce API with advanced search, filtering, and order processing capabilities.', technologies: ['Laravel','MySQL', 'Nuxt 4', 'Firebase Auth'] },
]

const projectCards = ref<HTMLElement[]>([])
const projectVisible = ref<boolean[]>(projects.map(() => false))

onMounted(() => {
  if (!projectCards.value.length) return

  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach(entry => {
        const index = projectCards.value.indexOf(entry.target as HTMLElement)
        if (entry.isIntersecting && index !== -1) {
          projectVisible.value[index] = true
        }
      })
    },
    { threshold: 0.2 }
  )

  projectCards.value.forEach(card => observer.observe(card))
})
</script>

<style scoped>
/* Optional easing for smoother animation */
.transition-all {
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
}
</style>