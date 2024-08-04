#!/bin/bash

npm init -y
npm install -D typescript @types/node

cat <<EOF > tsconfig.json
{
  "compilerOptions": {
    "target": "es2021",
    "module": "commonjs",
    "rootDir": "./src",
    "moduleResolution": "node",
    "resolveJsonModule": true,
    "sourceMap": true,
    "outDir": "./dist",
    "forceConsistentCasingInFileNames": true,
    "strict": true,
    "noImplicitReturns": true,
    "noFallthroughCasesInSwitch": true,
    "noUncheckedIndexedAccess": true,
    "noPropertyAccessFromIndexSignature": true
  },
  "include": ["src/**/*"]
}
EOF

npm i -D \
    @typescript-eslint/eslint-plugin \
    @typescript-eslint/parser \
    eslint \
    eslint-config-prettier \
    prettier
cat <<EOF > .eslintrc.json
{
    "extends": [
        "eslint:recommended",
        "plugin:@typescript-eslint/recommended",
        "prettier"
    ],
    "parser": "@typescript-eslint/parser",
    "parserOptions": {
        "project": "./tsconfig.json"
    },
    "plugins": [
        "@typescript-eslint"
    ],
    "rules": {
    }
}
EOF
cat <<EOF > .editorconfig
root = true

# base settings
[*]
indent_style = space
indent_size = 4
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true

# by extensions
[*.sh]
end_of_line = lf
[*.md]
trim_trailing_whitespace = false
indent_size = 4
[*.json]
insert_final_newline = false
[*.{yml,yaml}]
indent_size = 4
[Makefile]
indent_size = 4
indent_style = tab
EOF

