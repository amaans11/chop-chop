<div  x-show="step === 5" class="font-semibold flex flex-col justify-between pt-5">

    @include('layouts.snipets.onboarding.heading', ['slot' => 'What describe you best?'])

    <div class="text-secondary-brown text-sm text-center">
        Let’s craft a personalized experience for you
    </div>



    <div class="mt-10">
        <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5"
             :class="selections[5] === 0 ? 'border-secondary bg-secondary bg-opacity-25' : ''"
             @click="selections[5] = 0; errors[step] = 0">
            I’ve followed a specific diet for  +2 years
        </div>

        <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5 mt-5"
             :class="selections[5] === 1 ? 'border-secondary bg-secondary bg-opacity-25' : ''"
             @click="selections[5] = 1; errors[step] = 0">
            I’ve started a specific diet in the last 2 years
        </div>

        <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5 mt-5"
             :class="selections[5] === 2 ? 'border-secondary bg-secondary bg-opacity-25' : ''"
             @click="selections[5] = 2; errors[step] = 0">
            I’m interested in following a specific diet but haven’t started yet
        </div>

        <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5 mt-5"
             :class="selections[5] === 3 ? 'border-secondary bg-secondary bg-opacity-25' : ''"
             @click="selections[5] = 3; errors[step] = 0">
            I’m not interested in following any specific diet
        </div>
    </div>
</div>
