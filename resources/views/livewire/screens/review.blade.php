<div class="flex flex-col h-body justify-between">
    <div>
        <div class=" flex items-center mb-12 bg-purple-default h-24 pl-4">
            <div class="w-full flex lg:justify-center">
                <div wire:click="backHandler">
                    <i class="fas fa-chevron-left text-lg text-white"></i>
                </div>
                <div class="text-xl ml-6 font-semibold text-white">
                    Review & Confirm
                </div>
            </div>
        </div>
        <div class="lg:w-1/3 mx-auto">
            <div class="mx-4">
                <div class="flex flex-row mb-12">
                    <img class="w-20 h-20 rounded" src="{{ $class->hero_image?->getUrl() }}" />
                    <div class="ml-4">
                        <div class="text-xl font-bold font-title ">
                            {{ $class->title }}
                        </div>
                        <div class="pt-2 text-grey font-semibold text-base font-sans">
                            <div>USD {{ $class->price }} / slot</div>
                        </div>
                    </div>
                </div>
                <div class="bg-accent-grey p-4 flex justify-between items-center rounded-lg">
                    <div class="mr-4">
                        <div class=" font-semibold pb-2">Slot Selected</div>
                        <div> {{ $date }} - {{ $timeSlot }}</div>
                    </div>
                    <a x-data x-on:click="$dispatch('toggleSlideOver', 'pickSlot')" wire:loading.attr="disabled"
                        class="underline">change</a>
                </div>
            </div>
        </div>

    </div>
    <div class="mx-4">
        <div class="lg:w-1/3 mx-auto">
            <x-button type=" submit" class="text-white bg-secondary w-full relative mt-2" wire:loading.attr="disabled"
                wire:click="submitHandler" dusk="confirmBtn">
                Pay Once - {{ $class->price }} $/session
            </x-button>
            <div class="text-primary w-full mt-2 mb-12 text-center py-2 rounded-lg" style="border:3px solid #371F93"
                wire:loading.attr="disabled" wire:click="subscribeHandler">
                <div>
                    <p class="text-base font-bold">Subscribe - 39$/month</p>
                    <p class="text-sm font-normal"> 4 sessions/month</p>
                </div>
            </div>
        </div>
    </div>


    <x-slide-over id="pickSlot">
        <div class="px-4">
            <div class="flex justify-between">
                <div class="text-xl leading-6 font-bold">
                    Select a slot
                </div>
                <i class="far fa-times text-2xl border border-gray-400 px-2 rounded-lg text-gray-400"
                    x-on:click="toggle"></i>

            </div>
            <x-datepicker />
            <div class="text-gray-500 text-base	font-bold mb-4">7 slots available</div>
            @foreach ($timeslots as $value => $slot)
                <div x-data={time:false} class="mb-2 rounded-lg ">
                    <div
                        class="text-gray-500 p-4 cursor-pointer focus:outline-none flex justify-between bg-blue-background">
                        <div class="flex">
                            <img src="{{ $slot['icon'] }}" class="h-6" />
                            <div class="font-bold px-4">{{ $slot['title'] }}</div>
                        </div>
                        <div class="flex">
                            <div class="text-gray-500 font-semibold px-4">{{ count($slot['timeslots']) }} slots</div>
                            <i class="fas fa-chevron-down py-1" x-on:click.prevent="time=!time"></i>
                        </div>
                    </div>
                    <div x-show="time" class="py-2 px-4 text-gray-700 grid grid-cols-3 gap-3">
                        @foreach ($slot['timeslots'] as $value)
                            <x-checkbox-card name="timeSlot" type="radio" value="{{ $value }}">
                                {{ $value }}
                            </x-checkbox-card>
                        @endforeach
                    </div>
                </div>
            @endforeach
        </div>

        <div class="bg-accent flex justify-between items-center p-4 mt-2">
            <div>
                <div class="font-bold"> ${{ $class->price }} / device</div>
                <div class="flex w-auto">
                    <img src="{{ asset('images/star.png') }}" class="h-5" />
                    <div>&nbsp {{ $class->getAverageReview() }} &nbsp</div>
                </div>
            </div>
            <x-button type="submit" class="text-white bg-primary w-1/2" wire:loading.attr="disabled"
                wire:click="confirmSlot" dusk="confirm-slot">
                Confirm Slot
            </x-button>
        </div>
    </x-slide-over>
</div>
