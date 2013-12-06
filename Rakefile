desc "run server"
task :default do
  sh "rackup"
end

desc "run server with bundle exec"
task :bunxec do
  sh "bundle exec ruby main.rb"
end

desc "install dependencies"
task :install do
  sh "bundle install"
end

# Las hojas de estilo asociadas se generan automáticamente
# Este comando las genera manualmente 
desc "build css"
task :css do
  sh "sass views/styles.scss public/css/style.css"
end
