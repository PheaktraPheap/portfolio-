<template>
  <section
    class="relative min-h-screen flex items-center
           bg-white dark:bg-gray-950"
  >
    <div class="container mx-auto px-6">
      <div class="max-w-5xl">

        <!-- Eyebrow -->
        <p
          class="text-sm uppercase tracking-widest
                 text-gray-500 dark:text-gray-400"
        >
          Portfolio
        </p>

        <!-- Title -->
        <h1
          class="mt-6 text-5xl md:text-7xl
                font-bold leading-tight
                text-gray-900 dark:text-white"
        >
          I’m
          <span class="underline decoration-4 decoration-primary-500">
            Pheap Sopheaktra
          </span>
          <br />
          a
          <span class="text-primary-600 dark:text-primary-400">
            {{ displayedText }}
          </span>
          <span
            class="inline-block ml-1
                  w-[6px] h-[1.2em]
                  bg-primary-500
                  align-middle
                  animate-caret"
          />
        </h1>

        <!-- Description -->
        <p
          class="mt-8 text-xl
                 text-gray-600 dark:text-gray-300
                 max-w-2xl"
        >
          I build reliable and thoughtful web applications using modern
          technologies. I care about clarity, maintainability, and user experience.
        </p>

        <!-- Actions -->
        <div class="mt-12 flex flex-wrap gap-6">
          <NuxtLink
            to="#projects"
            class="inline-flex items-center gap-2
                   text-lg font-medium
                   text-gray-900 dark:text-white
                   border-b-2 border-gray-900 dark:border-white
                   hover:border-primary-500
                   transition"
            @click="handleProjectsClick"
          >
            View Projects →
          </NuxtLink>
        </div>

      </div>
    </div>
  </section>
</template>
<script setup lang="ts">
const words = ['web developer', 'backend developer']
const displayedText = ref('')
const wordIndex = ref(0)
const charIndex = ref(0)
const isDeleting = ref(false)

const typingSpeed = 160      // slower typing
const deletingSpeed = 90     // smoother delete
const pauseAfterTyping = 1800 // longer pause (important)

const type = () => {
  const currentWord = words[wordIndex.value]

  if (!isDeleting.value) {
    // Typing
    displayedText.value = currentWord.slice(0, charIndex.value + 1)
    charIndex.value++

    if (charIndex.value === currentWord.length) {
      setTimeout(() => (isDeleting.value = true), pauseAfterTyping)
    }
  } else {
    // Deleting
    displayedText.value = currentWord.slice(0, charIndex.value - 1)
    charIndex.value--

    if (charIndex.value === 0) {
      isDeleting.value = false
      wordIndex.value = (wordIndex.value + 1) % words.length
    }
  }

  setTimeout(type, isDeleting.value ? deletingSpeed : typingSpeed)
}

onMounted(type)
// Handle Projects click
const handleProjectsClick = (e: Event) => {
  e.preventDefault();
  scrollToProjects();
};

// Scroll functions
const scrollToProjects = () => {
  if (process.client) {
    const projectsSection = document.getElementById('projects');
    if (projectsSection) {
      projectsSection.scrollIntoView({ 
        behavior: 'smooth',
        block: 'start'
      });
    }
  }
};

const scrollToContact = () => {
  if (process.client) {
    const contactSection = document.getElementById('contact');
    if (contactSection) {
      contactSection.scrollIntoView({ 
        behavior: 'smooth',
        block: 'start'
      });
    }
  }
};
</script>

<style scoped>
@keyframes caret-blink {
  0%, 45% { opacity: 1; }
  50%, 100% { opacity: 0; }
}

.animate-caret {
  animation: caret-blink 1.1s infinite;
}
.clip-triangle {
  clip-path: polygon(0 0, 0% 100%, 100% 0);
}

.clip-triangle-reverse {
  clip-path: polygon(100% 100%, 0% 100%, 100% 0);
}

@keyframes shimmer {
  0% { transform: translateX(-100%); }
  100% { transform: translateX(100%); }
}

.animate-shimmer {
  animation: shimmer 3s ease-in-out infinite;
}
</style>