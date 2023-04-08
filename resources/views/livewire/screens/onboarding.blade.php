<div id="onboarding_container" x-data="initial_data()" x-cloak
     class="flex flex-col justify-between h-full z-10 overflow-auto" style="margin-top:8px;">


    <div class="w-full flex flex-col items-center justify-center">
        <div class="text-secondary-brown text-sm"
             x-text="'Step '+ (step > 6 ? 6 : step) + '/6'">
        </div>

        <div class="mt-2 rounded overflow-hidden max-w-2xl left-0 w-3/4 bg-gray-200 ml-auto mr-auto right-0 z-10">
            <div class="rounded bg-secondary h-3" x-bind:style="{width: 100 * step / 5 + '%'}"></div>
        </div>
    </div>



    <div id="steps_container" class="flex-1 overflow-auto mb-40 px-4 mt-5">
        @include('layouts.snipets.onboarding.step1')
        @include('layouts.snipets.onboarding.step2')
        @include('layouts.snipets.onboarding.step3')
        @include('layouts.snipets.onboarding.step4')
        @include('layouts.snipets.onboarding.step5')
        @include('layouts.snipets.onboarding.step6')
        @include('layouts.snipets.onboarding.step7')
    </div>


    <div x-show="step < 7"
         class="flex justify-between fixed max-w-2xl ml-auto mr-auto right-0 bottom-0 bg-white w-full left-0 p-5 pt-2">
        <div class="relative border border-gray-300 flex-1 mr-4 text-xl p-5 flex justify-center items-center rounded-xl"
             :class="{'invisible': step == 1}"
             @click="step === 1 ? step = 1 : step--">
            <i class="absolute fas fa-angle-left mr-5 mt-1" style="left:20px"></i> Back
        </div>

        <div class="relative flex-1 text-xl text-white bg-secondary p-5 rounded-xl"
        >
            <div class="bg-white bg-opacity-50 absolute h-full w-full top-0 left-0" x-show="errors[step] !== 0"></div>
            <div class="flex justify-center items-center   w-full h-full" @click="step++">
                Next <i class="absolute fas fa-angle-right ml-5 mt-1" style="right:20px"></i>
            </div>

        </div>
    </div>


    <x-analytics-tracker page="signup"/>
</div>
<script>
    function scrollToBottom() {
        setTimeout(() => {
            document.getElementById('steps_container').scrollTo({
                top: 400,
                behavior: 'smooth'
            });
        }, 100)
    }

    function initial_data() {
        return {
            step: 1,
            selections: ['', '', '', ['', ''], ['', []], '', []],
            info: {
                name: '',
                age: '',
                gender: '',
                city: '',
                zip: '',
                email: '',
                pwd: '',
            },
            errors: [],
            errorMsg: '',
            register() {
                const urlParams = new URLSearchParams(window.location.search);
                fetch(`{{ env('APP_URL') }}/api/register`, {
                        method: 'POST',
                        headers: {
                            'Accept': 'application/json',
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': '{{ csrf_token() }}'
                        },
                        body:
                            JSON.stringify({
                                _token: '{{ csrf_token() }}',
                                source_id: urlParams.get('source_id'),
                                selections: this.selections,
                                info: this.info
                            })
                    }
                )

                    .then(res => res.json())
                    .then(data => {
                        if (data['errors']) {
                            this.errorMsg = data['errors'];
                        } else location.href = 'session-type';
                    });
            }
        }
    }
</script>
