<%--
  Created by IntelliJ IDEA.
  User: Arianna
  Date: 29.01.2018
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <style>
        body {
            background: #1ab5eb;
        }

        .main-wrapper {
            padding: 100px 10px 10px;
            width: 100%;
            height: 700px;
            top: 0;
            left: 0;
            margin: auto;
            background: url('http://miriadna.com/desctopwalls/images/max/Green-blur.jpg');
            transition: all .2s;
            box-shadow: 0 0 20px #aaa;
        }

        a:not([href="http://creatorvisions.com"]) {
            width: 200px;
            height: 50px;
            line-height: 50px;
            display: block;
            text-align: center;
            margin: 10px auto 30px;
            text-decoration: none;
            position: relative;
            box-shadow: 0 10px 10px -10px #000;
        }

        a span.s1 {
            position: absolute;
            color: #fff;
            font-weight: bolder;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            background: #1ab5eb;
            transform-origin: left;
            transform: rotateY(0deg) translateX(0);
            transition: all .3s;
            z-index: 2;
        }

        a span.s2 {
            position: absolute;
            color: #fff;
            font-weight: bolder;
            bottom: 0;
            left: 0;
            height: 100%;
            width: 100%;
            background: #005fa9;
            transform-origin: right;
            transform: rotateY(90deg) translateX(102px);
            transition: all .3s;
            z-index: 1;
        }

        a:hover span.s1 {
            transform: rotateY(90deg) translateX(-102px);
            background: #005fa9;
        }

        a:hover span.s2 {
            transform: rotateY(0deg) translateX(0);
            background: #1ab5eb;
        }

        a span.s3 {
            position: absolute;
            color: #fff;
            font-weight: bolder;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            background: #1ab5eb;
            transform-origin: top;
            transform: rotateX(0deg) translateY(0);
            transition: all .3s;
            z-index: 2;
        }

        a span.s4 {
            position: absolute;
            color: #fff;
            font-weight: bolder;
            bottom: 0;
            left: 0;
            height: 100%;
            width: 100%;
            background: #005fa9;
            transform-origin: bottom;
            transform: rotateX(90deg) translateY(22px);
            transition: all .3s;
            z-index: 1;
        }

        a:hover span.s3 {
            transform: rotateX(90deg) translateY(-22px);
            background: #005fa9;
        }

        a:hover span.s4 {
            transform: rotateX(0deg) translateY(0);
            background: #1ab5eb;
        }

        .veen {
            width: 100%;
            height: 100%;
            position: fixed;
            background-color: rgba(0, 0, 0, .4);
            z-index: 999;
            top: -100%;
            left: 0;
        }

        .veen .tada {
            text-align: center;
            position: absolute;
            top: 0;
            left: -200%;
            right: 0%;
            bottom: 0;
            margin: auto;
            height: 330px;
            width: 25%;
            background-image: url(http://ih0.redbubble.net/image.54684910.9510/flat,1000x1000,075,f.jpg);
            transition: all .5s;
            box-shadow: 0 0px 25px -10px #000;
        }

        .veen .tada:before, .veen .tada:after {
            content: '';
            z-index: -1;
            position: absolute;
            height: 5%;
            width: 20%;
            bottom: 20px;
            left: 6px;
            box-shadow: 0 22px 15px 0 #000;
            transform: rotate(-5deg);
            background: #777;
        }

        .veen .tada:after {
            left: auto;
            right: 6px;
            transform: rotate(5deg);
        }

        .veen a.close-x {
            position: absolute;
            margin: 0;
            right: -10px;
            top: -10px;
            height: 40px;
            line-height: 40px;
            display: block;
            font-weight: bolder;
            text-align: center;
            text-decoration: none;
            background: linear-gradient(#ccc, #fff);
            width: 40px;
            border-radius: 50%;
        }

        .veen a.close-x:hover {
            text-decoration: none;
            background: linear-gradient(#fff, #ccc);
        }

        .veen a.log {
            display: inline-block;
            width: 100px;
            height: 40px;
            line-height: 40px;
            display: block;
            color: #fff;
            font-weight: bolder;
            text-align: center;
            margin: 10px auto;
            text-decoration: none;
            background: #1ab5eb;
        }

        .veen p.head {
            text-align: center;
            font-size: 25px;
            text-transform: uppercase;
            color: #fff;
            background: #1ab5eb;
            height: 50px;
            line-height: 50px;
        }

        .veen .tada .uid, .veen .tada .pwd {
            height: 60px;
            position: relative;
        }

        .veen .tada .uid input, .veen .tada .pwd input {
            display: block;
            width: 80%;
            height: 40px;
            margin: auto;
            position: relative;
            z-index: 2;
            border: none;
            background: transparent;
            border-bottom: solid 2px #1ab5eb;
            padding: 5px 90px 5px 10px;
        }

        .veen .tada input:focus {
            outline: none;
        }

        .veen .tada label {
            z-index: 1;
            display: block;
            text-align: left;
            width: 80%;
            margin: auto;
            font-weight: bold;
            position: absolute;
            left: 20px;
            margin: auto;
            right: 0;
            margin-top: 11px;
            transition: all .1s;
            color: #1ab5eb;
            opacity: .5;
        }

        .veen .tada .remw {
            display: flex;
            margin-top: 20px;
            justify-content: space-around;
            width: 60%;
            margin: auto;
        }

        .veen .tada p.rem {
            margin: 10px;
            height: 35px;
            line-height: 35px;
        }

        .veen .dum {
            margin: 10px;
            display: inline-block;
            position: relative;
            width: 80px;
            border-radius: 50px;
            height: 35px;
            box-shadow: inset 0px 1px 3px rgba(0, 0, 0, 0.5);
        }

        .veen .tada .dum input {
            display: inline-block;
            width: 80px;
            height: 26px;
            background: #333;
            position: relative;
            border-radius: 50px;
            box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0.5), 0px 1px 0px rgba(255, 255, 255, 0.2);
        }

        .veen .tada .dum:after {
            content: 'NO';
            color: #ff0c0c;
            position: absolute;
            right: 10px;
            top: 5px;
            bottom: 0;
            margin: auto;
            z-index: 0;
            font: 12px/26px Arial, sans-serif;
            font-weight: bold;
            text-shadow: 1px 1px 0px rgba(255, 255, 255, .15);
        }

        .veen .tada .dum:before {
            content: 'YES';
            color: #1ec303;
            position: absolute;
            left: 10px;
            top: 5px;
            bottom: 0;
            margin: auto;
            z-index: 0;
            font: 12px/26px Arial, sans-serif;
            font-weight: bold;
        }

        .veen .tada .dum label {
            display: block;
            width: 38px;
            height: 25px;
            cursor: pointer;
            position: absolute;
            top: 5px;
            left: 5px;
            z-index: 1;
            background: linear-gradient(#ddd, 50%, #fff);
            border-radius: 50px;
            transition: all 0.4s ease;
            box-shadow: 0px 5px 10px -6px #000;
            margin: 0;
            opacity: 1;
        }

        .veen .tada .dum input[type="checkbox"] {
            display: none;
        }

        .veen .tada .dum input[type="checkbox"]:checked + label {
            left: 38px;
        }

        .veen-2 {
            width: 100%;
            height: 100%;
            position: fixed;
            background-color: rgba(26, 181, 235, .4);
            z-index: 999;
            top: -100%;
            left: 0;
        }

        .veen-2 .tada {
            text-align: center;
            position: absolute;
            top: 0;
            left: -200%;
            right: 0%;
            bottom: 0;
            margin: auto;
            height: 450px;
            width: 25%;
            background-image: url(http://ih0.redbubble.net/image.54684910.9510/flat,1000x1000,075,f.jpg);
            transition: all .5s;
            box-shadow: 0 0px 25px -10px #000;
        }

        .veen-2 .tada:before, .veen .tada:after {
            content: '';
            z-index: -1;
            position: absolute;
            height: 5%;
            width: 20%;
            bottom: 20px;
            left: 6px;
            box-shadow: 0 22px 15px 0 #000;
            transform: rotate(-5deg);
            background: #777;
        }

        .veen-2 .tada:after {
            left: auto;
            right: 6px;
            transform: rotate(5deg);
        }

        .veen-2 a.close-x-2 {
            position: absolute;
            margin: 0;
            right: -10px;
            top: -10px;
            height: 40px;
            line-height: 40px;
            display: block;
            font-weight: bolder;
            text-align: center;
            text-decoration: none;
            background: linear-gradient(#ccc, #fff);
            width: 40px;
            border-radius: 50%;
        }

        .veen-2 a.log {
            display: inline-block;
            width: 100px;
            height: 40px;
            line-height: 40px;
            display: block;
            color: #fff;
            font-weight: bolder;
            text-align: center;
            margin: 10px auto;
            text-decoration: none;
            background: #1ab5eb;
        }

        .veen-2 p.head {
            text-align: center;
            font-size: 25px;
            text-transform: uppercase;
            color: #fff;
            background: #1ab5eb;
            height: 50px;
            line-height: 50px;
        }

        .veen-2 .tada .uid, .veen-2 .tada .mail, .veen-2 .tada .name, .veen-2 .tada .pwd {
            height: 50px;
        }

        .veen-2 .tada .uid input, .veen-2 .tada .pwd input, .veen-2 .tada .name input, .veen-2 .tada .mail input {
            display: block;
            width: 80%;
            height: 40px;
            margin: auto;
            position: relative;
            z-index: 2;
            border: none;
            background: transparent;
            border-bottom: solid 2px #1ab5eb;
            padding: 5px 90px 5px 10px;
        }

        .veen-2 .tada input:focus {
            outline: none;
        }

        .veen-2 .tada label {
            z-index: 1;
            display: block;
            text-align: left;
            width: 80%;
            margin: auto;
            font-weight: bold;
            opacity: .5;
            position: absolute;
            left: 20px;
            margin: auto;
            right: 0;
            margin-top: 11px;
            transition: all .1s;
            color: #1ab5eb;
        }

        .veen-2 .tada .genw {
            width: 100%;
            margin: 20px 0;
        }

        .veen-2 .tada p.gen {
            margin: 0 10px;
            height: 35px;
            line-height: 35px;
        }

        .veen-2 .dum {
            margin: 0 10px;
            display: inline-block;
            position: relative;
            width: 80px;
            border-radius: 50px;
            height: 35px;
            box-shadow: inset 0px 1px 3px rgba(0, 0, 0, 0.5);
        }

        .veen-2 .in-1 {
            background: url(female.jpg) center no-repeat;
        }

        .veen-2 .in-2 {
            background: url(male.jpg) center no-repeat;
        }

        .veen-2 .tada .dum input {
            display: inline-block;
            width: 80px;
            height: 26px;
            background: #333;
            position: relative;
            border-radius: 50px;
            box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0.5), 0px 1px 0px rgba(255, 255, 255, 0.2);
        }

        .veen-2 .tada .dum label[for="r1"] {
            display: block;
            width: 38px;
            height: 25px;
            cursor: pointer;
            position: absolute;
            top: 5px;
            left: 5px;
            z-index: 1;
            background: linear-gradient(#ddd, 50%, #fff);
            border-radius: 50px;
            transition: all 0.4s ease;
            box-shadow: 0px 5px 10px -6px #000;
            margin: 0;
            opacity: 1;
        }

        .veen-2 .tada .dum label[for="r2"] {
            display: block;
            width: 38px;
            height: 25px;
            cursor: pointer;
            position: absolute;
            top: 5px;
            left: 5px;
            z-index: 1;
            background: linear-gradient(#ddd, 50%, #fff);
            border-radius: 50px;
            transition: all 0.4s ease;
            box-shadow: 0px 5px 10px -6px #000;
            margin: 0;
            opacity: 1;
        }

        .veen-2 .tada .dum input[type="radio"] {
            display: none;
        }

        .veen-2 .tada .dum input[type="radio"]:checked + label {
            left: 38px;
        }

        .okati {
            margin: 50px auto;
        }

        .check {
            height: 50px;
            width: 90%;
            margin: auto;
            margin-top: 20px;
            color: #ff0000;
            font-size: 18px;
            opacity: 0;
            transition: all .5s;
            text-align: center;
            background: rgba(255, 255, 255, 0.8);
        }

        .check span {
            margin: 20px;
            line-height: 50px;
        }

        .check-2 {
            opacity: 1;
        }

        .show-pass {
            display: inline-block;
            position: absolute;
            right: 0;
            font-size: 0;
            bottom: 0;
            height: 40px;
            width: 40px;
            top: 0;
            background: #0af url(http://creatorvisions.com/quick-view-w.png) center no-repeat;
            z-index: 9;
            cursor: pointer;
            box-shadow: 0 2px 6px -2px rgba(0, 0, 0, .5);
        }

        .show-pass.go {
            box-shadow: inset 0 0 6px rgba(0, 0, 0, .5);
        }

        .pwd {
            margin-right: 35px;
            margin-left: 5px;
        }

        .trans {
            font-size: 10px;
            margin-top: -4px !important;
        }
    </style>
    <style type="text/css">
        .site-link {
            padding: 5px 15px;
            position: fixed;
            z-index: 99999;
            background: #303030;
            box-shadow: 0 0 4px rgba(0, 0, 0, .14), 0 4px 8px rgba(0, 0, 0, .28);
            right: 30px;
            bottom: 30px;
            border-radius: 10px;
        }

        .site-link a {
            text-decoration: none;
            color: #0af !important;
            display: inline-block;
        }

        .site-link img {

            width: 30px;
            height: 30px;
        }
    </style>

</head>
<body>
<%--<script src="https://maps.googleapis.com/maps/api/js"></script>--%>

<div class="main-wrapper">
<a href="#" class="okati">
<span class="s3">Already a user...?</span>
<span class="s4">Sign In</span>
</a>
<a href="#" class="rendu">
<span class="s3">New User...?</span>
<span class="s4">Register</span>
</a>
</div>
<div class="veen">
    <div class="tada">
        <%if (request.getAttribute("errMessage") != null) {%>
        <div style="color: red"><%=request.getAttribute("errMessage")%>
        </div>
        <%}%>
        <p class="head">Login</p>
        <form action="/loginServlet" method="post">
            <div class="uid">
                <label>EMAIL</label><input type="email" name="email">
                </br>
            </div>
            <div class="pwd">
                <label>PASSWORD</label><input type="password" name="password">
                <span class="show-pass"></span>
            </div>

            <input class="log" type="submit" value="GET IN">

            <a href="#" class="close-x">X
            </a>
        </form>
    </div>
</div>
<div class="veen-2">
    <div class="check"><span class="p1"></span> <span class="p2"></span> <span class="p3"></span> <span
            class="p4"></span> <span class="p5"></span></div>
    <div class="tada">
        <%if (request.getAttribute("errMessage") != null) {%>
        <div style="color: red"><%=request.getAttribute("errMessage")%>
        </div>
        <%}%>

        <form action="/registerServlet" method="post">
            <p class="head">register</p>
            <div class="name">
                <label>NAME</label><input type="text" name="name">
            </div>
            <div class="mail">
                <label>SURNAME</label><input type="text" name="surname">
            </div>
            <div class="uid">
                <label>EMAIL</label><input type="email" name="email">
                </br>
            </div>
            <div class="pwd">
                <label>PASSWORD</label><input type="password" name="password">
            </div>
            <div class="pwd">
                <label>Confirm PASSWORD</label><input type="password" name="rePassword">
            </div>
            <%--<div class="genw">--%>
            <%--<p class="gen">GENDER</p>--%>
            <%--<div class="dum in-1">--%>
            <%--<input type="radio" class="rad" name="gender" id="r1"><label for="r1">MALE</label>--%>
            <%--</div>--%>
            <%--<div class="dum in-2">--%>
            <%--<input type="radio" class="rad" name="gender" id="r2"><label for="r2">FEMALE</label>--%>
            <%--</div>--%>
            <%--</div>--%>
            <input class="log" type="submit" value="GET IN">
            <a href="#" class="close-x-2">X
            </a>
        </form>
    </div>
</div>


<%--<div class="site-link">--%>
<%--<a href="http://creatorvisions.com" target="_blank">--%>
<%--Creator <img src="http://creatorvisions.com/img/new-logo-2.png">--%>
<%--Visions</a>--%>
<%--</div>--%>


<script src="https://code.jquery.com/jquery-2.2.0.min.js"
        integrity="sha256-ihAoc6M/JPfrIiIeayPE9xjin4UWjsx2mjW/rtmxLM4=" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/ui/1.12.0-rc.2/jquery-ui.js"
        integrity="sha256-6HSLgn6Ao3PKc5ci8rwZfb//5QUu3ge2/Sw9KfLuvr8=" crossorigin="anonymous"></script>


<script>
    $(document).ready(function () {
        // $('.veen-2 .log').click(function() {
        //     $('.check').addClass('check-2')
        //     var name = $('.veen-2 .tada .name input').val();
        //     var mail = $('.veen-2 .tada .mail input').val();
        //     var uid = $('.veen-2 .tada .uid input').val();
        //     var pwd = $('.veen-2 .tada .pwd input').val();
        //
        //     if ((!chkname.test(name) || !chkmail.test(mail) || !chkuid.test(uid) || !chkpwd.test(pwd)) || ($('.veen-2 .in-1 input[type="radio"]').is(":not(:checked)") && $('.veen-2 .in-2 input[type="radio"]').is(":not(:checked)"))) {
        //         $('.check .p1,.check .p2,.check .p3,.check .p4,.check .p5,p').empty();
        //         if (!chkname.test(name)) {
        //             $('.check .p1').text('Enter Valid Name');
        //         }
        //         if (!chkmail.test(mail)) {
        //             $('.check .p2').text('Enter Valid Surname');
        //         }
        //         if (!chkuid.test(uid)) {
        //             $('.check .p3').text('Enter Valid User Email');
        //         }
        //         if (!chkpwd.test(pwd)) {
        //             $('.check .p4').text('Enter Password');
        //         }
        //         // if ($('.veen-2 .in-1 input[type="radio"]').is(":not(:checked)") && $('.veen-2 .in-2 input[type="radio"]').is(":not(:checked)")) {
        //         //     $('.check .p5').text('Select Gender');
        //         // }
        //     } else {
        //         $('.check .p1,.check .p2,.check .p3,.check .p4,.check .p5').empty();
        //         $('.check').html('<p style="color:#1ec303;line-height:50px;">Youe Registration Is Successful...... ! Please Wait......!</p>', 3000);
        //         $('.veen-2 .tada input').val('');
        //         $('.veen-2 .tada input').removeAttr('checked');
        //         /*setTimeout(function(){
        //         window.location.reload();
        //     }, 3000);*/
        //     }
        // });
        $('.main-wrapper').mousemove(function (e) {
            var offset = $(this).offset();
            var relativeX = e.pageX - offset.left;
            var relativeY = e.pageY - offset.top;
            var movex = (-relativeX / 5);
            var movey = (-relativeY / 5);
            $(this).css({
                'background-position-x': movex,
                'background-position-y': movey
            });
        });
        $('.tada').mousemove(function (e) {
            var offset = $(this).offset();
            var relativeX = e.pageX - offset.left;
            var relativeY = e.pageY - offset.top;
            var movex = (-relativeX / 5);
            var movey = (-relativeY / 5);
            $(this).css({
                'background-position-x': movex,
                'background-position-y': movey
            });
        });
        $('.okati').click(function () {
            $('.veen').css({
                'top': 0
            });
            $('.main-wrapper').css({
                'transform': 'scale(.9)'
            });
            $('.veen .tada').css({
                'left': 0
            });
        });

        $('.tada a.close-x').click(function () {
            $('body').find('*').removeAttr('style');
            $('.veen-2 .tada input').removeAttr('checked');
        });


        $('.rendu').click(function () {
            $('.veen-2').css({
                'top': 0
            });
            $('.main-wrapper').css({
                'transform': 'scale(.9)'
            });
            $('.veen-2 .tada').css({
                'left': 0
            });
        });
        $('.veen-2 .tada a.close-x-2').click(function () {
            $('body').find('*').removeAttr('style');
            $('.check').removeClass('check-2');
            $('.check').eampty();
            $('.veen-2 .tada input').removeAttr('checked');
        });


        $('input, textarea, select').each(function () {
            var tmpval = $(this).val();
            if (tmpval != '') {
                $(this).prev().addClass('trans');
            }
        });
        $('input, textarea, select').focus(function () {
            $(this).prev().addClass('trans');

        }).blur(function () {
            if ($(this).val() == '') {
                $(this).prev().removeClass('trans');
            }
        });

        $.fn.toggleAttr = function (attr, attr1, attr2) {
            return this.each(function () {
                var self = $(this);
                if (self.attr(attr) == attr1)
                    self.attr(attr, attr2);
                else
                    self.attr(attr, attr1);
            });
        };
        $('.show-pass').click(function () {
            $(this).toggleClass('go');
            $('.pwd input').toggleAttr('type', 'text', 'password');
        });
    });

</script>

</body>
</html>
