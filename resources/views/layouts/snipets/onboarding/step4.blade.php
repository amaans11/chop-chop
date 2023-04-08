<div x-show="step === 4" class="font-semibold flex flex-col justify-between pt-5">

    @include('layouts.snipets.onboarding.heading', ['slot' => 'Do you avoid any foods?'])

    <div class="text-secondary-brown text-sm text-center">
        Let's find you restrictions
    </div>

    <div class="mt-10">
        <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5"
             :class="selections[4][0] === 0 ? 'border-secondary bg-secondary bg-opacity-25' : ''"
             @click="selections[4] = [0, []]; errors[step] = 1; scrollToBottom()">
            Yes, for general health
        </div>

        <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5 mt-5"
             :class="selections[4][0] === 1 ? 'border-secondary bg-secondary bg-opacity-25' : ''"
             @click="selections[4] = [1, []]; errors[step] = 1; scrollToBottom()">
            Yes, to manage an allergy
        </div>

        <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5 mt-5"
             :class="selections[4][0] === 2 ? 'border-secondary bg-secondary bg-opacity-25' : ''"
             @click="selections[4] = [2, []]; errors[step] = 1; scrollToBottom()">
            Yes, to manage a chronic condition
        </div>

        <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5 mt-5"
             :class="selections[4][0] === 3 ? 'border-secondary bg-secondary bg-opacity-25' : ''"
             @click="selections[4] = [3, []]; errors[step] = 1; scrollToBottom()">
            Yes, for a religious concern
        </div>

        <div class="w-full border border-primary-border bg-gray-50 rounded-xl text-center py-5 mt-5"
             :class="selections[4][0] === 4 ? 'border-secondary bg-secondary bg-opacity-25' : ''"
             @click="selections[4] = [4, []]; errors[step] = 0">
            Not at all
        </div>

        <div class="mt-8" x-show="[0,1,2,3].includes(selections[4][0])">
            <div class="text-center text-gray-400">
                Choose one of the options below
            </div>

            <div class="mt-5" x-show="selections[4][0] === 0">
                <div class="inline-block border border-primary-border bg-gray-50 rounded text-center py-2 px-4 mr-2 mt-2"
                     :class="selections[4][1].includes(0) ? 'border-secondary bg-secondary bg-opacity-50' : ''"
                     @click="step4_toggle(selections, step, errors, 0);">
                    Increase vitality
                </div>
                <div class="inline-block border border-primary-border bg-gray-50 rounded text-center py-2 px-4 mr-2 mt-2"
                     :class="selections[4][1].includes(1) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                     @click="step4_toggle(selections, step, errors, 1);">
                    Clean liver
                </div>
                <div class="inline-block border border-primary-border bg-gray-50 rounded text-center py-2 px-4 mr-2 mt-2"
                     :class="selections[4][1].includes(2) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                     @click="step4_toggle(selections, step, errors, 2);">
                    Balance hormones
                </div>
                <div class="inline-block border border-primary-border bg-gray-50 rounded text-center py-2 px-4 mr-2 mt-2"
                     :class="selections[4][1].includes(3) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                     @click="step4_toggle(selections, step, errors, 3);">
                    Gut health
                </div>
                <div class="inline-block border border-primary-border bg-gray-50 rounded text-center py-2 px-4 mr-2 mt-2"
                     :class="selections[4][1].includes(4) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                     @click="step4_toggle(selections, step, errors, 4);">
                    Other
                </div>
            </div>

            <div class="mt-5" x-show="selections[4][0] === 1">
                <div class="inline-block border border-primary-border bg-gray-50 rounded text-center py-2 px-4 mr-2 mt-2"
                     :class="selections[4][1].includes(0) ? 'border-secondary bg-secondary bg-opacity-50' : ''"
                     @click="step4_toggle(selections, step, errors, 0);">
                    Wheat
                </div>
                <div class="inline-block border border-primary-border bg-gray-50 rounded text-center py-2 px-4 mr-2 mt-2"
                     :class="selections[4][1].includes(1) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                     @click="step4_toggle(selections, step, errors, 1);">
                    Gluten
                </div>
                <div class="inline-block border border-primary-border bg-gray-50 rounded text-center py-2 px-4 mr-2 mt-2"
                     :class="selections[4][1].includes(2) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                     @click="step4_toggle(selections, step, errors, 2);">
                    Lactose
                </div>
                <div class="inline-block border border-primary-border bg-gray-50 rounded text-center py-2 px-4 mr-2 mt-2"
                     :class="selections[4][1].includes(3) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                     @click="step4_toggle(selections, step, errors, 3);">
                    Eggs
                </div>
                <div class="inline-block border border-primary-border bg-gray-50 rounded text-center py-2 px-4 mr-2 mt-2"
                     :class="selections[4][1].includes(4) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                     @click="step4_toggle(selections, step, errors, 4);">
                    Tree Nut
                </div>
                <div class="inline-block border border-primary-border bg-gray-50 rounded text-center py-2 px-4 mr-2 mt-2"
                     :class="selections[4][1].includes(5) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                     @click="step4_toggle(selections, step, errors, 5);">
                    Peanuts
                </div>
                <div class="inline-block border border-primary-border bg-gray-50 rounded text-center py-2 px-4 mr-2 mt-2"
                     :class="selections[4][1].includes(6) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                     @click="step4_toggle(selections, step, errors, 6);">
                    Shellfish
                </div>
                <div class="inline-block border border-primary-border bg-gray-50 rounded text-center py-2 px-4 mr-2 mt-2"
                     :class="selections[4][1].includes(7) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                     @click="step4_toggle(selections, step, errors, 7);">
                    Soy
                </div>
                <div class="inline-block border border-primary-border bg-gray-50 rounded text-center py-2 px-4 mr-2 mt-2"
                     :class="selections[4][1].includes(8) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                     @click="step4_toggle(selections, step, errors, 8);">
                    Fish
                </div>
                <div class="inline-block border border-primary-border bg-gray-50 rounded text-center py-2 px-4 mr-2 mt-2"
                     :class="selections[4][1].includes(9) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                     @click="step4_toggle(selections, step, errors, 9);">
                    Other
                </div>
            </div>

            <div class="mt-5" x-show="selections[4][0] === 2">
                <div class="inline-block border border-primary-border bg-gray-50 rounded text-center py-2 px-4 mr-2 mt-2"
                     :class="selections[4][1].includes(0) ? 'border-secondary bg-secondary bg-opacity-50' : ''"
                     @click="step4_toggle(selections, step, errors, 0);">
                    Cancer
                </div>
                <div class="inline-block border border-primary-border bg-gray-50 rounded text-center py-2 px-4 mr-2 mt-2"
                     :class="selections[4][1].includes(1) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                     @click="step4_toggle(selections, step, errors, 1);">
                    Cardiovascular
                </div>
                <div class="inline-block border border-primary-border bg-gray-50 rounded text-center py-2 px-4 mr-2 mt-2"
                     :class="selections[4][1].includes(2) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                     @click="step4_toggle(selections, step, errors, 2);">
                    Diabetes
                </div>
                <div class="inline-block border border-primary-border bg-gray-50 rounded text-center py-2 px-4 mr-2 mt-2"
                     :class="selections[4][1].includes(3) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                     @click="step4_toggle(selections, step, errors, 3);">
                    Osteoporosis
                </div>
                <div class="inline-block border border-primary-border bg-gray-50 rounded text-center py-2 px-4 mr-2 mt-2"
                     :class="selections[4][1].includes(4) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                     @click="step4_toggle(selections, step, errors, 4);">
                    Obesity
                </div>
            </div>

            <div class="mt-5" x-show="selections[4][0] === 3">
                <div class="inline-block border border-primary-border bg-gray-50 rounded text-center py-2 px-4 mr-2 mt-2"
                     :class="selections[4][1].includes(0) ? 'border-secondary bg-secondary bg-opacity-50' : ''"
                     @click="step4_toggle(selections, step, errors, 0);">
                    Islam
                </div>
                <div class="inline-block border border-primary-border bg-gray-50 rounded text-center py-2 px-4 mr-2 mt-2"
                     :class="selections[4][1].includes(1) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                     @click="step4_toggle(selections, step, errors, 1);">
                    Hinduism
                </div>
                <div class="inline-block border border-primary-border bg-gray-50 rounded text-center py-2 px-4 mr-2 mt-2"
                     :class="selections[4][1].includes(2) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                     @click="step4_toggle(selections, step, errors, 2);">
                    Sikhism
                </div>
                <div class="inline-block border border-primary-border bg-gray-50 rounded text-center py-2 px-4 mr-2 mt-2"
                     :class="selections[4][1].includes(3) ? 'border-secondary  bg-secondary bg-opacity-50' : ''"
                     @click="step4_toggle(selections, step, errors, 3);">
                    Judaism
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function step4_toggle(selections, step, errors, option) {
        selections[4][1].includes(option) ? selections[4][1].splice(selections[4][1].indexOf(option) ,1) : selections[4][1].push(option);

        selections[4][1].length > 0 ? errors[step] = 0 : errors[step] = 1;
    }
</script>
