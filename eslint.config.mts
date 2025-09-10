import globals from 'globals';
import tseslint from 'typescript-eslint';
import { defineConfig } from 'eslint/config';

/**
 * @see https://eslint.org/docs/latest/use/getting-started
 * @see https://eslint.org/docs/latest/use/configure/configuration-files#typescript-configuration-files
 */
export default defineConfig([
  {
    files: ['**/*.{js,mjs,cjs,ts,mts,cts}'],
    languageOptions: { globals: { ...globals.node, ...globals.jest } },
  },
  tseslint.configs.recommended,
  {
    rules: {
      '@typescript-eslint/no-unused-vars': [
        'error',
        {
          argsIgnorePattern: '^_',
          varsIgnorePattern: '^_',
          caughtErrorsIgnorePattern: '^_',
        },
      ],
    },
  },
  {
    ignores: ['node_modules/*', 'dist/*', 'package-lock.json', 'coverage/*', 'coverage-int/*'],
  },
]);
