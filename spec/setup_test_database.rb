require 'pg'
def setup_test_database
  # Clear the bookmarks table
  DatabaseConnection.query("TRUNCATE bookmarks RESTART IDENTITY;")
end