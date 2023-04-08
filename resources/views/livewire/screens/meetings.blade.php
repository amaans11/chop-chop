<div>
    @foreach ($meetings as $meeting)
        <div class="relative mx-4 mb-5">
            <img class="w-full rounded-lg" src="{{ $meeting->hero_image?->getUrl() }}"/>
            <div class="backdrop-filter backdrop-blur-lg bg-opacity-10 bg-black w-full flex justify-between px-4" style="position:absolute;bottom:40px">
                <div class="font-bold text-white text-2xl" >
                    <div>
                        {{ $meeting->title }}
                    </div>
                    <div class="text-sm">
                        {{ $meeting->time }}
                    </div>
                </div>

                <button wire:click="infoHandler({{ $meeting->id }})">
                    <img src="{{ asset('images/info.png') }}"/>
                </button>
            </div>

        </div>
    @endforeach
</div>
