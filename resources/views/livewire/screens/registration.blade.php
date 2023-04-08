<div class="flex flex-col min-h-screen">

    <div class="h-full px-4 w-full max-w-md mx-auto">
        <form wire:submit.prevent="submit">
            <h1 class="text-center text-3xl font-medium mb-5 text-primary uppercase">
                Create a new account
            </h1>

            <div class="mb-6">
                <x-input
                    type="text"
                    class="w-full"
                    placeholder="{{ __('common.name') }}"
                    wire:model.defer="name"
                />
                @error('name') <p class="text-red-600 mt-2">{{ $message }}</p> @enderror
            </div>

            <div class="mb-6">
                <x-input
                    type="email"
                    class="w-full"
                    placeholder="{{ __('common.email') }}"
                    wire:model.defer="email"
                />
                @error('email') <p class="text-red-600 mt-2">{{ $message }}</p> @enderror
            </div>

            <div class="mb-6">
                <x-input
                    type="password"
                    class="w-full"
                    placeholder="{{ __('common.password') }}"
                    wire:model.defer="password"
                />
                @error('password') <p class="text-red-600 mt-2">{{ $message }}</p> @enderror
            </div>

            <x-button
                type="submit"
                class="text-white bg-primary w-full mt-2"
                wire:loading.attr="disabled"
            >
                Create an account
            </x-button>
        </form>
        <div class="text-sm text-center mt-5 text-gray-600">
            Have an account? <a class="font-bold text-black">Login</a>
        </div>
        <div class="text-sm text-center mt-5">
            <div class="text-gray-400 mb-2">
                By creating an account, you agree to our
            </div>
            <a class="font-bold">
                Term and Conditions
            </a>
        </div>
    </div>

    <x-analytics-tracker page="registration"/>
</div>
