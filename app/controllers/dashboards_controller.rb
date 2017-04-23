class DashboardsController < ApplicationController
  def show
    @ex_categories_months    = [*0..2].map{|m|categories_month(m,true)}
    @ex_categories_last_year = Category.where(user_id: current_user.id).map do |c|
      { name: c.name, data: [*0..11].reverse.map{|n|category_month(c.id,n,true)} }
    end

    @in_categories_months    = [*0..2].map{|m|categories_month(m,false)}
    @in_categories_last_year = Category.where(user_id: current_user.id).map do |c|
      { name: c.name, data: [*0..11].reverse.map{|n|category_month(c.id,n,false)} }
    end

    @expence_months = [*0..2].map{|m|balance_month(m)}
    @expence_last_year = 
      [{ name: "expence", data: [*0..11].reverse.map{|n|[DateTime.now.months_ago(n).month, balance_month(n)[true]]}},
       { name: "income",  data: [*0..11].reverse.map{|n|[DateTime.now.months_ago(n).month, balance_month(n)[false]]}}]
  end

  private

    def categories_month(ago, is_expence)
      Log.joins(sub_category: :category)
        .where(logged_at: DateTime.now.months_ago(ago).beginning_of_month .. DateTime.now.months_ago(ago).end_of_month)
        .where(logs: {is_expence: is_expence})
        .group('categories.name')
        .order('categories.name')
        .sum(:ammount)
    end

    def category_month(category_id, ago, is_expence)
      [
        DateTime.now.months_ago(ago).month,
        Log.joins(sub_category: :category)
          .where(logged_at: DateTime.now.months_ago(ago).beginning_of_month .. DateTime.now.months_ago(ago).end_of_month)
          .where(categories: {id: category_id})
          .where(logs: {is_expence: is_expence})
          .sum(:ammount)
      ]
    end

    def balance_month(ago)
      Log
      .where(logged_at: DateTime.now.months_ago(ago).beginning_of_month .. DateTime.now.months_ago(ago).end_of_month)
      .group(:is_expence)
      .order(:is_expence)
      .sum(:ammount)
    end
end
