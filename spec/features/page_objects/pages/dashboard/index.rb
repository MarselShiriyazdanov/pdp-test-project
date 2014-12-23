module Dashboard
  class Index < SitePrism::Page
    set_url '/'

    section :top_bar, TopBar, '.top-bar'

    element :article, '.article'
  end
end
