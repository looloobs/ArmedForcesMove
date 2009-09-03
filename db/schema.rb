# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090831194515) do

  create_table "answers", :force => true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_id"
    t.integer  "user_id"
  end

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stars"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
  end

  create_table "eats", :force => true do |t|
    t.integer  "installation_id"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "web"
    t.string   "phone"
    t.boolean  "special"
    t.boolean  "military"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "price"
    t.string   "food"
    t.integer  "neighborhood_id"
    t.string   "kids"
  end

  create_table "facts", :force => true do |t|
    t.string   "inprocessing"
    t.string   "temp_lodging"
    t.string   "hospital"
    t.string   "commissary"
    t.string   "px"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "housings", :force => true do |t|
    t.string   "name"
    t.string   "rank"
    t.string   "size"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "neighborhood_id"
    t.integer  "installation_id"
    t.string   "bedrooms"
    t.string   "bathrooms"
  end

  create_table "installations", :force => true do |t|
    t.string   "name"
    t.integer  "zipcode"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
    t.string   "inprocessing"
    t.string   "templodging"
    t.string   "hospital"
    t.string   "family"
    t.string   "commissary"
    t.string   "px"
    t.string   "url_slug"
    t.integer  "question_id"
    t.string   "commissary_times"
    t.string   "school"
    t.string   "px_times"
    t.string   "housing"
  end

  create_table "learns", :force => true do |t|
    t.integer  "installation_id"
    t.string   "category"
    t.text     "info"
    t.boolean  "onpost"
    t.string   "type"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "web"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "offpost_id"
    t.string   "neighborhood"
  end

  create_table "learns_offposts", :id => false, :force => true do |t|
    t.integer "learn_id"
    t.integer "offpost_id"
  end

  add_index "learns_offposts", ["learn_id"], :name => "index_learns_offposts_on_learn_id"
  add_index "learns_offposts", ["offpost_id"], :name => "index_learns_offposts_on_offpost_id"

  create_table "neighborhoods", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "info"
    t.integer  "installation_id"
    t.string   "drive"
    t.string   "distance"
    t.integer  "neighborhood_id"
    t.string   "type"
  end

  create_table "offposts", :force => true do |t|
    t.integer  "installation_id"
    t.string   "neighborhood"
    t.string   "distance"
    t.string   "drive"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "learn_id"
  end

  create_table "onposts", :force => true do |t|
    t.string   "name"
    t.string   "rank"
    t.string   "size"
    t.integer  "installation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "neighborhood_id"
  end

  create_table "opinions", :force => true do |t|
    t.string   "author_name"
    t.integer  "stars"
    t.text     "content"
    t.integer  "opinionable_id"
    t.string   "opinionable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "play_areas", :force => true do |t|
    t.integer  "installation_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "play_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plays", :force => true do |t|
    t.integer  "installation_id"
    t.string   "type"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "phone"
    t.string   "web"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "neighborhood_id"
    t.integer  "play_category_id"
    t.integer  "play_area_id"
  end

  create_table "questions", :force => true do |t|
    t.string   "title"
    t.text     "question"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "answer_id"
    t.integer  "installation_id"
  end

  create_table "reviews", :force => true do |t|
    t.integer  "reviewable_id"
    t.string   "reviewable_type"
    t.string   "author_name"
    t.integer  "stars"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "schools", :force => true do |t|
    t.string   "level"
    t.text     "info"
    t.boolean  "onpost"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "web"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "installation_id"
    t.integer  "neighborhood_id"
    t.string   "category"
  end

  create_table "shop_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shopcats", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shops", :force => true do |t|
    t.integer  "installation_id"
    t.string   "category"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "phone"
    t.string   "web"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "neighborhood_id"
    t.integer  "shop_category_id"
    t.string   "store"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
