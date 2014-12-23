module Articles
  class Show < SitePrism::Page
    set_url '/articles{/id}'

    element :article_header, 'h1'
    element :article_text, '.row.text'
  end
end
