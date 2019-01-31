class blog < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.has_many :likes, index: true
      t.has_many :comments, index: true
      t.has_many :articles, index: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.timestamps
    end

    create_table :articles do |t|
      t.has_many :likes, index: true
      t.belongs_to :categories, index: true
      t.has_many :comments, index: true
      t.belongs_to :users, index: true
      t.string :title
      t.text :content
    end
    create_table :categories do |t|
      t.has_many :articles, index: true
      t.string :name
    end
    create_table :comments do |t|
      t.belongs_to :users 
      t.belongs_to :articles
      t.text :content
    end
    create_table :likes do |t|
      t.belongs_to :articles, index: true
      t.belongs_to :users, index: true
    end
    #faire les liens entre les models : un like concerne un article, et est fait par un likeur (qui est un utilisateur)
    #un utilisateur peut avoir plusieurs likes
    #un article peut avoir plusieurs likes
    
    #un commentaire commentera un article, et aura un auteur (qui est un utilisateur)
    #un utilisateur peut créer plusieurs commentaires
    #un article peut avoir plusieurs commentaires

    #un article a une catégorie
    #une catégorie peut concerner plusieurs articles

    #un article a forcément un auteur (qui est un user) et un user peut avoir écrit plusieurs articles

  end


end
