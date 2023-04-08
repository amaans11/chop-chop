<div class="w-full text-center">
    <div class="bg-primary px-4 py-4 lg:flex justify-center">
        <div class="flex py-2 justify-center rounded-full px-2 bg-indigo-default mx-8">
            <div class="font-semibold px-6 text-lg cursor-pointer   py-1 rounded-l-full {{ $type == 'quick-cook' ? 'text-white bg-secondary-light rounded-full' : 'text-indigo-light' }}"
                wire:click="handleType('quick-cook')">Quick Cook</div>
            <div class="font-semibold px-6 text-lg cursor-pointer  py-1 rounded-r-full  {{ $type == 'popular' ? 'text-white bg-secondary-light rounded-full' : 'text-indigo-light' }}"
                wire:click="handleType('popular')">Popular</div>
        </div>
    </div>
    <div
        class="bg-background-light p-4 inline-grid gap-3 grid-rows-1 grid-flow-col overflow-auto items-start w-full lg:justify-center">
        @foreach ($subCategories as $subcategory)
            <div class="text-purple-dark text-base whitespace-nowrap px-2 cursor-pointer {{ $subcategory['slug'] == $subCategory ? 'font-bold text-purple-background' : 'font-semibold' }}"
                wire:click="updatesubCategory({{ $subcategory }})">{{ $subcategory['title'] }}</div>
        @endforeach
    </div>

    <div class=" p-4 inline-grid gap-3 grid-rows-1 grid-flow-col overflow-auto items-start w-full max-w-4xl">
        @foreach ($cuisines as $value)
            @isset($value)
                <div class=" text-base whitespace-nowrap py-2 px-5 rounded-lg cursor-pointer {{ $value['slug'] == $cuisine ? 'font-bold bg-secondary-light text-white' : 'font-semibold text-grey-dark bg-grey-light' }}"
                    wire:click="updateCuisine({{ $value }})">
                    <div class="flex mr-3">
                        <img src="{{ $value?->hero_image?->getUrl() }}" class="w-5 h-5 mr-2 mt-1" />
                        {{ $value['title'] }}
                    </div>
                </div>
            @endisset
        @endforeach
    </div>

    <div class="mt-8 lg:flex justify-center max-w-3xl w-full mx-auto px-4">
        <div class="lg:grid grid-cols-2">
            @foreach ($classes as $class)
                <div class="flex flex-col justify-between shadow-xl rounded-lg mt-6 lg:mr-4"
                    wire:click="handleClassDetail({{ $class->id }})">
                    <div class="relative w-full" style="padding-bottom: 50%;">
                        <img class="absolute inset-0 w-full h-full object-cover rounded-t-lg"
                            src="{{ $class->hero_image?->getUrl() }}" />
                    </div>
                    <div class="mx-4 mt-4">
                        <div class="font-title text-base font-bold pb-2">{{ $class->title }}</div>
                        <div class="font-sans text-sm text-grey-default font-normal">{{ $class->short_description }}
                        </div>
                    </div>
                    <div class="flex-shrink-0">
                        <div class="border border-blue-border mb-4 mt-4 bg-blue-default mx-4">
                            <div class="flex gap-5 justify-center  p-2 rounded">
                                <div class="mr-4">
                                    <div class="text-blue-dark font-semibold font-sans text-sm">Duration</div>
                                    <div class="text-blue-light font-bold font-sans text-lg	">{{ $class->duration }}
                                        mins
                                    </div>
                                </div>
                                <div class="ml-4">
                                    <div class="text-blue-dark font-semibold font-sans text-sm">Difficulty</div>
                                    <div class="text-blue-light font-bold text-lg	">{{ $class->level }}</div>
                                </div>
                            </div>
                        </div>
                        <div class="bg-primary-background py-2 rounded-b-lg">
                            <div class="flex justify-between px-4 pt-2">
                                <div class="flex">
                                    <div class="relative flex mt-1">
                                        <img src="{{ $class->owner?->hero_image?->getUrl() }}"
                                            class="w-10 h-10 rounded-full object-cover" />
                                        <div class="relative rounded-full bg-primary w-4 h-4 flex justify-center items-center"
                                            style="top:20px;left:-13px">
                                            <img src="{{ asset('images/chef.png') }}" />
                                        </div>
                                    </div>
                                    <div>
                                        <div class="font-semibold text-sans text-sm text-white">
                                            {{ $class->owner?->name }}
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>



<x-analytics-tracker page="dashboard" />
