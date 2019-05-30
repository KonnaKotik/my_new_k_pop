<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<#--  <link rel="stylesheet" href="background.css">-->

    <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>

    <script>
        function sendMerchId(merchId) {
            $.ajax({
                type: 'post',
                url: '/basket?merchId=' + merchId,
                data: {
                    merchId: merchId
                }
            }).done(function (data) {
                location.reload();

            })

        }
    </script>

    <title>Bucket</title>
</head>


<body style="background: #ffffff">
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
    <br><br>
    <div class="row">
        <div class="col-8">
           <#list products as products, count>
           <div class="row">
               <div class="col-3">
                   <a> <img src = "${products.img}" width="160"/></a>
               </div>
               <div class="col-4">
                   <p>
                   <h3> ${products.name}</h3>
                   </p>
                   <h5> ${products.price} рублей</h5>
                   <p>
                   <h5>count: ${count} </h5>
                   </p>
               </div>
               <div class="col-1">
                   <input type="image" id = "merchId" name="merchId" onclick="sendMerchId(${products.id})"
                           src="https://rm-upload.s3.amazonaws.com/512a/811ccc/Picture/473ddcd22bc48af204255b76462bdf36.png"
                           height="25px"/>
               </div>
           </div>
          <hr>
           </#list>

        </div>
        <div class="col-4">
            <a> <img src="https://pp.userapi.com/c845420/v845420081/1548d8/EHBCj5yVYIg.jpg"></a>
        </div>
    </div>
</div>

<!-- Optional JavaScript &ndash;&gt;
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>