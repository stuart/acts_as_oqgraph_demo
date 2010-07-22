# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_oqgraph_test_session',
  :secret      => '5953863bd1b1fa6665530267abefa09d32caca06b5a3cadf626bd9eb465acad66b26a1f47cc9c2f2b2924f74819770248eb52b3b26f1401359ea358c9df248e8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
