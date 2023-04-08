<{{ $attributes->get('as') ?? 'button' }}
    {{ $attributes->merge(['class' => 'no-underline inline-flex items-center justify-center text-center font-bold rounded-lg py-5 px-6 disabled:opacity-75']) }}
>
    {{ $slot }}
</{{ $attributes->get('as') ?? 'button' }}>
