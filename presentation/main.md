# Support de présentation du projet final

Ce support est rédigé au format markdown afin de pouvoir être versionné facilement.

Référentiels de la syntaxe markdown:

- <https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax4>
- <https://www.markdownguide.org/basic-syntax/>
- <https://www.markdownguide.org/extended-syntax/>

## Partie 1

Le projet final sera versionné dans un repository **git** dont le dépôt principal sera hébergé ici:
<https://github.com/Romain-Revel/ajc-projet-final/>

L'infrastructure sera implémentée avec **vagrant** et avec le provider **Virtualbox**. Le dossier infrastructure contiendra les fichiers et sous-dossiers nécessaires à l'installation de celle-ci.

### Infrastructure

- Une VM docker
- Une VM minikube

### Correction d'un bug entre Virtualbox et Vagrant

Pour faire fonctionner le Vagrantfile sous Linux Mint, il faut ajouter un nom à l'interface réseau:
<https://www.kilala.nl/index.php?id=2554>
