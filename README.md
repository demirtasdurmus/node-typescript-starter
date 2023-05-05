-   Enabling nodemon to watch for changes in typescript files and restart the server

nodemon --watch "\*.ts" --exec "ts-node" ./src/index.ts

-   Example eslint config file

```
module.exports = {
  parser: '@typescript-eslint/parser',
  extends: ['plugin:@typescript-eslint/recommended', 'prettier/@typescript-eslint', 'plugin:prettier/recommended'],
  parserOptions: {
    ecmaVersion: 2020,
    sourceType: 'module',
  },
  env: {
    es6: true,
    node: true,
  },
  rules: {
    'no-var': 'error',
    semi: 'error',
    indent: ['error', 2, { SwitchCase: 1 }],
    'no-multi-spaces': 'error',
    'space-in-parens': 'error',
    'no-multiple-empty-lines': 'error',
    'prefer-const': 'error',
  },
};
```

-   Example Scripts for package.json

```
	"scripts": {
		"cleanup": "rimraf dist",
		"build": "tsc --pretty",
		"start": "node dist/server.js",
		"dev": "nodemon -w 'src/**/*.ts' -x ts-node --files -H -T server.ts",
		"format": "prettier ./src/**/*.{ts,spec.ts,test.ts} --write",
		"lint": "eslint ./src/**/*.{ts,spec.ts,test.ts} --fix",
		"lintfix": "npm run format && npm run lint",
		"test": "jest",
		"test:watch": "jest --watchAll"
	},
```
