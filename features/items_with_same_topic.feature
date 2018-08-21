#language: fr

<<<<<<< HEAD
<<<<<<< HEAD
Fonctionnalité: À partir d'un item, obtenir ceux qui sont dans la même rubrique
=======
Fonctionnalité: A partir d'un item, obtenir ceux qui ont le même thème
>>>>>>> ccbed0cdaeb99150b383ab3f939a370d518aa3c4
=======
Fonctionnalité: A partir d'un item, obtenir ceux qui ont le même thème
>>>>>>> ccbed0cdaeb99150b383ab3f939a370d518aa3c4

Contexte:
 Soit le point de vue "Histoire de l'art" rattaché au portfolio "vitraux"
 Soit le corpus "Vitraux - Dr. Krieger" rattaché au portfolio "vitraux"
<<<<<<< HEAD
<<<<<<< HEAD
 Soit la rubrique "Donateur" rattachée au point de vue "Histoire de l'art"
 Soit la rubrique "Figuration du donateur" contenue dans la rubrique "Donateur"
 Soit l'item "BSS 007" rattaché à la rubrique "Figuration du donateur"
 Soit l'item "BSS 018" rattaché à la rubrique "Figuration du donateur"

Scénario:

 Soit "vitraux" le portfolio ouvert
 Soit "BSS 007" l'item affiché
 Quand on choisit la rubrique "Figuration du donateur"
 Alors le titre affiché est "VITRAUX"
 Et l'item "BSS 007" est affiché
 Et l'item "BSS 018" est affiché
 Et les rubriques "Figuration du donateur" sont sélectionnées
=======
=======
>>>>>>> ccbed0cdaeb99150b383ab3f939a370d518aa3c4
 Soit le regroupement de thèmes "Donateur" rattaché au point de vue "Histoire de l'art"
 Soit le thème "Figuration du donateur" rattaché au regroupement de thèmes "Donateur"
 Soit l‘item "BSS 007" lié au thème "Figuration du donateur"
 Soit l‘item "BSS 018" lié au thème "Figuration du donateur"

Scénario: A partir d'un item, obtenir ceux qui ont le même thème

 Soit l‘item affiché "BSS 007"
 Quand un visiteur clique sur le thème "Figuration du donateur"
 Alors le titre affiché est "VITRAUX"
 Et l‘item "BSS 007" est visible sur la page
 Et l‘item "BSS 018" est visible sur la page
 Et le thème "Figuration du donateur" est visible sur la page
 Et le thème "Figuration du donateur" est sélectionné
<<<<<<< HEAD
>>>>>>> ccbed0cdaeb99150b383ab3f939a370d518aa3c4
=======
>>>>>>> ccbed0cdaeb99150b383ab3f939a370d518aa3c4
