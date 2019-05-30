<#--noinspection ALL-->
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/album.css">
    <style type="text/css">

        .jumbotron {
            margin-top: 20px;
            background-image: url("https://pm1.narvii.com/6571/ea4bbf074f69d43b0f2cb9779eb1369c6ae55da2_hq.jpg");
            background-size: cover;
            color: #ffffff;

        }
    </style>
    <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>

    <script>
        function sendMerchId(merch_id) {
            $.ajax({
                type: 'post',
                url: '/album?merch_id=' + merch_id,
                data: {
                    merch_id: merch_id
                }
            }).done(function (data) {
                console.log(data);

            })

        }
    </script>

    <title>K-pop Shop</title>
</head>
<body style="background: #faf9f0">
<div>
    <nav class="navbar navbar-expand-md navbar-light sticky-top" style="background: #f0bcaf;">
        <a href="/" class="navbar-brand ">
            <img src="http://www.kpopshop.ru/images/logos/10/energot_ql20-mg.png" width="120" height="40" alt="logo">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="container">
                <ul class="navbar-nav mr-auto ">
                    <div class="dropdown">
                        <button class="btn btn-link dropdown-toggle" type="button" data-toggle="dropdown"
                                style=" color: #f0bcaf">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <ul class="dropdown-menu text-center">
                            <h6 class="dropdown-header">Boys band</h6>
                            <li><a href="#" class="display-6" style="color: #a9abde">BTS</a></li>
                            <li><a href="#" class="display-6" style="color: #a9abde">Exo</a></li>
                            <li><a href="#" class="display-6" style="color: #a9abde">Seventeen</a></li>
                        </ul>
                    </div>
                    <li class="nav-item">
                        <a href='/album' class="nav-link">Album</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">Stuff</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">Dorama</a>
                    </li>
                    <li class="nav-item">
                        <a href='/popular' class="nav-link">Popular</a>
                    </li>
                    <li class="nav-item">
                        <a href='/basket' class="nav-link">Basket</a>
                    </li>
                </ul>
            </div>
            <form class="form-inline my-2 my-lg-0">
                <div class="btn-group mr-2" role="group" aria-label="First group">
                    <div class="nav-item">
                        <a href='/signUp' class="btn btn-outline-light my-2 my-sm-0">SignUp</a>
                    </div>
                    <div class="nav-item">
                        <a href='/signIn' class="btn btn-outline-light my-2 my-sm-0">SignIn</a>
                    </div>
                </div>
            </form>
        </div>
    </nav>
</div>


<div class="container">
    <div class="jumbotron">
        <br><br><br><br><br><br><br><br><br><br>
    </div>
    <br><br>
    <div class="row">
        <#list merches as merches>
            <div class="col-md-4">
                <div class="holder">
                    <img src=${merches.img} width="200">
                    <div class="block">
                        <h3>${merches.name} </h3>
                        <p>${merches.price} рублей</p>
                    </div>
                    <input type="image" id = "merch_id" name="merch_id" onclick="sendMerchId(${merches.id})"
                           src="https://cdn0.iconfinder.com/data/icons/shopping-extras-set-1/512/1-512.png"
                    width="50px">
                </div>
                <br><br><br><br>
            </div>
        </#list>
    </div>

</div>
<!-- Optional JavaScript &ndash;&gt;
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>