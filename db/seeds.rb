# Carregue os dados rodando `rake db:seed`

def load_seeds
   load_countries
   load_states
   load_cities
end

# Transforma o índice de um array e o total de itens no array na string
# formatada para exibição nos logs
def to_progress(index, length)
    percent = format('%.2f', index.next.to_f / length * 100).to_s.rjust(6, ' ')
    width   = length.to_s.length
  
    "#{index.next.to_s.rjust(width, ' ')}|#{length}|#{percent}%"
end

# Carrega o arquivo do seed e itera pelos itens logando quantos faltam.
# Espera um terceiro argumento que deve ser um bloco que trata os dados de uma
# linha do arquivo carregado para que seja inserido o registro no banco.
def load_seed(file_name)
    base_description = file_name.split('.').first.tr('_', ' ')
    print "\r* Loading #{base_description}"
  
    file_format = file_name.to_s.split('.').last.downcase.to_sym
    file_path   = Rails.root.join("db/seed/#{file_name}")
  
    data_list =
      case file_format
      when :csv  then CSV.read(file_path)
      when :json then JSON.parse(File.read(file_path), symbolize_names: true)
      else []
      end
  
    data_list.each_with_index do |data_item, index|
      progress = to_progress(index, data_list.length)
      print "\r* Loading #{base_description}: #{progress}"
  
      # Pula pro próximo se for uma linha em branco no csv, por exemplo
      next unless data_item.present?
  
      # Chama o bloco passando como argumentos cada linha/item do csv/json
      yield(data_item, index)
  
      $stdout.flush
    end
    puts
  
    $stdout.flush
  end


def load_countries
    load_seed 'countries.json' do |country|
        puts country
        Country.find_or_create_by(country)
    end
end

def load_states
    load_seed 'states.json' do |state|
        State.find_or_create_by(state)
    end
end

def load_cities
    load_seed 'cities.json' do |city|
        City.find_or_create_by(city)
    end
end

load_seeds

$stdout.flush