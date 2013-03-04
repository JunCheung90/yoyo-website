pages = [0, 850, 1600,2240, 2930, 3570]
page_times = [3000, 1500, 2500, 4000, 1500, 1500]
scrollfunc = ->
  tid = Meteor.setInterval ->
      if $(window).scrollTop() in pages
        Meteor.clearInterval(tid)
        pages.shift()
        timeout = page_times.shift()
        Meteor.setTimeout scrollfunc, timeout
        #if pages? then Meteor.setTimeout scrollfunc, timeout
      else if pages.length > 0
        console.log $(window).scrollTop()
        window.scrollBy(0,2)
    ,1

Meteor.setTimeout scrollfunc,3000

Template.page_1.rendered = ->
  $(window).load ->
    h = $('#friends').height()
    w = $('#friends').width()
    $('#friends').css('height', h*0.1)
    $('#friends').css('width', w*0.1)
    $('#friends').css('opacity', 1)
    $('#friends').addClass('friend-scale')

Template.page_2.rendered = ->
  flag = 1
  $(window).scroll ->
    if 850 <= $(window).scrollTop() <= 860 and flag
      flag = 0
      $('#nameCard').fadeIn(1000)

Template.page_3.rendered = ->
  flag = 1
  $(window).scroll ->
    if 1600 <= $(window).scrollTop() <= 1610 and flag
      flag = 0
      $('#rabbitHead').addClass('rabbitHead-turnaround')
      setTimeout "$('#rabbitHead').toggleClass('rabbitHead-shake')", 1500

Template.page_4.rendered = ->
  flag = 1
  $(window).scroll ->
    if 2240 <= $(window).scrollTop() <= 2250 and flag
      flag = 0
      for i in [1..6]
        setTimeout "$('#girlfriend').toggleClass('girlfriend-scale')", i*550
      setTimeout "$('#type_01').fadeIn()",2000
    else
      $('#type_01').fadeOut()

Template.page_5.rendered = ->
  flag = 1
  $(window).scroll ->
    if 2930 <= $(window).scrollTop() < 2940 and flag
      flag = 0
      $('#type_02').fadeIn('slow')
      setTimeout("$('#type_02').fadeOut(1000)",1500)

Template.page_6.rendered = ->
  flag = 1
  $(window).scroll ->
    if 3570 <= $(window).scrollTop() <= 3580 and flag
      flag = 0
      $('#weibo').show('scale',500)


Template.helpcenter.created = ->
  Template.helpcenter.frequestions = ->
    ret = _.map page_text.helpcenter.frequestion.questions, (v,k)->
                values =
                  id:'freqQuestion-ans' + k
                  value: v
                  ans:page_text.helpcenter.frequestion.ans[k]

  Template.helpcenter.using_methods = ->
    ret = _.map page_text.helpcenter.using_methods.titles, (v,k)->
        values =
          id: 'basic-use-method-ans' + k
          value: v
          ans:page_text.helpcenter.using_methods.methods[k]

page_text =
  helpcenter:
    frequestion:
      questions: [
        '更换手机之后，我还可以继续使用上一部手机上的账号资料吗？'
        '同一个账号可以在多个终端或手机上使用吗？'
        '若我绑定的邮箱地址有误，该怎么办？'
        '我购买的贴图或代币发生问题了，该怎么办？'
      ]
      ans: [
        'something'
        'something'
        'something'
        'something'
        ]
    using_methods:
      titles:[
        '用户注册'
        '账号管理'
        '关于聊天'
        '好友管理'
        '业务合作'
      ]
      methods: [
        'something'
        'something'
        'something'
        'something'
        'something'
      ]




