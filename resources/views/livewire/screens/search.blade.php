<div class="w-full bg-primary px-4 py-4">
    <h1 class="mt-5 font-semibold text-white">
        Search
    </h1>
</div>
<div x-data="{ 'showFilters': false }" x-cloak class="p-5">



    <div x-data="classSeach()">
        <input class="mt-5 border w-full px-5 py-3 border-gray-400 rounded-lg border"
               placeholder="Search"
               type="text"
               id="keyword"
               name="keyword"
               @input.debounce="fetchClasses"
               x-model="keyword"/>
    </div>

    <div class="hidden flex justify-between items-center mt-3 mb-8" id="search_result_info">
        <div class="text-gray-600" id="search_result_count"></div>
        <div @click="showFilters = true" class="border rounded border-gray-800 flex px-5 py-2 bg-white font-semibold">
            <div class="flex items-center mr-2">
                <img class="w-auto h-auto" src="{{ asset('images/icons/filters.png') }}"/>
            </div>
            Filters
        </div>
    </div>

    <div id="search_results" class="pb-32">
    </div>

    <div id="popular" class="font-semibold hidden" style="margin-top:-100px">
        Popular
        <div class="ml-3 py-5 border-b border-gray-300">
            15 min breakfast
        </div>
        <div class="ml-3 py-5 border-b border-gray-300">
            15 min lunch / dinner
        </div>
        <div class="ml-3 py-5 border-b border-gray-300">
            30 min lunch / dinner
        </div>
        <div class="ml-3 py-5 border-b border-gray-300">
            Thanksgiving
        </div>
        <div class="ml-3 py-5">
            Weekly Meal Prep
        </div>
    </div>

    <div class="hidden flex box-content py-5 items-center border-b border-gray-200" id="search_item_template"
         style="height:100px">
        <div data-name="image" class="h-full min-w-32 rounded mr-5 bg-no-repeat bg-center bg-cover"
             style="min-width:100px"></div>
        <div class="flex flex-col justify-between h-full">
            <div data-name="title" class="text-lg font-semibold line-clamp-2 leading-5"></div>
            <div data-name="owner" class="text-gray-500 italic underline"></div>
            <div class="flex items-center">
                <div data-name="duration" class="inline-block text-sm border-r border-gray-600 pr-3 mr-5"></div>
                <div data-name="reviews" class="inline-block" style="min-width:50px"></div>
            </div>
        </div>

    </div>


    <div class="overflow-auto fixed inset-0 z-10 flex items-center justify-center" x-show="showFilters">
        <div class="absolute bg-white w-full md:max-w-md mx-auto rounded py-4 text-left px-6 overflow-auto"
             style="height:calc(100vh - 170px); bottom:90px;"
             x-show="showFilters"
             @click.away="showFilters = false"
             x-transition:enter="ease-out duration-300"
             x-transition:enter-start="transform translate-y-full"
             x-transition:enter-end="transform translate-y-0"
             x-transition:leave="ease-in duration-300"
             x-transition:leave-start="transform translate-y-0"
             x-transition:leave-end="transform translate-y-full">

            <div class="flex justify-between">
                <span class="font-semibold">Filters</span>
                <span id="filter_close" @click="showFilters = false">
                    <img class="w-3" src="{{ asset('images/icons/close.png') }}"/>
                </span>
            </div>

            <div class="mt-5">
                <h1 class="mb-2 font-semibold">Cook Time</h1>

                <div>
                    <div class="filters px-5 py-3 inline-block rounded-lg border border-blue-200 m-2">
                        Under 15 min
                    </div>
                    <div class="filters px-5 py-3 inline-block rounded-lg border border-blue-200 m-2">
                        Under 30 min
                    </div>
                    <div class="filters px-5 py-3 inline-block rounded-lg border border-blue-200 m-2">
                        Under 60 min
                    </div>
                </div>
            </div>

            <div class="mt-5">
                <h1 class="mb-2 font-semibold">Cooking Level</h1>

                <div>
                    <div class="filters px-5 py-3 inline-block rounded-lg border border-blue-200 m-2">
                        Beginner
                    </div>
                    <div class="filters px-5 py-3 inline-block rounded-lg border border-blue-200 m-2">
                        Intermediate
                    </div>
                    <div class="filters px-5 py-3 inline-block rounded-lg border border-blue-200 m-2">
                        Expert
                    </div>
                </div>
            </div>

            <div class="mt-5">
                <h1 class="mb-2 font-semibold">Suggested Diets</h1>

                <div>
                    <div class="filters px-5 py-3 inline-block rounded-lg border border-blue-200 m-2">
                        Vegeterians
                    </div>
                    <div class="filters px-5 py-3 inline-block rounded-lg border border-blue-200 m-2">
                        Low Fat
                    </div>
                    <div class="filters px-5 py-3 inline-block rounded-lg border border-blue-200 m-2">
                        Sugar Free
                    </div>
                    <div class="filters px-5 py-3 inline-block rounded-lg border border-blue-200 m-2">
                        Glutten Free
                    </div>
                    <div class="filters px-5 py-3 inline-block rounded-lg border border-blue-200 m-2">
                        Low Carb
                    </div>
                </div>
            </div>

            <div class="mt-5">
                <h1 class="mb-2 font-semibold">Cooking Style</h1>

                <div>
                    <div class="filters px-5 py-3 inline-block rounded-lg border border-blue-200 m-2">
                        Fried
                    </div>
                    <div class="filters px-5 py-3 inline-block rounded-lg border border-blue-200 m-2">
                        Baked
                    </div>
                    <div class="filters px-5 py-3 inline-block rounded-lg border border-blue-200 m-2">
                        BBQ
                    </div>
                </div>
            </div>

            <div class="mt-5">
                <h1 class="mb-2 font-semibold">Cookware</h1>

                <div>
                    <div class="filters px-5 py-3 inline-block rounded-lg border border-blue-200 m-2">
                        Basic
                    </div>
                    <div class="filters px-5 py-3 inline-block rounded-lg border border-blue-200 m-2">
                        Cookpot
                    </div>
                    <div class="filters px-5 py-3 inline-block rounded-lg border border-blue-200 m-2">
                        Wok
                    </div>
                </div>
            </div>

            <div class="mt-5">
                <h1 class="mb-2 font-semibold">Meal</h1>

                <div>
                    <div class="filters px-5 py-3 inline-block rounded-lg border border-blue-200 m-2">
                        Breakfast
                    </div>
                    <div class="filters px-5 py-3 inline-block rounded-lg border border-blue-200 m-2">
                        Lunch
                    </div>
                    <div class="filters px-5 py-3 inline-block rounded-lg border border-blue-200 m-2">
                        Dinner
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>


<script>
    document.getElementById('popular').querySelectorAll('div').forEach((element) => {
        element.onclick = function () {
            document.getElementById('keyword').value = this.innerText.trim();
            document.getElementById('keyword').dispatchEvent(new Event('input'));
        }
    })
    document.querySelectorAll('.filters').forEach((element) => {
        element.onclick = function () {
            document.getElementById('keyword').value = this.innerText.trim();
            document.getElementById('keyword').dispatchEvent(new Event('input'));
            document.getElementById('filter_close').click();
        }
    })

    window.onload = () => {
        tmpObj.fetchClasses()
    };

    let tmpObj = null;

    function classSeach() {
        return tmpObj = {
            keyword: '{{request()->get('keyword')}}',
            isLoading: false,
            fetchClasses() {
                if (this.keyword === '') {
                    document.getElementById("search_result_info").classList.add('hidden');
                    document.getElementById("popular").classList.remove('hidden');
                    document.getElementById("search_results").innerHTML = "";
                    return;
                }
                this.isLoading = true;
                fetch(`{{ env('APP_URL') }}/api/classes/${this.keyword}`)
                    .then(res => res.json())
                    .then(data => {
                        const result_container = document.getElementById("search_results");
                        result_container.innerHTML = "";
                        this.isLoading = false;
                        document.getElementById("search_result_info").classList.remove('hidden');
                        document.getElementById("popular").classList.add('hidden');
                        document.getElementById("search_result_count").innerText = data.length + ' Results'
                        data.forEach((row) => {
                            const clone = document.getElementById("search_item_template").cloneNode(true);

                            clone.id = '';
                            clone.classList.remove("hidden");
                            clone.querySelector("[data-name='image']").style.backgroundImage = "url('" + row.hero_image_url + "')";
                            clone.querySelector("[data-name='title']").innerText = row.title;
                            clone.querySelector("[data-name='owner']").innerText = row.owner.name;
                            clone.querySelector("[data-name='duration']").innerText = row.duration + " min";
                            clone.onclick = ( ) => {
                                location.href = "{{ route("classInfo", "") }}/" + row.id;
                            };
                            row.user_reviews.reduce((count, review) => {
                                const item = document.createElement('div');
                                item.classList.add('inline-block', 'rounded-full', 'bg-no-repeat', 'bg-center', 'bg-cover');
                                item.style.width = '30px';
                                item.style.height = '30px';
                                item.style.marginLeft = '-12px';
                                item.style.backgroundImage = "url('" + review.user.hero_image_url + "')";
                                clone.querySelector("[data-name='reviews']").append(item);
                                return count++;
                            }, 0);

                            result_container.appendChild(clone);

                        });
                    });
            }
        }
    }
</script>
