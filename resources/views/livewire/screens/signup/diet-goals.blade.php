<form wire:submit.prevent="submit" class="flex flex-col justify-between h-body pb-4 overflow-y-auto">
    <div>
        <x-progress-bar value="{{ 3/4 * 100 }}" />

        <h1 class="text-primary-dark font-semibold text-xl my-7">About your diet</h1>

        <p class="text-primary-dark font-heading font-semibold text-sm mb-4">Do you have any diet goals?</p>
        <div class="mb-7">
            <div class="grid grid-cols-2 gap-2">
                @foreach($dietGoalOptions as $value => $text)
                    <x-checkbox-card
                        name="dietGoals"
                        type="checkbox"
                        value="{{ $value }}"
                        label-class="{{ $value === 'other' ? 'col-span-2' : ''}}"
                    >
                        {{ $text }}
                    </x-checkbox-card>
                @endforeach
            </div>
            @error('dietGoals') <p class="text-red-600 mt-2">{{ $message }}</p> @enderror
        </div>

        <p class="text-primary-dark font-heading font-semibold text-sm mb-4">Do you have any diet restrictions?</p>
        <div class="flex mb-5 flex-shrink-0">
            <label class="flex items-center text-gray-700 mr-8">
                <input
                    name="haveRestrictions"
                    type="radio"
                    class="h-4 w-4 text-secondary border-gray-300 rounded mr-2"
                    wire:model="haveRestrictions"
                    value="true"
                />
                Yes
            </label>
            <label class="flex items-center text-gray-700">
                <input
                    name="haveRestrictions"
                    type="radio"
                    class="h-4 w-4 text-secondary border-gray-300 rounded mr-2"
                    wire:model="haveRestrictions"
                    value="false"
                />
                Not any specific
            </label>
        </div>

        @if($haveRestrictions === 'true')
            <p class="text-base text-gray-500 font-medium mb-5 flex-shrink-0">Choose from the following dietary restrictions</p>

            <div class="flex flex-row flex-wrap overflow-y-auto">
                @foreach($restrictionOptions as $value => $text)
                    <x-checkbox-card
                        name="restrictions"
                        type="checkbox"
                        value="{{ $value }}"
                        label-class="mr-3 mb-3"
                        class="flex flex-col justify-center items-center text-center py-2 px-5"
                    >
                        {{ $text }}
                    </x-checkbox-card>
                @endforeach
            </div>
            @error('restrictions') <p class="text-red-600 mt-2">{{ $message }}</p> @enderror
        @endif
    </div>

    <div class="mt-4 grid grid-cols-2 gap-4">
        <x-button
            as="a"
            href="{{ route('signup.cookingFrequency') }}"
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
