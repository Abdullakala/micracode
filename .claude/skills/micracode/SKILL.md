```markdown
# micracode Development Patterns

> Auto-generated skill from repository analysis

## Overview
This skill teaches you the core development patterns and workflows used in the `micracode` TypeScript codebase. You'll learn the project's coding conventions, how to structure and name files, import/export modules, and manage Docker-based development environments. This guide also covers how to write and organize tests, and provides quick commands for common workflows.

## Coding Conventions

### File Naming
- **PascalCase** is used for file names.
  - Example: `UserService.ts`, `AuthController.ts`

### Import Style
- **Relative imports** are preferred.
  - Example:
    ```typescript
    import { UserService } from './UserService';
    ```

### Export Style
- **Named exports** are used instead of default exports.
  - Example:
    ```typescript
    // UserService.ts
    export function UserService() { /* ... */ }
    ```
    ```typescript
    import { UserService } from './UserService';
    ```

### Commit Messages
- **Conventional commits** are used, with prefixes like `feat` and `fix`.
  - Example:
    ```
    feat: add user authentication middleware
    fix: correct typo in UserService
    ```

## Workflows

### Docker Environment Setup
**Trigger:** When someone wants to set up or modify the Docker environment for building and running the app.  
**Command:** `/setup-docker`

1. **Edit or add `Dockerfile`**  
   Define the runtime image and build steps for the application.
   ```dockerfile
   FROM node:18-alpine
   WORKDIR /app
   COPY package*.json ./
   RUN npm install
   COPY . .
   CMD ["npm", "start"]
   ```
2. **Update or add `.dockerignore`**  
   Exclude files/folders from the Docker build context.
   ```
   node_modules
   dist
   *.log
   ```
3. **Add or update `docker-compose.yml`**  
   Orchestrate multi-container setups or define service configuration.
   ```yaml
   version: '3'
   services:
     app:
       build: .
       ports:
         - "3000:3000"
       env_file:
         - .env.docker.example
   ```
4. **Add or update environment example files**  
   Provide `.env.docker.example` for environment variable documentation.
   ```
   NODE_ENV=development
   PORT=3000
   ```
5. **Update `README.md` with instructions**  
   Document how to build and run the Docker environment.
   ```
   ## Running with Docker

   docker-compose up --build
   ```
6. **Optionally update supporting scripts**  
   For example, `docker/start.sh` to automate container startup.
   ```bash
   #!/bin/sh
   npm run migrate
   npm start
   ```

## Testing Patterns

- **Test files** use the `*.test.*` pattern (e.g., `UserService.test.ts`).
- **Testing framework** is not specified; check test files for framework usage.
- **Test Example:**
  ```typescript
  // UserService.test.ts
  import { UserService } from './UserService';

  describe('UserService', () => {
    it('should create a user', () => {
      // test logic here
    });
  });
  ```

## Commands

| Command        | Purpose                                                    |
|----------------|------------------------------------------------------------|
| /setup-docker  | Set up or update the Docker-based development environment  |
```
