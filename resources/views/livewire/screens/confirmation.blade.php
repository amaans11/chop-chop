<div class="flex flex-col h-body justify-between">
    <div>
        <div class=" flex items-center mb-4 bg-purple-default h-24 pl-4">
            <div class="w-full flex justify-center">
                <img src="{{ asset('images/logo.svg') }}" class="h-10" />
                <div class="py-1">
                    <span class="text-xl font-bold font-title text-white">
                        Food
                    </span><span class="text-xl font-bold font-title text-secondary">Monk</span>
                </div>
            </div>
        </div>
        <div class="max-w-md mx-auto">
            <div class="mx-1">
                <img src="{{ asset('images/icons/postcard.png') }}" />
                <div class="px-4">
                    <div class="py-5 font-heading text-3xl font-semibold">👋 Thank you! You’re now an early bird user
                    </div>
                    <p class="font-heading text-sm mb-8">Based on the information that you shared with very soon we will
                        be
                        sharing a profesional chef with you.
                    </p>
                    <span class="font-heading text-3xl font-semibold">
                        Give your feedback & win a <span class="text-secondary">$100 Amazon Gift Card</span>
                    </span>
                </div>
            </div>
        </div>

    </div>
    <div class="mr-5 ml-2 mt-12">
        <div class="lg:w-3/10 mx-auto">
            <x-button type=" submit" class="text-white bg-secondary w-full relative mt-2 mx-2"
                wire:loading.attr="disabled" as="a"
                href="https://mealstuff.typeform.com/to/M8SbCdBQ#project={{ env('ANALYTICS_PROJECT') }}&email={{ auth()->user()->email }}&source={{ auth()->user()->data->get('source_id') }}">
                Start the survey
            </x-button>
        </div>
    </div>
</div>
