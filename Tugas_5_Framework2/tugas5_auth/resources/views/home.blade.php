<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <style>
        body { font-family: sans-serif; margin: 40px; }
        .btn-logout { background-color: #0d6efd; color: white; padding: 8px 20px; border: none; border-radius: 4px; text-decoration: none; font-size: 14px; display: inline-block; margin-top: 10px; }
    </style>
</head>
<body>
    <h2>Selamat datang, {{ Auth::user()->name }}</h2>
    <a href="/logout" class="btn-logout">Logout</a>
</body>
</html>