<div classs="w-full">
    <div class="w-full bg-primary px-4">
        <div class="flex w-full justify-center py-4">
            <img src="{{ asset('images/logo.svg') }}" class="h-10" />
            <div class="text-white text-2xl	font-bold px-4 py-2 font-title">Browse Session Types</div>
        </div>
    </div>

    <div class="flex justify-center ">
        <div class="border-b-2">
            <div class="font-bold mt-8 mb-2 ml-4">Quick Cook </div>
            <div class=" grid grid-cols-3 gap-3 mx-4 mb-8">
                @foreach ($quickCookSubCategories as $value)
                    <div class="w-28 h-20 shadow-xl rounded-lg relative"
                        style="background:{{ json_decode($value['data'])->bgColor }}">
                        <x-subcategory-card name="subcategory" type="radio" value="{{ $value['slug'] }}"
                            class="w-full h-full bg-transparent"
                            label-class="{{ $value['title'] == 'Desserts' ? 'col-span-2' : '' }}">
                            <div class="flex justify-start text-left px-2">
                                <div>
                                    <div class="text-base font-bold leading-4"
                                        style="color:{{ json_decode($value['data'])->color }}">
                                        {{ $value['title'] }}</div>
                                    <div class="text-xs font-semibold absolute bottom-0 py-2"
                                        style="color:{{ json_decode($value['data'])->color }}">
                                        {{ $value->classes_count }}
                                        classes</div>
                                </div>
                            </div>
                        </x-subcategory-card>
                    </div>

                @endforeach
            </div>
        </div>
    </div>
    <div class="flex justify-center">
        <div>
            <div class="font-bold mt-4 mb-2 ml-4">Popular </div>
            <div class="grid grid-cols-3 gap-3 mx-4 mb-8">
                @foreach ($popularSubCategories as $value)
                    <div class="w-28 h-20 shadow-xl rounded-lg relative"
                        style="background:{{ json_decode($value['data'])->bgColor }}">
                        <x-subcategory-card name="subcategory" type="radio" value="{{ $value['slug'] }}"
                            class="w-full h-full bg-transparent">
                            <div class="flex justify-start text-left px-2">
                                <div>
                                    <div class="text-base font-bold leading-4 font-sans"
                                        style="color:{{ json_decode($value['data'])->color }}">
                                        {{ $value['title'] }}</div>
                                    <div class="text-xs	font-semibold absolute bottom-0 py-2"
                                        style="color:{{ json_decode($value['data'])->color }}">
                                        {{ $value->classes_count }}
                                        classes</div>
                                </div>
                            </div>
                        </x-subcategory-card>
                    </div>

                @endforeach

            </div>
        </div>

    </div>
</div>
