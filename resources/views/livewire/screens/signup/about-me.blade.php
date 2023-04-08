<form wire:submit.prevent="submit" class="flex flex-col justify-between h-body">
    <div>
        <x-progress-bar value="{{ 1/4 * 100 }}" />

        <h1 class="text-primary-dark font-semibold text-xl my-7">Tell us a little about you</h1>

        <p class="text-primary-dark font-heading font-semibold text-sm mb-4">Your Name</p>
        <div class="mb-5">
            <x-input
                 type="text"
                 class="w-full"
                 placeholder="Insert your name"
                 wire:model.defer="name"
            />
            @error('name') <p class="text-red-600 mt-2">{{ $message }}</p> @enderror
        </div>

        <p class="text-primary-dark font-heading font-semibold text-sm mb-4">How good are you at cooking?</p>
        <div class="grid grid-cols-3 gap-2">
            @foreach($options as $value => $text)
                <x-checkbox-card
                    name="cookingLevel"
                    type="radio"
                    value="{{ $value }}"
                >
                    {{ $text }}
                </x-checkbox-card>
            @endforeach
        </div>
        @error('cookingLevel') <p class="text-red-600 mt-2">{{ $message }}</p> @enderror
    </div>

    <x-button
        type="submit"
        class="bg-secondary text-white my-4"
    >
        Next
        <i class="fas fa-arrow-right ml-3"></i>
    </x-button>
</form>
