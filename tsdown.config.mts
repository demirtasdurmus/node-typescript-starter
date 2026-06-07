import { defineConfig } from 'tsdown';

export default defineConfig({
  target: 'node24',
  sourcemap: true,
  deps: {
    skipNodeModulesBundle: true,
  },
});
