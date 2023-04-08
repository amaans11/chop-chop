<div x-show="step === 2" class="font-semibold flex flex-col justify-between pt-5">

    @include('layouts.snipets.onboarding.heading', ['slot' => 'How good are you at cooking?'])

    <div class="text-secondary-brown text-sm text-center">
        Let's find out whats your cooking skills are
    </div>

    <div class="mt-10">
        <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5"
             :class="selections[2] === 0 ? 'border-secondary bg-secondary bg-opacity-25' : ''"
             @click="selections[2] = 0; errors[step] = 0">
            Beginner
        </div>

        <div class="w-full border border-primary-border bg-gray-50 mt-5 rounded-xl text-center py-5"
             :class="selections[2] === 1 ? 'border-secondary bg-secondary bg-opacity-25' : ''"
             @click="selections[2] = 1; errors[step] = 0">
            Intermediate
        </div>

        <div class="w-full border border-primary-border bg-gray-50 mt-5 rounded-xl text-center py-5"
             :class="selections[2] === 2 ? 'border-secondary bg-secondary bg-opacity-25' : ''"
             @click="selections[2] = 2; errors[step] = 0">
            Advanced
        </div>
    </div>
</div>
