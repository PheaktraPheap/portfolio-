<template>
  <button
    @click="toggleTheme"
    class="relative w-11 h-11
           rounded-full
           border border-gray-200 dark:border-gray-700
           bg-white/70 dark:bg-gray-900/70
           backdrop-blur
           flex items-center justify-center
           hover:scale-105 active:scale-95
           transition-all duration-300"
    aria-label="Toggle theme"
  >
    <Transition name="fade-scale" mode="out-in">
      <span
        :key="theme"
        class="text-lg"
      >
        {{ theme === 'light' ? '🌙' : '☀️' }}
      </span>
    </Transition>
  </button>
</template>

<script setup lang="ts">
const { theme, toggleTheme } = useTheme()
</script>

<style scoped>
.fade-scale-enter-active,
.fade-scale-leave-active {
  transition: all 0.2s ease;
}
.fade-scale-enter-from,
.fade-scale-leave-to {
  opacity: 0;
  transform: scale(0.7) rotate(-20deg);
}
</style>