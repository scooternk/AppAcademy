require 'sqlite3'
require_relative 'play_db_connection'
require_relative 'plays.rb'

class Playwright
    attr_accessor :name, :birth_year

    def self.all
        data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
        data.map { |datum| Playwright.new(datum) }
      end
    
      def self.find_by_name(name)
        data = PlayDBConnection.instance.execute(<<-SQL, name)
        SELECT *
        FROM
            playwrights
        WHERE
            name = ?
        SQL

        data.map { |datum| Playwright.new(datum)}
      end

      def initialize(options)
        @id = options['id']
        @name = options['name']
        @birth_year = options['birth_year']
      end

      def create
        raise "#{self} already in database" if @id
        
        PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year)
        INSERT INTO
            playwrights (name, birth_year)
        VALUES
            (?, ?)
        SQL
        @id = PlayDBConnection.instance.last_insert_row_id
      end

      def update
        raise "#{self} not in database" unless @id

        PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year, @id)
          UPDATE
            playwrights
          SET
            name = ?, birth_year = ?
          WHERE
            id = ?
        SQL
      end

      def get_plays
        data = PlayDBConnection.instance.execute(<<-SQL, @id)
        SELECT * 
        FROM 
            plays
        WHERE
            playwright_id = ?
        SQL

        data.map { |datum| Play.new(datum) }
      end

end