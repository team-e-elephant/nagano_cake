class Item < ApplicationRecord

    has_many :cart_items
    belongs_to :genre
    attachment :image


    #validates uniquenss重複を防ぐ inclusion属性が含まれているか確認する
    validates :name, presence: true, uniqueness: true
    validates :introduction, presence: true
    validates :genre_id, presence: true
    validates :price,  presence: true
    validates :is_active, inclusion: { in: [true,false] }
end
