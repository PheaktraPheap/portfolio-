<template>
  <section
    id="about"
    class="relative py-24 bg-gray-50 dark:bg-gray-950"
  >
    <div class="container mx-auto px-6">

      <!-- Section Header -->
      <div class="max-w-3xl mx-auto text-center mb-16">
        <h2 class="text-3xl md:text-4xl font-bold text-gray-900 dark:text-white">
          About Me
        </h2>
        <p class="mt-4 text-lg text-gray-600 dark:text-gray-400">
          Backend-focused developer building scalable APIs and modern web applications.
        </p>
      </div>

      <!-- Main Content -->
      <div class="grid md:grid-cols-2 gap-12 max-w-5xl mx-auto">
        <!-- Left: Description Card -->
        <div
          ref="leftCard"
          :class="['bg-white dark:bg-gray-900 p-8 rounded-2xl shadow-md border border-gray-200 dark:border-gray-800 transition-transform transition-opacity duration-700', leftVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-12']"
        >
          <h3 class="text-xl font-semibold text-gray-900 dark:text-white mb-4">
            Backend & API Development
          </h3>
          <p class="text-gray-600 dark:text-gray-300 leading-relaxed mb-4">
            I primarily work with <strong>Laravel</strong> to build clean, secure, and scalable APIs. I focus on architecture, database design, and performance.
          </p>
          <p class="text-gray-600 dark:text-gray-300 leading-relaxed mb-4">
            On the frontend, I use <strong>Nuxt</strong> to create modern interfaces that interact efficiently with backend services.
          </p>
          <p class="text-gray-600 dark:text-gray-300 leading-relaxed">
            I also integrate <strong>Firebase</strong> for authentication, real-time features, and notifications, alongside <strong>MySQL</strong> for structured data.
          </p>
        </div>

        <!-- Right: Skills & Tech Stack Card -->
        <div
          ref="rightCard"
          :class="[
            'bg-white dark:bg-gray-900 p-8 rounded-2xl shadow-md border border-gray-200 dark:border-gray-800 transition-transform transition-opacity duration-700 delay-150',
            rightVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-12'
          ]"
        >
          <h3 class="text-xl font-semibold text-gray-900 dark:text-white mb-6">
            Technical Focus
          </h3>

          <!-- Skills List -->
          <ul class="space-y-4">
            <li class="flex items-start gap-3">
              <span class="mt-1 flex-shrink-0 w-3 h-3 rounded-full bg-primary-500"></span>
              <p class="text-gray-600 dark:text-gray-300">RESTful API design, authentication, and authorization</p>
            </li>
            <li class="flex items-start gap-3">
              <span class="mt-1 flex-shrink-0 w-3 h-3 rounded-full bg-primary-500"></span>
              <p class="text-gray-600 dark:text-gray-300">Database modeling and optimization (MySQL)</p>
            </li>
            <li class="flex items-start gap-3">
              <span class="mt-1 flex-shrink-0 w-3 h-3 rounded-full bg-primary-500"></span>
              <p class="text-gray-600 dark:text-gray-300">API documentation, testing, and maintainability</p>
            </li>
            <li class="flex items-start gap-3">
              <span class="mt-1 flex-shrink-0 w-3 h-3 rounded-full bg-primary-500"></span>
              <p class="text-gray-600 dark:text-gray-300">Frontend integration with Nuxt & JavaScript</p>
            </li>
          </ul>

          <!-- Tech Stack Pills -->
          <div class="mt-8 flex flex-wrap gap-3">
            <span
              v-for="(tech, index) in ['Laravel','MySQL','Nuxt','Firebase','REST API']"
              :key="tech"
              class="px-4 py-2 text-sm rounded-full bg-primary-50 dark:bg-primary-900 text-primary-700 dark:text-primary-300 font-medium transform scale-75 opacity-0"
              :style="rightVisible ? `transition: transform 0.5s ease ${index*0.1}s, opacity 0.5s ease ${index*0.1}s; transform: scale(1); opacity: 1;` : ''"
            >
              {{ tech }}
            </span>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'

const leftCard = ref<HTMLElement | null>(null)
const rightCard = ref<HTMLElement | null>(null)

const leftVisible = ref(false)
const rightVisible = ref(false)

onMounted(() => {
  const observerOptions = {
    threshold: 0.2
  }

  const leftObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) leftVisible.value = true
    })
  }, observerOptions)

  const rightObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) rightVisible.value = true
    })
  }, observerOptions)

  if (leftCard.value) leftObserver.observe(leftCard.value)
  if (rightCard.value) rightObserver.observe(rightCard.value)
})
</script>

<style scoped>
/* Optional: smooth transition easing */
.transition-transform {
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
}
</style>