<select
    {{ $attributes->merge(['class' => 'rounded-lg w-full outline-none p-4 font-bold bg-white border border-blue-100 text-sm']) }}
>
    {{ $slot }}
</select>
