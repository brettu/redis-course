class ScaffoldApplication < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.timestamps null: false
    end

    create_table :animals do |t|
      t.string :name
      t.integer :value
      t.timestamps null: false
    end

    create_table :contests do |t|
      t.string :name
      t.integer :day
      t.string :prize
      t.timestamps null: false
    end

    create_table :clicks do |t|
      t.belongs_to :animal, index: true
      t.belongs_to :user, index: true
      t.belongs_to :score_card, index: true
      t.timestamps null: false
    end

    create_table :score_cards do |t|
      t.belongs_to :user, index: true
      t.belongs_to :contest, index: true
      t.integer :score
      t.timestamps null: false
    end
  end
end
