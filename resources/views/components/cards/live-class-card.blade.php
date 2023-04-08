<div class="flex flex-col rounded-2xl overflow-hidden bg-accent justify-between" style="width:80vw;height:450px">
    <div class="bg-no-repeat bg-center bg-cover w-full h-40"
         style="background-image: url('{{$class->hero_image?->getUrl()}}')">
    </div>

    <div class="m-3">
        <div class="font-semibold text-xl">
            {{ $class->title }}
        </div>

        <div class="line-clamp-2 mt-2">
            {{ $class->description }}
        </div>

        <div class="mt-5 w-full rounded border border-accent-dark flex bg-accent-light justify-around">
            <div class="my-3">
                <div class="font-semibold">
                    Duration
                </div>
                <div class="font-bold text-xl">
                    {{ $class->duration }} mins
                </div>
            </div>
            <div class="my-3">
                <div class="font-semibold">
                    Difficulty
                </div>
                <div class="font-bold text-xl">
                    {{ $class->level }}
                </div>
            </div>
        </div>
    </div>
    <div class="w-full bg-primary-dark px-5 flex h-16 flex items-center text-white">
        <div class="relative flex w-9 h-9 bg-no-repeat bg-center bg-cover rounded-full mr-3"
             style="background-image: url('{{$class->owner->hero_image_url}}')">
            <div class="relative rounded-full bg-primary w-4 h-4 flex justify-center items-center"
                 style="top:23px;left:23px">
                <img src="{{ asset('images/chef.png') }}"/>
            </div>
        </div>
        <div>
            <div class="font-semibold">
                {{ $class->owner->name }}
            </div>
            <div class="flex w-auto">
                <img src="{{asset('images/star.png')}}" class="h-5"/>
                <div class="text-white-500"> {{$class->getAverageReview()}} </div>
            </div>
        </div>
    </div>
</div>
