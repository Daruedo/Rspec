# README


Testando Ruby com Rspec

* Criar primeiro teste
* Rspec é um framework BDD
* BDD não é obrigatório, mas boa pratica
* Integrar o Rspec e o Ruby On Rails
* Testar models
* Ttestar controllers
* Ttestar APIs

GEMS:
Rails
Rspec

Rodar testes:
bundle exec rspec spec/models/user_spec.rb
bundle exec rspec spec/requests/users_spec.rb
bundle exec rspec spec/requests/enemies_spec.rb

Iniciando:
rspec --init

rspec spec/lib/hero_spec.rb

procurar por
group :development, :test do
    gem 'rspec-rails', '~> 3.8'
end

bundle install
rails db:create
rails generate rspec:install
rails generate model user
rails generate rspec:request User
rails g migration add_name_kind_level_to_user nickname:string kind:integer level:integer
rails db:migrate

rails g controller users index create --no--helper --no-assets --no-controller-specs --no-view-specs --skip-routes
rails g controller enemies update destroy --no-helper --no-assets --no-controller-specs --no-view-specs --skip-routes
rails g model enemy name:string power_base:integer power_step:integer level:integer kind:integer
rails db:migrate
rails generate rspec:request Enemy

gem install ffi

-------------------------------------------------------------------------------------------------------

Desafio #2:


    1. criar metodo/model weapon

    name
    description
    power_base
        pontos de poder quando a arma esta no level 1, exp: 3000
    power_step
        pontos de poder que aumentam a cada level, exp: 100
    level
        level atual da arma (començando em 1)


rails g controller weapon create update destroy --no-helper --no-assets --no-controller-specs --no-view-specs --skip-routes
rails g model weapon name:string power_base:integer power_step:integer level:integer
rails db:migrate
rails db:migrate RAILS_ENV=test

    2. criar os metódos no model

    current_power
        (power_base+((level-1)*power_step))
    title
        "nome_da_arma #level_da_arma"

    3. realizar os testes dos métodos usando as gems ffaker e factory bot


Teste unitario = pequenas unidades (funções, metodos, etc)
Teste integração = varios componentes ao mesmo tempo (request, GET /home)

Desafio #3:

    1. Criar um controller para as weapons com as seguintes actions

    index (GET /weapons)
        devolve uma pagina com uma lista com os nomes, current_power's, titles e links para os detalhes das armas (pagina show)

    create (POST /weapons)

    delete (DELETE /weapons/:id)

    show (GET /weapons/:id)
        devolve uma página com todos os detalhes de uma arma

    2. Criar os seguintes testes

    Para o index
        Verificar se os nomes estão sendo exibidos
        Verificar se os current_power's estão sendo exibidos
        Verificar se os titles estão sendo exibidos
        Verificar se os links  estão sendo exibidos corretamente

    Para o create
        Verificar se está passando os parâmetros corretos a arma está sendo criada
        Verificar se estpa passando os parâmetros incorretos a arma não está sendo criada

    Para o delete
        Verificar se passando o id correto a arma está sendo deletada

    Para o show
        Verificar se todos os detalhes da arma estão presentes
            (name, description, level, power_base, power_step, current_power e title)


Desafio #4:

    1.Crie no controller enemies os seguintes métodos
    index(GET /enemies)
    show(GET /enemies/:id)
    create(POST /enemies)

-------------------------------------------------------------------------------------------------------