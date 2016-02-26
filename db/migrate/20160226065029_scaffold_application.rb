class ScaffoldApplication < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :name
      t.string :email
      t.timestamps null: false
    end

    create_table :animals do |t|
      t.string :name
      t.integer :pet_value
      t.timestamps null: false
    end

    create_table :contests do |t|
      t.string :name
      t.integer :week
      t.string :prize
      t.string :vote_type
      t.integer :choice_one_id
      t.integer :choice_two_id
      t.integer :winner_id
      t.timestamps null: false
    end

    create_table :clicks do |t|
      t.integer :animal_id
      t.integer :user_id
      t.timestamps null: false
    end

    create_table :score_cards do |t|
      t.integer :user_id
      t.integer :click_id
      t.integer :contest_id
      t.integer :value
      t.timestamps null: false
    end

  end
end
