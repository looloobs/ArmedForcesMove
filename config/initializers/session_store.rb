# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_afmove_session',
  :secret      => '24328135427c3c7e74e4390ed84e67e85aea0ab772d5c26d8b0ac8a10016bde55bd548e98e3802042ae7034d88bdf5f14d9f54d3cd10651babbfa8704d4c3cd6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
