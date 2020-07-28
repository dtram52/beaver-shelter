# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( animal_profile.css )
Rails.application.config.assets.precompile += %w( adopt_signin.css )
Rails.application.config.assets.precompile += %w( adopt_signup.css )
Rails.application.config.assets.precompile += %w( shelter_signup.css )
Rails.application.config.assets.precompile += %w( shelter_signin.css )
Rails.application.config.assets.precompile += %w( adopt_forgot_pass.css )
Rails.application.config.assets.precompile += %w( shelter_forgot_pass.css )
Rails.application.config.assets.precompile += %w( adopt_instructions.css )
Rails.application.config.assets.precompile += %w( shelter_instructions.css )
Rails.application.config.assets.precompile += %w( shelter_profile_edit.css )
Rails.application.config.assets.precompile += %w( adopt_profile_edit.css )