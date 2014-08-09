Rails.application.routes.draw do

  mount Ledger::Engine => "/ledger"
end
