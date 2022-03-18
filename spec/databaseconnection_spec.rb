require 'databaseconnection'

describe DatabaseConnection do
  describe ".setup" do
      it "stores the connection in a variable" do
        DatabaseConnection.setup('bookmark_manager_test')
        expect(DatabaseConnection.connection).to be_an_instance_of(PG::Connection)
      end
      it 'connects to the database given' do
        DatabaseConnection.setup('bookmark_manager_test')
        expect(DatabaseConnection.connection.db).to eq('bookmark_manager_test')
      end
    end
  end
  describe ".query" do
    it 'return an instance of PG::Result' do
      DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.query('SELECT * FROM bookmarks')).to be_an_instance_of(PG::Result)
  end
end