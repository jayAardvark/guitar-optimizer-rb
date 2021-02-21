# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


instruments = Instrument.create([
  { 
    name: "Bassman Amp",
    instrument_notes: "1965 Blackface"
  }, 
  { 
    name: "Fender Strat",
    instrument_notes: "Re-issue model"
  }
 ])

repairs = Repair.create([
  {
    repair_description: "Filter caps were replaced.",
    date: "1/11/2021",
    instrument: instruments.first
  },
  {
    repair_description: 'Tubes were replaced',
    date: "4/17/1995",
    instrument: instruments.first
  }
]) 