<div wire:ignore>
    <div class="absolute top-5 left-2" wire:click="backHandler">
        <i class="far fa-angle-left  text-white text-2xl"></i>
    </div>
    <img class="w-full h-52 object-cover max-w-4xl mx-auto" src="{{ $class->hero_image?->getUrl() }}" />
    <div class="px-4 lg:w-1/2 mx-auto">
        <div>
            <div class="lg:flex justify-between">
                <div class="lg:w-1/2">
                    <div class=" text-2xl leading-6 font-bold pt-8">
                        {{ $class->title }}
                    </div>
                    <div class="flex justify-between mt-6">
                        <div class="flex">
                            <img src="{{ $class->owner?->hero_image?->getUrl() }}" class="w-14 h-14 rounded-full" />
                            <div class="px-2">
                                <div>
                                    Trained By
                                </div>
                                <div class="font-bold">
                                    {{ $class->owner?->name }}
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="flex leading-3">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hidden md:block">
                    <div class="                                bg-accent  py-4 mt-4 px-8">
                        <div class=" font-bold mb-2"> ${{ $class->price }} / device</div>
                        <x-button type="submit" class="text-white bg-secondary w-full h-12" wire:loading.attr="disabled"
                            x-data x-on:click="$dispatch('toggleSlideOver', 'pickSlot')">
                            Pick a Slot
                        </x-button>

                    </div>
                </div>
            </div>

            <div class="border border-blue-border mb-8 mt-4 bg-blue-default">
                <div class="flex gap-5 justify-center mt-4  p-2 rounded">
                    <div class="mr-4">
                        <div class="text-blue-dark font-semibold">Duration</div>
                        <div class="text-blue-light font-bold">{{ $class->duration }} mins</div>
                    </div>
                    <div class="ml-4">
                        <div class="text-blue-dark font-semibold">Difficulty</div>
                        <div class="text-blue-light font-bold">{{ $class->level }}</div>
                    </div>
                    <div class="ml-4">
                        <div class="text-blue-dark font-semibold">Price</div>
                        <div class="text-blue-light font-bold">{{ $class->price }}$</div>
                    </div>
                </div>
            </div>
            <hr />

            <div x-data="{ openTab: 1 }" class="py-6">
                <ul class="flex">
                    <li @click="openTab = 1" :class="{ '-mb-px': openTab === 1 }" class="-mb-px mr-2">
                        <a :class="openTab === 1 ? 'bg-secondary text-white rounded py-1 px-3 inline-flex items-center text-sm font-medium' : 'text-gray-400 hover:bg-gray-50 hover:text-gray-400 rounded-md py-1 px-3 inline-flex items-center text-sm font-medium'"
                            href="#">
                            Description
                        </a>
                    </li>
                    <li @click="openTab = 2" :class="{ '-mb-px': openTab === 2 }" class="mr-2">
                        <a :class="openTab === 2 ? 'bg-secondary text-white rounded py-1 px-3 inline-flex items-center text-sm font-medium' : 'text-gray-400 hover:bg-gray-50 hover:text-gray-400 rounded-md py-1 px-3 inline-flex items-center text-sm font-medium'"
                            href="#">
                            Ingredients</a>
                    </li>
                    <li @click="openTab = 3" :class="{ '-mb-px': openTab === 3 }" class="mr-2">
                        <a :class="openTab === 3 ? 'bg-secondary text-white rounded py-1 px-3 inline-flex items-center text-sm font-medium' : 'text-gray-400 hover:bg-gray-50 hover:text-gray-400 rounded-md py-1 px-3 inline-flex items-center text-sm font-medium'"
                            href="#">Steps</a>
                    </li>

                </ul>
                <div class="w-full pt-4 px-4">
                    <div x-show="openTab === 1">{{ $class->description }}</div>
                    <div x-show="openTab === 2">
                        @foreach (explode(',', $class->ingredients) as $ingredient)
                            <li>{{ $ingredient }}</li>
                        @endforeach
                    </div>
                    <div x-show="openTab === 3">
                        <x-markdown>
                            {{ $class->steps }}
                        </x-markdown>
                    </div>
                </div>
            </div>
            <hr />

            <div class="mb-20">
                <div class="text-xl	pt-4 font-bold mb-8">
                    Frequently asked questions
                </div>
                <div x-data={show:false} class="border mb-2 rounded-lg">
                    <div x-on:click.prevent="show=!show" class="text-gray-500 p-4 cursor-pointer focus:outline-none">
                        <li>

                            Are the Chefs verified and high quality?
                        </li>
                    </div>
                    <div x-show="show" class="py-2 px-4 text-gray-700">
                        All our chefs have been tested and vetted to ensure they will provide a high quality experience.
                        They are top chefs who are experts in cooking the dishes they teach.
                    </div>
                </div>
                <div x-data={show:false} class="border mb-2 rounded-lg">
                    <div x-on:click.prevent="show=!show" class="text-gray-500 p-4 cursor-pointer focus:outline-none">
                        <li>

                            Do I get the ingredients beforehand?
                        </li>

                    </div>
                    <div x-show="show" class="py-2 px-4 text-gray-700">
                        You will receive an email with all the ingredients that you need to buy immediately after
                        booking a class. This way you'll be ready to rock and roll when the class starts.
                    </div>
                </div>
                <div x-data={show:false} class="border mb-2 rounded-lg">
                    <div x-on:click.lirevent="show=!show" class="text-gray-500  p-4 cursor-pointer focus:outline-none">
                        <li>
                            Will the Chef answer my questions?
                        </li>
                    </div>
                    <div x-show="show" class="py-2 px-4 text-gray-700">
                        Foodmonks sessions are focused on convenience and quality. Our chefs are here to cook along
                        with
                        you to ensure you can cook amazing recipes in record time.
                    </div>
                </div>
            </div>
            @if ($reviews->count())
                <div class="text-xl	pt-4 font-bold">
                    Reviews
                </div>
                @foreach ($reviews as $review)
                    <div class="flex flex-row pt-8">
                        <img src="{{ $review->user->hero_image?->getUrl() }}"
                            class="w-16 h-16 rounded-full flex-shrink-0 object-cover" />
                        <div class="ml-4 w-full">
                            <div class="w-full flex justify-between items-center">
                                <div class="font-bold">
                                    {{ $review->user->name }}
                                </div>
                                <div class="flex justify-center items-center">
                                    <div class="flex items-center ml-4">
                                        @for ($i = 0; $i < $review->rate; $i++)
                                            <svg class="mx-1 w-4 h-4 fill-current text-secondary"
                                                xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                                <path
                                                    d="M10 15l-5.878 3.09 1.123-6.545L.489 6.91l6.572-.955L10 0l2.939 5.955 6.572.955-4.756 4.635 1.123 6.545z" />
                                            </svg>
                                        @endfor

                                        @for ($i = 0; $i < 5 - $review->rate; $i++)
                                            <svg class="mx-1 w-4 h-4 fill-current text-gray-400"
                                                xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                                <path
                                                    d="M10 15l-5.878 3.09 1.123-6.545L.489 6.91l6.572-.955L10 0l2.939 5.955 6.572.955-4.756 4.635 1.123 6.545z" />
                                            </svg>
                                        @endfor
                                    </div>
                                </div>
                            </div>
                            <div class="mt-2">
                                {{ $review->text }}
                            </div>
                        </div>
                    </div>
                @endforeach
            @endif
        </div>
    </div>

    <div class="w-full bg-accent flex justify-between p-4 mt-4 fixed bottom-24 lg:hidden">
        <div class="my-4">
            <div class="font-bold"> ${{ $class->price }} / device</div>
        </div>
        <x-button type="submit" class="text-white bg-secondary w-1/2 " wire:loading.attr="disabled" x-data
            x-on:click="$dispatch('toggleSlideOver', 'pickSlot')">
            Pick a Slot
        </x-button>

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
            <div class="text-gray-500 text-base	font-bold mb-4">26 slots available</div>
            @foreach ($timeslots as $value => $slot)
                <div x-data={time:false} class="mb-2 rounded-lg ">
                    <div x-on:click.prevent="time = !time"
                        class="text-gray-500 p-4 cursor-pointer focus:outline-none flex justify-between bg-blue-background">
                        <div class="flex">
                            <img src="{{ $slot['icon'] }}" class="h-6" />
                            <div class="font-bold px-4">{{ $slot['title'] }}</div>
                        </div>
                        <div class="flex">
                            <div class="text-gray-500 font-semibold px-4">{{ count($slot['timeslots']) }} slots</div>
                            <i class="transition-all fas fa-chevron-down py-1" :class="{'rotate-180': time}"></i>
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
            </div>
            <x-button type="submit" class="text-white bg-primary w-1/2" wire:loading.attr="disabled"
                wire:click="confirmSlot" dusk="confirm-slot">
                Confirm Slot
            </x-button>
        </div>
    </x-slide-over>
</div>
