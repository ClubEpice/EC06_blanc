# ── Étape 1 : builder ──────────────────────────────────────
FROM node:20-alpine AS builder
WORKDIR /app
RUN corepack enable
COPY package.json pnpm-lock.yaml ./
# Toutes les deps (devDeps incluses) : lint + tests s'exécutent dans cette image en CI.
RUN pnpm install --frozen-lockfile
COPY src/ ./src/
COPY tests/ ./tests/
COPY eslint.config.js ./

# ── Étape 2 : image finale légère ──────────────────────────
FROM node:20-alpine
WORKDIR /app
# Installer pnpm globalement (lisible par tous les utilisateurs, pas de download au runtime)
RUN npm install -g pnpm@10.29.3
USER node
COPY --from=builder --chown=node:node /app/node_modules ./node_modules
COPY --from=builder --chown=node:node /app/src ./src
COPY --from=builder --chown=node:node /app/tests ./tests
COPY --from=builder --chown=node:node /app/eslint.config.js ./
COPY --chown=node:node package.json .
EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget -qO- http://localhost:3000/health || exit 1
CMD ["node", "src/server.js"]