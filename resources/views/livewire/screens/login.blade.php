<div class="flex flex-col min-h-screen">
    <div class="h-full px-4 w-full max-w-md mx-auto mt-10">
        <form wire:submit.prevent="submit">
            <h1 class="text-2xl font-medium mb-5 text-primary uppercase">Welcome Back</h1>

            <div class="mt-10 mb-6 font-semibold">Email</div>

            <div class="mb-6">
                <x-input
                    type="email"
                    class="w-full"
                    placeholder="{{ __('common.email') }}"
                    wire:model.defer="email"
                    dusk="email"
                />
                @error('email') <p class="text-red-600 mt-2">{{ $message }}</p> @enderror
            </div>

            <div class="mb-6 font-semibold">Password</div>

            <div class="mb-6">
                <x-input
                    type="password"
                    class="w-full"
                    placeholder="{{ __('common.password') }}"
                    wire:model.defer="password"
                    dusk="password"
                />
                @error('password') <p class="text-red-600 mt-2">{{ $message }}</p> @enderror
            </div>

            <x-button
                type="submit"
                class="text-white bg-secondary w-full relative mt-2"
                wire:loading.attr="disabled"
                dusk="submit"
            >
                Login
            </x-button>

            <div class="text-center mt-5">
                <a class="underline" href="{{ route('onboarding') }}">Don’t have an account? Sign Up</a>
            </div>

            <div class="text-gray-400 mt-10 text-center ">
                By creating an account, you agree to our <br><br>
                <a class="text-black font-semibold" href="https://www.myfoodandfamily.com/useragreement" target="_blank">Term of use</a>
                and
                <a class="text-black font-semibold" href="https://www.myfoodandfamily.com/privacynotice" target="_blank">Privacy Policy</a>
            </div>
        </form>
    </div>

    <x-analytics-tracker page="login" />
</div>
