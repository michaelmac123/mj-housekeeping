activate :directory_indexes

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout

%w[about rates-services FAQ policies-terms join-our-team get-quote].each do |page|
  page '/#{page}.html', layout: 'layout'
end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do
  def inline_svg(path, opts={})
    file = File.open("source/images/svg/#{path}.svg", "r")
    klass = opts[:class] ||= ""
    klass << " #{path}"
    svg = file.read
    svg = content_tag :span, svg, class: klass, title: opts[:title] || ""
  end
end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end
