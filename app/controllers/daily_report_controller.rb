class DailyReportController < ApplicationController
  def food_of_the_day
    result = { "#{Day.where(date: Date.today).first.date}":
               Day.where(date: Date.today).first.meals.map { |meal|
                 { "#{meal.description}": meal.items.map { |item|
                   { 'Tipo': item.food.type.description,
                     'Descrição': item.food.description,
                     'kcal por Unidade': "#{item.food.kcal_per_unit} kcal",
                     'Quantidade Consumida': "#{item.amount_eaten.ceil} #{item.food.unit.description}",
                     'Total de Calorias': "#{(item.food.kcal_per_unit * item.amount_eaten).ceil} kcal" } },
                     'Total de Calorias na Refeição': '?' } },
                     'Total de Calorias no Dia': '?' }

    render json: result
  end
end
