# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_maps_session',
  :secret      => '287db3aba890a44a73b216535ed75ecff9275b10b10538e3fd1395caff4ef0b39c2abd5f19c1946e7f62dc2f4ffd80d8c3c67cb6fe2a814aeead9fea263ab4ca'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
