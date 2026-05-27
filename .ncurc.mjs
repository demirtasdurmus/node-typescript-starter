/** @type {import('npm-check-updates').RcOptions } */
export default {
  upgrade: true,
  target: 'minor',
  packageManager: 'pnpm',
  packageFile: 'package.json',
  reject: ['pnpm'],
};
