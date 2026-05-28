# SkillHub API — starter EC06

![CI](https://github.com/ClubEpice/EC06_blanc/actions/workflows/ci.yml/badge.svg)
![Node](https://img.shields.io/badge/node-20-brightgreen)
![pnpm](https://img.shields.io/badge/pnpm-10-orange)
![Docker](https://img.shields.io/badge/docker-multistage-blue)

Mini API Express (Node.js 20) qui sert de base à l'épreuve EC06.

## Endpoints

- `GET /` : message d'accueil.
- `GET /health` : retourne le statut de l'API.

## Scripts npm

```bash
npm install            # installer les dépendances
npm start              # démarrer le serveur sur le port 3000
npm test               # lancer la suite de tests Jest
npm run lint           # vérifier le code avec ESLint
```

## À noter

Ce starter contient une mini-app Express fonctionnelle, **2 tests Jest qui passent**, et une config ESLint minimale. **Tout passe au vert dès le départ** — l'épreuve évalue votre capacité à mettre en place la chaîne CI/CD autour de cette app, pas à coder en Node.

Ce starter ne contient **ni** `Dockerfile`, **ni** `docker-compose.yml`, **ni** `.gitignore`, **ni** workflow CI. C'est à vous de tout ajouter pendant l'épreuve.

## Pré-requis

- Node.js 20+
- Docker et Docker Compose (à utiliser une fois que vous aurez écrit votre `Dockerfile` et `docker-compose.yml`)
