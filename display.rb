require 'json'

class Display
  def self.books(_books)
    books_data = load_data_from_json('books_data.json')

    books_data.each_with_index do |book, index|
      puts "#{index}) Title: '#{book['title']}', Author: #{book['author']}"
    end
  end

  def self.people(_people)
    people_data = load_data_from_json('persons_data.json')

    people_data.each_with_index do |person, index|
      puts "#{index}) [#{person['type']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end
  end

  def self.rentals(_rentals, person_id)
    rentals_data = load_data_from_json('rentals_data.json')

    rentals_data.each do |rental|
      if rental['person']['id'] == person_id
        puts "Date: #{rental['date']}, Book: '#{rental['book']['title']}' by #{rental['book']['author']}"
      end
    end
  end

  def self.load_data_from_json(file_name)
    file_path = File.join(File.dirname(__FILE__), file_name)

    begin
      json_data = File.read(file_path)
      JSON.parse(json_data)
    rescue StandardError => e
      puts "Error loading data from #{file_name}: #{e.message}"
      []
    end
  end
end
