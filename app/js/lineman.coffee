$ ->
  sidebar = new Sidebar({ body : '.container'}).init()

  $('nav').find('a[href^=#]').on 'click', (e) ->
    e.preventDefault()
    $('html, .container').animate({
        scrollTop: $($(e.target).attr('href')).offset().top
    }, 500);
    sidebar.close()

  $('#header').headroom({
        tolerance: 10,
        offset : 0,
        classes: {
          initial: "animated",
          pinned: "slideInDown",
          unpinned: "slideOutUp"
        },
        onUnpin : () -> console.log(this)
    })