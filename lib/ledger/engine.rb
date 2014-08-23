module Ledger
  class Engine < ::Rails::Engine
    isolate_namespace Ledger
    config.active_record.observers = 'Ledger::EntryObserver'
  end
end
