<?php
include('header.php');

?>


<html>
<script>

function loginRegister(){
    loginForm.action = "/shop/loginRegister.php";
    
}

</script>

<body>
    <form id="loginForm" onsubmit="return loginRegister ()" method="post">
        <input class="form-control mr-sm-2" type="email" name="email" id="email" placeholder="email " required>
        <input class="form-control mr-sm-2" type="password" name="password" id="password" placeholder="password" required>
        
        <button type="submit" name="action" value="Login" >Login</button>


    </form>



</body>

</html>