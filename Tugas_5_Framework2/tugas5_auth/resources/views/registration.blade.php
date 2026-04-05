<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <style>
        body { font-family: sans-serif; margin: 40px; }
        .form-group { margin-bottom: 15px; }
        label { display: inline-block; width: 100px; }
        input[type="text"], input[type="email"], input[type="password"] { padding: 8px; width: 250px; border: 1px solid #ccc; border-radius: 4px; }
        .btn { background-color: #198754; color: white; padding: 8px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; }
        .link { color: #0d6efd; text-decoration: none; margin-left: 15px; font-size: 14px; }
        .success { color: #333; font-size: 14px; margin-top: 15px; }
    </style>
</head>
<body>
    <h2>Registration</h2>
    <form action="/register" method="POST">
        @csrf
        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" value="{{ old('email') }}" required>
        </div>
        <div class="form-group">
            <label>Nama</label>
            <input type="text" name="name" value="{{ old('name') }}" required>
        </div>
        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" required>
        </div>
        <div>
            <button type="submit" class="btn">Register</button>
            <a href="/login" class="link">Sudah punya akun? Login</a>
        </div>
    </form>

    @if(session('success'))
        <div class="success">{{ session('success') }}</div>
    @endif
</body>
</html>