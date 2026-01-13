-- UTILISATEURS
INSERT INTO utilisateurs (nom, email, mot_de_passe) VALUES
('Alice Dupont', 'alice@exemple.com', 'hash_secret_123'),
('Bob Martin', 'bob@exemple.com', 'hash_secret_456'),
('Charlie Durand', 'charlie@exemple.com', 'hash_secret_789');

-- PRODUITS
INSERT INTO produits (nom, description, prix, stock) VALUES
('Ordinateur Portable Pro', 'PC haute performance pour le développement', 1200.50, 10),
('Souris Ergonomique', 'Souris sans fil verticale', 45.00, 50),
('Écran 4K 27 pouces', 'Moniteur UHD pour graphistes', 350.00, 5),
('Clavier Mécanique', 'Clavier rétroéclairé switch rouge', 89.90, 0); -- Stock à 0 pour tester les ruptures

-- COMMANDES
INSERT INTO commandes (utilisateur_id, date_commande, statut) VALUES
(1, NOW() - INTERVAL '7 days', 'expediee'), -- Commande 1 : Alice, il y a 7 jours
(1, NOW(), 'en_cours'),                     -- Commande 2 : Alice, aujourd'hui
(2, NOW(), 'validee');                      -- Commande 3 : Bob, aujourd'hui

-- CONTENU DES COMMANDES (Lignes_commandes)
INSERT INTO lignes_commandes (commande_id, produit_id, quantite, prix_unitaire) VALUES
(1, 1, 1, 1200.50),
(1, 2, 1, 45.00),
(2, 3, 2, 350.00),
(3, 4, 1, 89.90);

-- AVIS
INSERT INTO avis (utilisateur_id, produit_id, note, commentaire) VALUES
(1, 1, 5, 'Super machine, très rapide !'),
(1, 2, 4, 'Bonne souris mais un peu petite.'),
(2, 4, 2, 'Clavier bruyant, je suis déçu.');

-- LOGS D'ACTIVITÉ
INSERT INTO journaux_activite (utilisateur_id, action) VALUES
(1, 'Connexion réussie'),
(1, 'Consultation fiche produit #1'),
(1, 'Ajout au panier'),
(2, 'Connexion réussie'),
(2, 'Validation commande #3');
