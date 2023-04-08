<div classs="w-full">
    <div class="w-full bg-primary px-4">
        <div class="flex lg:justify-center lg:w-11 w-full py-4">
            <div class="px-4 py-2" wire:click="backHandler">
                <i class="far fa-angle-left  text-white text-2xl"></i>
            </div>
            <div class="text-white text-2xl	font-bold px-4 py-2 font-title">Browse a Cuisine</div>
        </div>
    </div>


    <div class="flex justify-center">
        <div class="mt-8 grid grid-cols-3 gap-3 mx-4">
            @foreach ($cuisines as $value)
                <x-checkbox-card name="cuisine" type="radio" value="{{ $value['slug'] }}" class="w-26 h-26 shadow-xl">
                    <div class="flex justify-center">
                        <div>
                            <img src="{{ $value->hero_image?->getUrl() }}" class="w-12 h-12 mx-auto" />
                            <div class="text-sm font-semibold font-sans">{{ $value['title'] }}</div>
                        </div>
                    </div>
                </x-checkbox-card>
            @endforeach
        </div>
    </div>
</div
