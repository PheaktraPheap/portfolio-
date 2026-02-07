export function useTheme() {
  const colorMode = useColorMode()

  const toggleTheme = () => {
    colorMode.preference =
      colorMode.preference === 'dark' ? 'light' : 'dark'
  }

  return {
    theme: computed(() => colorMode.value),
    toggleTheme
  }
}