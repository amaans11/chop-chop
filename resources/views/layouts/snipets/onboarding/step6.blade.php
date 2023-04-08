<div  x-show="step === 6" class="font-semibold flex flex-col justify-between pt-5">

    @include('layouts.snipets.onboarding.heading', ['slot' => 'Which specific diet do you refer to?'])


    <div class="text-primary-text text-center">
        Choose up to 3
    </div>

    <div class="mt-10">
        <div class="flex mt-3">
            <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5 px-2 mr-2"
                 :class="selections[6].includes(0) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                 @click="step6_toggle(selections, step, errors, 0);">
                Plant-based
            </div>

            <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5 px-2"
                 :class="selections[6].includes(1) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                 @click="step6_toggle(selections, step, errors, 1);">
                Flexitarian
            </div>
        </div>

        <div class="flex mt-3">
            <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5 px-2 mr-2"
                 :class="selections[6].includes(2) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                 @click="step6_toggle(selections, step, errors, 2);">
                Low-sugar / Sugar-free
            </div>

                <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5 px-2"
                     :class="selections[6].includes(3) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                     @click="step6_toggle(selections, step, errors, 3);">
                    Mediterranean
             </div>
        </div>

        <div class="flex mt-3">
            <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5 px-2 mr-2"
                 :class="selections[6].includes(4) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                 @click="step6_toggle(selections, step, errors, 4);">
                DASH
             </div>

                <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5 px-2"
                     :class="selections[6].includes(5) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                     @click="step6_toggle(selections, step, errors, 5);">
                MIND
             </div>
        </div>

        <div class="flex mt-3">
            <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5 px-2 mr-2"
                 :class="selections[6].includes(6) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                 @click="step6_toggle(selections, step, errors, 6);">
                Weight loss / Calorie restricted
             </div>

                <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5 px-2"
                     :class="selections[6].includes(7) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                     @click="step6_toggle(selections, step, errors, 7);">
                    Weight gain
             </div>
        </div>

        <div class="flex mt-3">
            <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5 px-2 mr-2"
                 :class="selections[6].includes(8) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                 @click="step6_toggle(selections, step, errors, 8);">
                Allergy or intolerance-based
             </div>

            <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5 px-2"
                 :class="selections[6].includes(9) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                 @click="step6_toggle(selections, step, errors, 9);">
                Fasting/detox
             </div>
        </div>

        <div class="flex mt-3">

            <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5 px-2"
                 :class="selections[6].includes(11) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                 @click="step6_toggle(selections, step, errors, 11);">
                None of the above
             </div>
        </div>

    </div>
</div>

<script>
    function step6_toggle(selections, step, errors, option) {
        if (!selections[6]) selections[6] = [];

        if (option === 11) {
            selections[6].includes(11) ? selections[6] = [] : selections[6] = [11];

        } else {
            selections[6].includes(option) ? selections[6].splice(selections[6].indexOf(option) ,1) :
                selections[6].length < 3 ? selections[6].push(option) : '';

            selections[6].includes(11) ? selections[6].splice(selections[6].indexOf(11) ,1) : '';
        }





        selections[6].length > 0 ? errors[step] = 0 : errors[step] = 1;
    }
</script>
