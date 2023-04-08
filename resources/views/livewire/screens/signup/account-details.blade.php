<form wire:submit.prevent="submit" class="flex flex-col justify-between h-body">
    <div>
        <x-progress-bar value="{{ (4 / 4) * 100 }}" />

        <h1 class="text-primary-dark font-semibold text-xl my-7">Great! Let’s setup your account</h1>

        <p class="text-primary-dark font-heading font-semibold text-sm mb-4">Email</p>
        <div class="mb-5">
            <x-input type="email" class="w-full" placeholder="Insert your email" wire:model.defer="email" />
            @error('email') <p class="text-red-600 mt-2">{{ $message }}</p> @enderror
        </div>

        <p class="text-primary-dark font-heading font-semibold text-sm mb-4">Password</p>
        <div class="mb-5">
            <x-input type="password" class="w-full" placeholder="Insert your password"
                wire:model.defer="password" />
            @error('password') <p class="text-red-600 mt-2">{{ $message }}</p> @enderror
        </div>

        <x-button type="submit" class="bg-secondary text-white my-4 w-full">
            Create an account
            <i class="fas fa-arrow-right ml-3"></i>
        </x-button>

        <p class="text-sm text-center text-gray-500 mt-10">
            By creating an account, you agree to our
            <br>
            <strong class="text-black">Term and Conditions</strong>
        </p>
    </div>
</form>
