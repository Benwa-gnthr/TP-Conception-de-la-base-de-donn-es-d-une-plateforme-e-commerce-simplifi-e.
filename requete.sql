-- Requête simple avec filtre (WHERE)
SELECT nom, stock, prix 
FROM produits 
WHERE stock < 10 
ORDER BY stock ASC; -- Du plus petit au plus grand

-- La jointure classique
SELECT 
    u.nom AS client, 
    c.date_commande, 
    p.nom AS produit, 
    l.quantite, 
    l.prix_unitaire
FROM utilisateurs u
JOIN commandes c ON u.id = c.utilisateur_id
JOIN lignes_commandes l ON c.id = l.commande_id
JOIN produits p ON l.produit_id = p.id;
