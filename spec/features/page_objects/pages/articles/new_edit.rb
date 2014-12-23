module Articles
  class New < SitePrism::Page
    include Formulaic::Dsl

    set_url '/articles/new'

    element :title_input, '.row.title'
    element :text_input, '.row.text'
    element :submit, '.row input.button'

    def submit_form(title = '', text = '')
      fill_form(
        :article,
        title: title,
        text: text
      )

      submit.click
    end
  end

  class Edit < New
    set_url '/articles{/id}/edit'
  end
end
