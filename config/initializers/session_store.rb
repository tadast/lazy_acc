# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lazy_acc_session',
  :secret      => '9e5a263f78219d29a209e656c6f17214b23386d8ead0e74f1d029e0bd795382fc9502c25398a71d169f474c0d3b75b83fc63d0d18c2dcb69767507f911ca82ba'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
