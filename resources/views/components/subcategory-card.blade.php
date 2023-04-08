<label class="{{ $attributes->get('label-class') }}">
    <input
        name="{{ $attributes->get('name') }}"
        type="{{ $attributes->get('type') }}"
        class="hidden btn-checkbox"
        value="{{ $attributes->get('value') }}"
        wire:model.lazy="{{ $attributes->get('name') }}"
    >
    <div class="w-full bg-white rounded-lg text-black py-2 px-1 text-md font-semibold cursor-pointer {{ $attributes->get('class') }}">
        {{ $slot }}
    </div>
</label>
