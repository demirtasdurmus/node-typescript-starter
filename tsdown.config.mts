import { defineConfig } from 'tsdown';

export default defineConfig({
  outDir: 'dist-bundle',
  target: 'node24',
  sourcemap: true,
  deps: {
    skipNodeModulesBundle: true,
  },
});
