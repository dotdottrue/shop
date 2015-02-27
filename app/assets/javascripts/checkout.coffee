$ ->
  toggle_shipping_address = (checkbox) ->
    if !checkbox.is(':checked')
      $('.right_box').fadeIn()
    else
      $('.right_box').hide()

  $("input[name='cart[optional_invoice_address]']").on 'change', ->
    toggle_shipping_address $(this)

  toggle_shipping_address $("input[name='cart[optional_invoice_address]']")