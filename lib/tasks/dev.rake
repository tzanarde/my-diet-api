namespace :dev do
  desc 'Setup the development environment'
  task setup: :environment do
    reset_database
    insert_types
    insert_units
    insert_foods
    insert_days
    insert_meals
    insert_items
  end

  def reset_database
    puts 'Reseting Database...'
    %x(rails db:drop db:create db:migrate)
  end

  def insert_types
    puts 'Inserting Types...'
    @natural = Type.create!(description: 'Natural')
    @carnes = Type.create!(description: 'Carnes')
    @leite = Type.create!(description: 'Leite')
    @massas = Type.create!(description: 'Massas')
    @carboidratos = Type.create!(description: 'Carboidratos')
    @bebidas = Type.create!(description: 'Bebidas')
  end

  def insert_units
    puts 'Inserting Units...'
    @g = Unit.create!(description: 'g')
    @kg = Unit.create!(description: 'kg')
    @xc = Unit.create!(description: 'xc')
    @cl = Unit.create!(description: 'cl')
    @unid = Unit.create!(description: 'unid')
    @ml = Unit.create!(description: 'ml')
    @l = Unit.create!(description: 'l')
  end

  def insert_foods
    puts 'Inserting Foods...'
    @alface = Food.create!(description: 'Alface', kcal_per_unit: 0.2, type: @natural, unit: @g)
    @acelga = Food.create!(description: 'Acelga', kcal_per_unit: 0.2, type: @natural, unit: @g)
    @carne_vermelha = Food.create!(description: 'Carne Vermelha', kcal_per_unit: 2.52, type: @carnes, unit: @g)
    @leite_desnatado = Food.create!(description: 'Leite Desnatado', kcal_per_unit: 0.3611, type: @leite, unit: @ml)
    @pao_forma_integral = Food.create!(description: 'Pão de Forma Integral', kcal_per_unit: 55, type: @massas, unit: @unid)
    @batata_doce = Food.create!(description: 'Batata Doce', kcal_per_unit: 0.8611, type: @carboidratos, unit: @g)
    @h2o = Food.create!(description: 'H2O', kcal_per_unit: 0, type: @bebidas, unit: @ml)
  end

  def insert_days
    puts 'Inserting Days...'
    @day = Day.create!(date: Date.today)
  end

  def insert_meals
    puts 'Inserting Meals...'
    @cafe_manha = Meal.create!(description: 'Café da Manhã', day: @day)
    @almoco = Meal.create!(description: 'Almoço', day: @day)
  end

  def insert_items
    puts 'Inserting Items...'
    Item.create!(meal: @cafe_manha, food: @pao_forma_integral, amount_eaten: 1)
    Item.create!(meal: @cafe_manha, food: @leite_desnatado, amount_eaten: 180)
    Item.create!(meal: @almoco, food: @alface, amount_eaten: 30)
    Item.create!(meal: @almoco, food: @acelga, amount_eaten: 60)
    Item.create!(meal: @almoco, food: @carne_vermelha, amount_eaten: 90)
    Item.create!(meal: @almoco, food: @batata_doce, amount_eaten: 100)
    Item.create!(meal: @almoco, food: @h2o, amount_eaten: 300)
  end
end
