import { defineConfig } from 'tsdown';

export default defineConfig({
  target: 'node22',
  sourcemap: true,
  tsconfig: 'tsconfig.build.json',
  deps: {
    skipNodeModulesBundle: true,
  },
});
