set -eo pipefail

LIB_PATH=$(realpath .)
EXAMPLE_APP_PATH=$(realpath ./exampleApp)
TEMPLATES_DIR=$(realpath .circleci/templates)

cd exampleApp
yarn nest new test-project \
  --package-manager yarn \
  --skip-git

cd test-project
yarn add pg typeorm @nestjs/cli @nestjs/typeorm @nestjs/platform-express "$LIB_PATH"

yarn nest generate module user

cp "$TEMPLATES_DIR/user.entity.ts" ./src/user/user.entity.ts
cp "$TEMPLATES_DIR/user.module.ts" ./src/user/user.module.ts
cp "$TEMPLATES_DIR/app.module.ts" ./src/app.module.ts
cp "$TEMPLATES_DIR/main.ts" ./src/main.ts
cp "$EXAMPLE_APP_PATH/.env.test" ./.env
cp "$EXAMPLE_APP_PATH/ormconfig.js" ./ormconfig.js
