<form wire:submit.prevent="submit" class="flex flex-col justify-between h-body pb-4">
    <div>
        <x-progress-bar value="{{ 2/4 * 100 }}" />

        <h1 class="text-primary-dark font-semibold text-xl my-7">Cooking frequency</h1>

        <p class="text-primary-dark font-heading font-semibold text-sm mb-4">How often do you cook?</p>
        <div class="grid grid-cols-2 gap-2">
            @foreach($options as $value => $text)
                <x-checkbox-card
                    name="cookingFrequency"
                    type="radio"
                    value="{{ $value }}"
                    label-class="{{ $value === '5_more_times_week' ? 'col-span-2' : ''}}"
                >
                    {{ $text }}
                </x-checkbox-card>
            @endforeach
        </div>
        @error('cookingFrequency') <p class="text-red-600 mt-2">{{ $message }}</p> @enderror
    </div>

    <div class="mt-4 grid grid-cols-2 gap-4">
        <x-button
            as="a"
            href="{{ route('signup.aboutMe') }}"
            class="border-2 border-gray-300 text-primary-dark"
        >
            <i class="fas fa-arrow-left mr-3"></i>
            Back
        </x-button>
        <x-button
            type="submit"
            class="bg-secondary text-white"
        >
            Next
            <i class="fas fa-arrow-right ml-3"></i>
        </x-button>
    </div>
</form>
