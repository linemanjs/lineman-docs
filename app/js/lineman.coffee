$ ->
  bigOffset = 250
  slideOutClass = 'slideOutUpBig'
  wait = false
  startScroll = 0
  newScroll = 0
  sidebar = new Sidebar({ body : '.container'}).init()

  $('nav').find('a[href^=#]').on 'click', (e) ->
    e.preventDefault()
    slug = $(e.target).attr('href')
    $('html, body').animate({
        scrollTop: $(slug).offset().top
    }, 500);
    window.location.hash = slug
    sidebar.close()
  
  # If we reload the page at other point than x,y = 0,0
  if window.scrollY > bigOffset 
    $('#header').addClass('fixed')


  $('#header').addClass('animated')

  showHeader = -> 
    $('#header').removeClass(slideOutClass)
    $('#header').addClass('slideInDown')

  hideHeader = ->
    $('#header').removeClass('slideInDown')
    $('#header').addClass(slideOutClass)

  difference = (a, b) ->
    if a > b
      a - b
    else
      b - a

  setScrollValues = ->
    startScroll = newScroll

  shouldHideBigHeader = ->
    scrollY > bigOffset && !$('#header').hasClass('fixed') && !wait
 
  shouldHideSmallHeader = ->
    $('#header').hasClass('fixed') && !$('#header').hasClass(slideOutClass) && !wait && difference(startScroll, newScroll) > 30 && scrollY != 0
  

  $(window).on 'scroll', (e) ->
    #Show header after a while
    clearTimeout $.data(this, "scrollTimer")
    $.data this, "scrollTimer", setTimeout(->
      if !wait && $('#header').hasClass('fixed') && $('#header').hasClass(slideOutClass)
        showHeader()
      return
    , 1500)

    newScroll = scrollY
    if shouldHideBigHeader() || shouldHideSmallHeader()
      hideHeader()
      setScrollValues()
      wait = true

  # Better animation for green big header
  $('#header').on 'webkitAnimationEnd oAnimationend oAnimationEnd msAnimationEnd animationend', (e) ->
    wait = false 
    if !$('#header').hasClass('fixed')
      $.when($('#header').addClass('fixed')).then -> 
        window.scrollTo(0,0) 
        $('#header').removeClass(slideOutClass) 
      slideOutClass = 'slideOutUp'



  $('#header #lineman-logo').bind 'click', (e) ->
    $('#header').removeClass('fixed')
    window.scrollTo(0,0)
    slideOutClass = 'slideOutUpBig'
    wait = false