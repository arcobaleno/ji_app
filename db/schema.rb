# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130821194339) do

  create_table "credits", :force => true do |t|
    t.integer  "user_id"
    t.integer  "pool_id"
    t.string   "credit_code"
    t.integer  "value",       :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.integer  "user_id"
    t.string   "type"
    t.string   "team_one"
    t.string   "team_two"
    t.integer  "team_one_score"
    t.integer  "team_two_score"
    t.string   "winner"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.integer  "user_id"
    t.integer  "pool_id"
    t.integer  "team_one_predicted_score"
    t.integer  "team_two_predicted_score"
    t.boolean  "winner",                   :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pools", :force => true do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.string   "pool_type"
    t.string   "status"
    t.integer  "buy_in"
    t.integer  "max_players"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "password_digest"
    t.string   "remember_token"
    t.integer  "user_type",       :default => 1
    t.string   "avatar"
    t.integer  "status",          :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
