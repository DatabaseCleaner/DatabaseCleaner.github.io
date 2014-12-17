activate :blog do |blog|
  blog.layout = "blog_post"
end

page "/feed.xml", layout: false

# dev mode addons
activate :livereload

# for build
activate :syntax
activate :directory_indexes

set :css_dir,    'stylesheets'
set :js_dir,     'javascripts'
set :images_dir, 'images'
set :frontmatter_extensions, %w(.html .slim)

configure :build do
  activate :minify_css
  activate :minify_javascript
end

# for deploy
activate :deploy do |deploy|
  deploy.method = :git
  deploy.build_before = true
  deploy.branch = 'master'
end
