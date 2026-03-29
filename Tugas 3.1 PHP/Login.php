<!-- Najwa Humairah -->
<!-- 2311102134 -->

<?php
session_start();
$message = '';

if (isset($_POST['login'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    if (isset($_SESSION['users'][$username]) && $_SESSION['users'][$username] === $password) {
        $message = "welcome " . htmlspecialchars($username);
    } else {
        $message = "wrong username/password";
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body { font-family: sans-serif; color: #333; }
        .container { width: 350px; margin: 40px; }
        h2 { font-weight: normal; margin-bottom: 20px; text-align: center;}
        .form-group { margin-bottom: 15px; display: flex; align-items: center; }
        .form-group label { width: 100px; font-size: 14px; color: #555; }
        .form-group input { flex: 1; padding: 8px; border: 1px solid #ccc; border-radius: 4px; }
        .actions { margin-left: 100px; margin-top: 10px; display: flex; align-items: center; gap: 15px;}
        .btn { background-color: #28a745; color: white; border: none; padding: 8px 16px; border-radius: 4px; cursor: pointer; font-size: 14px; }
        .btn:hover { background-color: #218838; }
        .link { color: #007bff; text-decoration: none; font-size: 14px;}
        .link:hover { text-decoration: underline; }
        .message { margin-left: 100px; margin-top: 20px; font-size: 14px; color: #333;}
    </style>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form method="POST" action="">
            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" required>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" required>
            </div>
            <div class="actions">
                <button type="submit" name="login" class="btn">Login</button>
                <a href="register.php" class="link">Register</a>
            </div>
        </form>
        <?php if ($message): ?>
            <div class="message"><?php echo $message; ?></div>
        <?php endif; ?>
    </div>
</body>
</html>