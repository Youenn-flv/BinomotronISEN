import mysql.connector as ms
import random

NOMBRE_DE_PERSONNE_DANS_LES_GROUP = 2
TRICHE = True
OPSION_DE_REPARTITION = False

def algotimePourRendreAleatoir(listeDanLeBonneOrdre):
    listeMelanger = []
    longeur = len(listeDanLeBonneOrdre)
    for i in range(longeur):
        heureuxHelut = round(random.random()*len(listeDanLeBonneOrdre))-1
        listeMelanger.append(listeDanLeBonneOrdre[heureuxHelut])
        listeDanLeBonneOrdre.remove(listeDanLeBonneOrdre[heureuxHelut])
    return listeMelanger

def asosierLesGroupPourCreeeDesGroup(listeAConcasserEnPlusieurGroup):
    listeDesGroupe = []
    group = []
    i = 1
    for personne in listeAConcasserEnPlusieurGroup:
        group.append(personne)
        if len(listeAConcasserEnPlusieurGroup)%NOMBRE_DE_PERSONNE_DANS_LES_GROUP != 0 and personne == listeAConcasserEnPlusieurGroup[-1]:
            listeDesGroupe.append(group)  
        if i >= NOMBRE_DE_PERSONNE_DANS_LES_GROUP:
            listeDesGroupe.append(group)
            group = []
            i = 0
        i += 1
    
    if OPSION_DE_REPARTITION == True and len(listeDesGroupe[-1]) < NOMBRE_DE_PERSONNE_DANS_LES_GROUP and len(listeDesGroupe[-1]) < len(listeDesGroupe) :
        conteurDeBoucle = 0
        for personne_a_repartir in listeDesGroupe[-1]:
            le_bon_group = conteurDeBoucle%len(listeDesGroupe)
            listeDesGroupe[le_bon_group].append(personne_a_repartir)
            conteurDeBoucle += 1
        listeDesGroupe.pop()
    
    return listeDesGroupe

def trouver_nom_par_id(liste_tuples, id_recherche):
    for tuple in liste_tuples:
        if tuple[0] == id_recherche:
            return tuple[1]
    return None

def afficher_les_groupes(listeGroupID, listeDesNom):
    conteur_de_groupe = 0
    for group in listeGroupID:
        print("group", conteur_de_groupe)
        for eleve in group:
            print(trouver_nom_par_id(listeDesNom, eleve))
        print("\n")
        conteur_de_groupe += 1

listeDesEleves = []
listeDesNomDEleve = []

'''          comunication avec la base SQL et récupération des donnée          '''
'''============================================================================'''
bdd = ms.connect(user="root", password="example", host="localhost", port="3307", database="binomotron")
cursor = bdd.cursor()
query = "SELECT * FROM apprenant;"
cursor.execute(query)

for ligne in cursor :
    listeDesEleves.append(ligne[0])
    listeDesNomDEleve.append((ligne[0],ligne[2]))

cursor.close()
bdd.close()
'''============================================================================'''

# Section principale
listeDesEleves = algotimePourRendreAleatoir(listeDesEleves)
listeDesEleves = asosierLesGroupPourCreeeDesGroup(listeDesEleves)
afficher_les_groupes(listeDesEleves, listeDesNomDEleve)
