# Node TypeScript Starter Kit

A modern, production-ready Node.js starter template with TypeScript, comprehensive testing, and development tooling.

## 🚀 Features

- **TypeScript** - Full TypeScript support with strict configuration
- **Node.js** - Modern Node.js with ES2022 features
- **Testing** - Jest with unit test configurations and coverage reporting
- **Code Quality** - ESLint, Prettier, and Husky for code formatting and linting
- **Development** - Hot reload with TypeScript watch mode and source maps
- **Git Hooks** - Pre-commit hooks with lint-staged and commitlint
- **Modern Tooling** - Latest TypeScript, ESLint, and Jest configurations

## 📁 Project Structure

```sh
src/
├── index.ts        # Main entry point
└── index.test.ts   # Unit tests

dist/               # Compiled JavaScript output
coverage/           # Test coverage reports
scripts/            # Build and utility scripts
```

## 🛠️ Getting Started

### Prerequisites

- Node.js (v22 or higher)
- pnpm

### Installation

```bash
# Clone the repository
git clone <your-repo-url>
cd node-ts-starter

# Install dependencies
pnpm install

# Start the development server
pnpm dev
```

## 📜 Available Scripts

| Script               | Description                        |
| -------------------- | ---------------------------------- |
| `pnpm dev`           | Start development with hot reload  |
| `pnpm dev:tsc`       | TypeScript compiler in watch mode  |
| `pnpm dev:node`      | Node.js in watch mode              |
| `pnpm build`         | Build TypeScript to JavaScript     |
| `pnpm start`         | Start production build             |
| `pnpm test`          | Run unit tests                     |
| `pnpm test:watch`    | Run tests in watch mode            |
| `pnpm test:coverage` | Run tests with coverage report     |
| `pnpm type-check`    | Type check without emitting files  |
| `pnpm lint`          | Lint and fix code                  |
| `pnpm format:write`  | Format code with Prettier          |
| `pnpm format:check`  | Check code formatting              |
| `pnpm clean`         | Clean build artifacts              |
| `pnpm commit`        | Interactive commit with commitlint |

## 🧪 Testing

The project includes comprehensive testing setup:

- **Unit Tests**: Test individual functions and modules
- **Coverage Reports**: Track test coverage with detailed reports
- **Watch Mode**: Run tests automatically on file changes

```bash
# Run all tests
pnpm test

# Run tests in watch mode
pnpm test:watch

# Generate coverage report
pnpm test:coverage
```

## 🏗️ Development

### Development Workflow

1. **Hot Reload**: Use `pnpm dev` for automatic TypeScript compilation and Node.js restart
2. **Type Checking**: Run `pnpm type-check` to verify TypeScript without building
3. **Code Quality**: Pre-commit hooks automatically lint and format your code
4. **Testing**: Write tests in `*.test.ts` files alongside your source code

### Example Function

The starter includes a sample function `sumTotal` in `src/index.ts` with its corresponding test in `src/index.test.ts`.

## 🔧 Configuration

- **TypeScript**: Configured in `tsconfig.json` with strict settings and ES2022 target
- **ESLint**: Modern ESLint configuration in `eslint.config.mts` with TypeScript support
- **Prettier**: Code formatting in `.prettierrc`
- **Jest**: Testing configuration in `jest.config.ts` with ts-jest preset
- **Husky**: Git hooks for pre-commit linting and formatting
- **Commitlint**: Conventional commit message validation

## 📦 Dependencies

### Production

- No external dependencies - pure Node.js with TypeScript

### Development

- `typescript` - TypeScript compiler with latest features
- `jest` - Testing framework with ts-jest integration
- `eslint` - Modern ESLint with TypeScript support
- `prettier` - Code formatting
- `husky` - Git hooks for code quality
- `commitlint` - Conventional commit message validation
- `lint-staged` - Run linters on staged files
- `supertest` - HTTP testing utilities (for future API development)

## 🚀 Deployment

1. Build the project: `pnpm build`
2. Start the application: `pnpm start`
3. The compiled JavaScript will be available in the `dist/` directory

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.
