Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.


rails g model characters name max_health:integer current_health:integer max_mana:integer current_mana:integer

rails g model maps level completed:boolean character:references

rails g model monsters name category map:references

rails g model questions language type monster:references

rails g model answers correct:boolean question:references

rails g model character_answers time:integer answer:references question:references character:references

rails g migration add_first_name_last_name_username_to_users first_name last_name username
