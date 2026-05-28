#!/bin/bash
set -e
LOG="deploy.log"
# En CI, on pull depuis GHCR avec le tag fourni par le job build (steps.meta.outputs.version → sha-xxxxx).
# En local, fallback sur l'image locale taguée par le SHA court.
SHA_TAG="${IMAGE_TAG:-sha-$(git rev-parse --short HEAD)}"
REGISTRY_IMAGE="ghcr.io/${GITHUB_REPOSITORY:-ClubEpice/EC06_blanc}:${SHA_TAG}"
IMAGE="${REGISTRY_IMAGE,,}"  # GHCR exige du minuscule

echo "=== Déploiement simulé ===" | tee "$LOG"
echo "Image cible : $IMAGE" | tee -a "$LOG"
echo "" | tee -a "$LOG"
echo "[SIMULATION] docker pull $IMAGE" | tee -a "$LOG"
echo "[SIMULATION] docker stop skillhub-api || true" | tee -a "$LOG"
echo "[SIMULATION] docker run -d --name skillhub-api -p 3000:3000 $IMAGE" | tee -a "$LOG"
echo "" | tee -a "$LOG"
echo "Déploiement simulé avec succès à $(date)" | tee -a "$LOG"