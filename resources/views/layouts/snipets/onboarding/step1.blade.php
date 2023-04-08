<div x-show="step === 1" class="font-semibold flex flex-col justify-between pt-5">

    @include('layouts.snipets.onboarding.heading', ['slot' => 'Cooking ability'])

    <div class="text-secondary-brown text-sm text-center">
        How good are you at cooking?
    </div>

    <div class="mt-10">
        <div class="w-full border border-primary-border bg-gray-50 rounded-xl py-5 flex"
             :class="selections[1] === 0 ? 'border-secondary bg-secondary bg-opacity-25' : ''"
             @click="selections[1] = 0; errors[step] = 0">
            <div>
                <img src="{{ asset('images/onboarding/step1/beginner.png') }}"/>
            </div>

            Beginner
        </div>

        <div class="w-full border border-primary-border bg-gray-50 mt-5 rounded-xl flex py-5"
             :class="selections[1] === 1 ? 'border-secondary bg-secondary bg-opacity-25' : ''"
             @click="selections[1] = 1; errors[step] = 0">
            <div>
                <img src="{{ asset('images/onboarding/step1/intermediate.png.png') }}"/>
            </div>

            Intermediate
        </div>

        <div class="w-full border border-primary-border bg-gray-50 mt-5 rounded-xl flex py-5"
             :class="selections[1] === 2 ? 'border-secondary bg-secondary bg-opacity-25' : ''"
             @click="selections[1] = 2; errors[step] = 0">
            <div>
                <img src="{{ asset('images/onboarding/step1/advanced.png.png') }}"/>
            </div>

            Advanced
        </div>
    </div>
</div>
