// eslint.config.mjs — ESLint v9 flat-config starter.
// Voeg eigen project-rules toe of pas globals aan.

const browserGlobals = {
  window: "readonly",
  document: "readonly",
  navigator: "readonly",
  console: "readonly",
  fetch: "readonly",
  setTimeout: "readonly",
  clearTimeout: "readonly",
  setInterval: "readonly",
  clearInterval: "readonly",
  URL: "readonly",
  URLSearchParams: "readonly",
  localStorage: "readonly",
  sessionStorage: "readonly",
  Promise: "readonly",
  Buffer: "readonly",
};

const nodeGlobals = {
  process: "readonly",
  require: "readonly",
  module: "readonly",
  exports: "writable",
  __dirname: "readonly",
  __filename: "readonly",
  global: "readonly",
};

export default [
  {
    files: ["**/*.js"],
    languageOptions: {
      ecmaVersion: 2022,
      sourceType: "module",
      globals: { ...browserGlobals, ...nodeGlobals },
    },
    rules: {
      // Veiligheid (kritiek)
      "no-eval": "error",
      "no-implied-eval": "error",
      "no-new-func": "error",
      "no-script-url": "error",

      // Bug-prevention
      "no-var": "warn",
      eqeqeq: ["warn", "smart"],
      "no-unused-vars": [
        "warn",
        {
          argsIgnorePattern: "^_",
          varsIgnorePattern: "^_",
          caughtErrors: "none",
        },
      ],

      "no-console": "off",
    },
  },
  {
    ignores: ["**/node_modules/**", "**/dist/**", "**/build/**"],
  },
];
