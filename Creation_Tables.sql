-- Création des tables
CREATE TABLE utilisateurs (
    id SERIAL PRIMARY KEY, -- Auto-incrémentation
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL, -- Pas deux fois le même email
    mot_de_passe VARCHAR(255) NOT NULL,
    date_creation TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP -- Date auto
);

CREATE TABLE produits (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(150) NOT NULL,
    description TEXT,
    prix DECIMAL(10, 2) NOT NULL CHECK (prix >= 0), -- Le prix ne peut pas être négatif
    stock INTEGER NOT NULL DEFAULT 0 CHECK (stock >= 0) -- Le stock ne peut pas être négatif
);

CREATE TABLE commandes (
    id SERIAL PRIMARY KEY,
    utilisateur_id INTEGER REFERENCES utilisateurs(id) ON DELETE CASCADE, -- Si l'user est supprimé, ses commandes aussi
    date_commande TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    statut VARCHAR(20) DEFAULT 'en_cours' CHECK (statut IN ('en_cours', 'validee', 'expediee', 'annulee')) -- Liste fermée de statuts
);

CREATE TABLE lignes_commandes (
    id SERIAL PRIMARY KEY,
    commande_id INTEGER REFERENCES commandes(id) ON DELETE CASCADE,
    produit_id INTEGER REFERENCES produits(id) ON DELETE SET NULL, -- Si le produit disparait, on garde la ligne mais produit_id devient NULL
    quantite INTEGER NOT NULL CHECK (quantite > 0), -- Au moins 1 article
    prix_unitaire DECIMAL(10, 2) NOT NULL -- Prix figé au moment de l'achat
);

CREATE TABLE avis (
    id SERIAL PRIMARY KEY,
    utilisateur_id INTEGER REFERENCES utilisateurs(id) ON DELETE CASCADE,
    produit_id INTEGER REFERENCES produits(id) ON DELETE CASCADE,
    note INTEGER CHECK (note BETWEEN 1 AND 5), -- Note entre 1 et 5
    commentaire TEXT,
    date_avis TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE journaux_activite (
    id SERIAL PRIMARY KEY,
    utilisateur_id INTEGER REFERENCES utilisateurs(id) ON DELETE SET NULL,
    action VARCHAR(255) NOT NULL,
    horodatage TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
