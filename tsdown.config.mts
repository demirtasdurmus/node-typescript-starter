import { defineConfig } from 'tsdown';

export default defineConfig({
  target: 'node24',
  sourcemap: true,
  tsconfig: 'tsconfig.build.json',
  deps: {
    skipNodeModulesBundle: true,
  },
});
