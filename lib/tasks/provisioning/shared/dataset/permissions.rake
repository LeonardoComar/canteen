# frozen_string_literal: true

namespace :provisioning do
  namespace :shared do
    namespace :dataset do
      namespace :permissions do
        desc 'Populate all permissions'
        task populate: :environment do
          def prefix
            "Task [provisioning:shared:dataset:permissions:populate] [#{DateTime.current}]:"
          end
          
          puts "#{prefix} Initialized"

          ActiveRecord::Base.connection.execute <<-SQL
            INSERT INTO permissions (id, name, category, internal_name, created_at, updated_at) VALUES (1, 'Visualização de Home Page', 'home', 'home_index', '2022-05-12 16:27:30.019856', '2022-05-12 16:27:30.019856') ON CONFLICT DO NOTHING;
            INSERT INTO permissions (id, name, category, internal_name, created_at, updated_at) VALUES (2, 'Visualização de Clientes', 'customers', 'customers_index', '2022-05-12 16:27:30.019856', '2022-05-12 16:27:30.019856') ON CONFLICT DO NOTHING;         
            INSERT INTO permissions (id, name, category, internal_name, created_at, updated_at) VALUES (3, 'Adicionar Cliente', 'customers', 'customer_new', '2022-05-12 16:27:30.019856', '2022-05-12 16:27:30.019856') ON CONFLICT DO NOTHING; 
          SQL
          
          puts "#{prefix} Finished"
        end
      end
    end
  end
end