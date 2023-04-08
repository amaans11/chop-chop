<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" class="w-full h-full">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="facebook-domain-verification" content="v8wio35mk5oqr9718qj23e9qszu39q" />

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Barlow:wght@100;200;300;400;500;600;700;800;900&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <link href="{{ asset('fontawesome/css/all.min.css') }}" rel="stylesheet">

    <!-- Styles -->
    <link rel="stylesheet" href="{{ mix('css/app.css') }}">

    <!-- Scripts -->
    <script src="{{ mix('js/app.js') }}" defer></script>

    @include('layouts.snipets.pwa')
    @include('layouts.snipets.stats')

    @livewireStyles
    @laravelPWA
</head>

<body class="flex flex-col w-full h-full antialiased bg-background font-heading">
    <div class="flex-1 relative w-full max-w-2xl mx-auto mt-16 h-full overflow-auto">
        {{ $slot }}
    </div>

    @stack('modals')
    @stack('script')

    @livewireScripts
</body>

</html>
