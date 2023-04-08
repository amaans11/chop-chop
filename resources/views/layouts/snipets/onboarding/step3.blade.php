<div x-show="step === 3" class="font-semibold flex flex-col justify-between pt-5">

    @include('layouts.snipets.onboarding.heading', ['slot' => 'Are you trying to regulate your weight?'])

    <div class="text-secondary-brown text-sm text-center">
        Let's help you in achieving your goal
    </div>

    <div class="mt-10">
        <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5"
            :class="selections[3][0] === 0 ? 'border-secondary bg-secondary bg-opacity-25' : ''"
            @click="selections[3] = [0,'']; errors[step] = 0;">
            Not really
        </div>

        <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5 mt-5"
            :class="selections[3][0] === 1 ? 'border-secondary bg-secondary bg-opacity-25' : ''"
            @click="selections[3] = [1,'']; errors[step] = 1; scrollToBottom()">
            Loose weight
        </div>

        <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5 mt-5"
            :class="selections[3][0] === 2 ? 'border-secondary bg-secondary bg-opacity-25' : ''"
            @click="selections[3] = [2,'']; errors[step] = 1; scrollToBottom()">
            Gain weight
        </div>

        <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5 mt-5"
            :class="selections[3][0] === 3 ? 'border-secondary bg-secondary bg-opacity-25' : ''"
            @click="selections[3] = [3,'']; errors[step] = 0">
            Maintain weight
        </div>

        <div class="mt-8" x-show="[1,2].includes(selections[3][0])">
            <div class="text-center text-gray-400">
                How much?
            </div>

            <div class="flex">
                <div class="flex-1 w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5 mt-5 mr-4"
                    :class="selections[3][1] === 0 ? 'border-secondary bg-secondary bg-opacity-25' : ''"
                    @click="selections[3][1] = 0; errors[step] = 0">
                    up to 5kg
                </div>
                <div class="flex-1 w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5 mt-5"
                    :class="selections[3][1] === 1 ? 'border-secondary bg-secondary bg-opacity-25' : ''"
                    @click="selections[3][1] = 1;  errors[step] = 0">
                    up to 10kg
                </div>
            </div>

            <div class="flex-1 w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5 mt-5 mr-4"
                :class="selections[3][1] === 2 ? 'border-secondary bg-secondary bg-opacity-25' : ''"
                @click="selections[3][1] = 2;  errors[step] = 0">
                more than 10kg
            </div>
        </div>

    </div>
</div>
