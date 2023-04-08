<div class="flex flex-col min-h-screen">
    <div class="font-bold text-2xl">My Classes</div>
    <div class="border mt-4">
        <div class=" p-4 mt-4">
            <div class="flex">
                <img class="w-20 h-20 rounded" src="{{ $class->hero_image?->getUrl() }}" />
                <div class="ml-4">
                    <div class="text-xl font-medium">
                        {{ $class->title }}
                    </div>
                </div>

            </div>
        </div>
        <div class="bg-gray-200 p-4 flex justify-between">
            <div>
                <div class="font-semibold pb-2 text-gray-600">Slot Selected</div>
                <div> {{ $date }} - {{ $timeSlot }}</div>
            </div>

        </div>
    </div>
</div>


