module Articles
  class Show < SitePrism::Page
    include Formulaic::Dsl

    set_url '/articles{/id}'

    element :article_header, 'h1'
    element :article_text, '.row.text'

    element :text_input, '.add_comment.row.text'
    element :submit, '.row input.button'
    element :comment_notice, '.alert-box.notice'
    element :validation_error_alert, '.row.error'

    def submit_form(text)
      fill_form(
        :comment,
        text: text
      )

      submit.click
    end
  end
end
