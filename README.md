# AIfES MNIST sur STM32 : compte rendu (partie 1, test sur STM32)

Inférence d'un réseau de neurones MNIST avec la bibliothèque **AIfES** (Fraunhofer IMS) sur un microcontrôleur **STM32L4R9** (STM32CubeIDE), pilotée depuis un PC par un script Python via l'UART (ST-LINK Virtual COM Port).

## 1. Objectif

Valider la chaîne complète sur STM32 avant un portage vers une autre cible :

- entraînement du modèle en Python (Keras) puis conversion avec AIfES-Converter ;
- déploiement du modèle sur le microcontrôleur ;
- évaluation sur 100 images MNIST envoyées par le PC ; le microcontrôleur ne fait que l'inférence, le PC garde le jeu de données, la vérité terrain et le calcul de précision.

## 2. Architecture

```
Script Python (PC)  --UART 115200, ST-LINK VCP-->  STM32 + AIfES  --prédiction-->  Script Python
```

| Élément | Choix |
|---|---|
| Cible | STM32L4R9 (Cortex-M4 avec FPU), STM32CubeIDE 1.15 |
| Bibliothèque | AIfES 2.2.0 (`AIfES_for_Arduino`, fichiers sources allégés) |
| Modèle | 784 → 128 (ReLU) → 64 (ReLU) → 10 (Softmax), float32 |
| Taille | 109 386 paramètres, soit 437 544 octets en flash |
| Espace de travail d'inférence | 6 272 octets (buffer statique de 8 Ko, pas de `malloc`) |
| Normalisation d'entrée | `(pixel / 255) - 0.5` |

Le premier modèle (784-512-256-128-64-10, 2,3 Mo) dépassait la flash de la carte ; il a été remplacé par le modèle réduit ci-dessus.

## 3. Protocole UART (côté script Python, inchangé)

| Étape | Sens | Contenu |
|---|---|---|
| Synchronisation | PC → MCU | `0xAB`, répété jusqu'à réponse |
| Synchronisation | MCU → PC | `0xCD` |
| Image | PC → MCU | 784 × float32 little-endian (3 136 octets) |
| Réponse | MCU → PC | 10 octets : `round(softmax_k × 255)` ; le script divise par 255 et prend l'argmax |

Aucun texte de debug n'est envoyé sur l'UART (le port est partagé avec le script).

## 4. Fichiers du firmware

| Fichier | Rôle |
|---|---|
| `Core/Src/aifes_app.c`, `Core/Inc/aifes_app.h` | Couche applicative : protocole UART, appel de l'inférence, compteurs de debug `aifes_dbg_*` |
| `Core/Inc/aifes_f32_fnn.h` | Définition du modèle 3 couches, mémoire statique, `create_model()` et `inference()` |
| `Core/Inc/aifes_f32_weights.h` | Poids exportés depuis Keras (à régénérer avec le notebook) |
| `Middlewares/AIfES/` | Sources AIfES allégées + `aifes_config.h` pour STM32 |

Intégration dans `main.c` : `aifes_app_init();` dans `USER CODE 2` et `aifes_app_step();` dans la boucle principale.

## 5. Configuration CubeIDE / CubeMX

- UART : **USART2** (PA2/PA3), 115200 bauds, 8N1, sans contrôle de flux (liaison ST-LINK Virtual COM Port).
- Ajouter `Middlewares/AIfES` aux *Source Location* et aux chemins d'include.
- Taille de pile minimale : `0x1000`.
- **Désactiver les périphériques inutilisés** (voir section 6, problème n°5).

## 6. Problèmes rencontrés et solutions

| # | Symptôme | Cause | Solution |
|---|---|---|---|
| 1 | `section .rodata will not fit in region FLASH` | Poids du gros modèle (2,3 Mo) | Modèle réduit 784-128-64-10 (437 Ko) |
| 2 | `undefined reference to ailayer_*, aialgo_*` | Sources AIfES non compilées (seulement dans les includes) | Ajouter `Middlewares/AIfES` dans *Source Location* |
| 3 | Risque de `Error_Handler()` au démarrage | Espace de travail de 4 Ko inférieur aux 6 272 octets nécessaires | Buffer porté à 8 Ko |
| 4 | Le script restait sur « Synchronising... » | Le firmware n'implémentait pas la poignée de main `0xAB` → `0xCD` | `aifes_app.c` réécrit pour le protocole réel |
| 5 | Le script restait sur « Synchronising... » (firmware pourtant correct) | `MX_SDMMC1_SD_Init()` échouait (carte SD) et `Error_Handler()` bouclait avant le code applicatif | Désactiver SDMMC1 (et les périphériques inutilisés) dans CubeMX, puis régénérer |

Méthode de diagnostic utile : test de boucle d'émission seule (LED + envoi d'un octet sur `huart2`), vérification du bon port COM, puis lecture des compteurs `aifes_dbg_*` dans *Live Expressions*.

## 7. Validation

- Le firmware (couche applicative + AIfES) a été validé sur PC contre un UART simulé : poignée de main, enchaînement de 100 images avec le script Python non modifié, resynchronisation sans reset.
- Les prédictions de la version C ont été comparées à une passe avant numpy des mêmes poids : prédictions identiques.
- Précision mesurée sur la carte (100 images MNIST) : **à compléter**.
- Temps d'inférence (`aifes_last_inference_ms`) : **à compléter**.

Point d'attention pour la précision : les données du fichier `.npy` doivent être dans l'intervalle [-0.5 ; 0.5] (même normalisation qu'à l'entraînement). Sinon, soustraire 0.5 côté Python.

## 8. Pistes d'amélioration

- Activer les couches Dense CMSIS (`AIFES_WITH_CMSIS`) pour accélérer l'inférence sur Cortex-M4/M7, puis vérifier que les prédictions restent identiques.
- Ajuster la taille du modèle selon la mémoire disponible.

## 9. Licence

AIfES et les fichiers générés par AIfES-Converter sont sous licence **AGPL-3.0** (Fraunhofer IMS) : vérifier la compatibilité avant de publier le dépôt.
