module Comments
  class New < SitePrism::Page
    include Formulaic::Dsl

    set_url '/articles{/id}/comments/new'

    element :text_input, '.row.text'
    element :submit, '.row input.button'

    def submit_form(text)
      fill_form(
        :comment,
        text: text
      )

      submit.click
    end
  end
end
