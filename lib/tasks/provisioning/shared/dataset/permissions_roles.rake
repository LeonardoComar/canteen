# frozen_string_literal: true

namespace :provisioning do
  namespace :shared do
    namespace :dataset do
      namespace :permissions_roles do
        desc 'Populate all permissions_roles'
        task populate: :environment do
          def prefix
            "Task [provisioning:shared:dataset:permissions_roles:populate] [#{DateTime.current}]:"
          end
          
          puts "#{prefix} Initialized"

          ActiveRecord::Base.connection.execute <<-SQL
            INSERT INTO permissions_roles (id, permission_id, role_id, created_at, updated_at) VALUES (1, 1, 1, '2022-05-12 16:27:30.019856', '2022-05-12 16:27:30.019856') ON CONFLICT DO NOTHING;
            INSERT INTO permissions_roles (id, permission_id, role_id, created_at, updated_at) VALUES (2, 2, 1, '2022-05-12 16:27:30.019856', '2022-05-12 16:27:30.019856') ON CONFLICT DO NOTHING;
            INSERT INTO permissions_roles (id, permission_id, role_id, created_at, updated_at) VALUES (3, 3, 1, '2022-05-12 16:27:30.019856', '2022-05-12 16:27:30.019856') ON CONFLICT DO NOTHING;
            INSERT INTO permissions_roles (id, permission_id, role_id, created_at, updated_at) VALUES (4, 1, 2, '2022-05-12 16:27:30.019856', '2022-05-12 16:27:30.019856') ON CONFLICT DO NOTHING;
            INSERT INTO permissions_roles (id, permission_id, role_id, created_at, updated_at) VALUES (5, 2, 2, '2022-05-12 16:27:30.019856', '2022-05-12 16:27:30.019856') ON CONFLICT DO NOTHING;
            INSERT INTO permissions_roles (id, permission_id, role_id, created_at, updated_at) VALUES (6, 3, 2, '2022-05-12 16:27:30.019856', '2022-05-12 16:27:30.019856') ON CONFLICT DO NOTHING;       
          SQL
    
          puts "#{prefix} Finished"
        end
      end
    end
  end
end