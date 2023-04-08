<label class="{{ $attributes->get('label-class') }}">
    <input
        name="{{ $attributes->get('name') }}"
        type="{{ $attributes->get('type') }}"
        class="hidden btn-checkbox"
        value="{{ $attributes->get('value') }}"
        wire:model.lazy="{{ $attributes->get('name') }}"
    >
    <div class="w-full bg-white rounded-lg text-black py-3 px-1 text-md font-semibold flex justify-center text-center items-center cursor-pointer border border-blue-100 {{ $attributes->get('class') }}">
        {{ $slot }}
    </div>
</label>
