# Mercury dependencies and core libary.
#
#= require mercury/dependencies
#= require mercury/mercury
#
# All region types.
#
#= require mercury/regions
#
# All locales.
#
#= require mercury/locales
#
# Configuration.
#
#= require mercury/config
jQuery ->
  # when using rails we need to setup the csrf token
  $.ajaxSetup headers: {'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')}
  window.mercury = Mercury.init(frame: '#mercury_frame')


# example of extending regions to add actions for buttons or other functionality.
Mercury.Region.Markdown.addAction 'direction', ->
  return alert("This region doesn't allow switching text direction") unless @allowDirection
  @direction = if @direction == 'rtl' then 'ltr' else 'rtl'
  @el.css(direction: @direction)
