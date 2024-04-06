require 'sinatra/base'
require 'sequel'
require 'dotenv/load'
require 'parallel'

class MyApp < Sinatra::Base
    before do
        pass if request.path_info == '/api/v1/user_ids' || request.path_info == 'api/v1/serial'
        get_user_id
    end

    after do
        response.headers['Content-Type'] = 'application/json'
    end

    DB = Sequel.connect(ENV['DB_URL'])

    get '/api/v1/items' do
        limit, offset = params[:limit].to_i || 10, params[:offset].to_i || 0
        statement = %q(
            SELECT
                i.id, i.name, i.created_at, i.updated_at
            FROM
                items i
            JOIN
                user_items ui ON ui.item_id = i.id
            WHERE
                ui.user_id = ?
            LIMIT ?
            OFFSET ?
        )
        items = DB.fetch(statement, @user_id, limit, offset)
        items.all.to_json
    end

    get '/api/v1/serial' do
        start = Time.now
        [1,2,3].each do |n|
            sleep(n)
        end
        {"elapsed": Time.now - start}.to_json
    end

    get '/api/v1/concurrent' do
        start = Time.now
        results = Parallel.map((0..3).map.to_a) do |n|
            sleep(n)
        end
        {"elapsed": Time.now - start}.to_json
    end

    get '/api/v1/user_ids' do
        user_ids = DB[:users].select(:id).order(:id).all
        user_ids.to_json
    end

    def get_user_id
        @user_id = request.env['HTTP_X_USER_ID']
    end
end
