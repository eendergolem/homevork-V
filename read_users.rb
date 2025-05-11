require 'json'

begin
  file = File.read('users.json')
  users = JSON.parse(file)

  if users.empty?
    puts "Файл не містить користувачів."
  else
    total_age = 0
    puts "\n🧑‍💻 Список користувачів:\n\n"

    users.each_with_index do |user, index|
      puts "#{index + 1}. Name: #{user['name']}, Age: #{user['age']}"
      total_age += user['age'].to_i
    end

    average_age = total_age.to_f / users.size
    puts "\n📊 Середній вік: #{average_age.round(2)} років"
  end

rescue Errno::ENOENT
  puts "❌ Файл 'users.json' не знайдено!"
rescue JSON::ParserError
  puts "❌ Помилка при читанні JSON-файлу."
end
