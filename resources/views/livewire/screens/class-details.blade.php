<div class="bg-white shadow overflow-hidden sm:rounded-lg">
    <div class="px-4 py-5 sm:px-6">
        <h3 class="text-lg leading-6 font-medium text-gray-900">
            {{ $class->title }}
        </h3>
        <p class="mt-1 max-w-2xl text-sm text-gray-500">
            {{ $class->description }}
        </p>
    </div>

    <div class="px-5 my-5">
        <img class="w-full rounded-lg" src="{{ $class->hero_image?->getUrl() }}" />
    </div>
    <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
        <dl class="sm:divide-y sm:divide-gray-200">
            <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                <dt class="text-sm font-medium text-gray-500">
                    Owner
                </dt>
                <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                    {{ $class->owner->name }}
                </dd>
            </div>

            <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                <dt class="text-sm font-medium text-gray-500">
                    Meetings
                </dt>
                <div class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                    <div class="border border-gray-200 rounded-md divide-y divide-gray-200">
                        <div class="pl-3 pr-4 py-3 flex flex-col items-center justify-between text-sm">
                            @foreach ($class->meetings as $meeting)
                                <a class="w-full"
                                    href="{{ route('meeting_details', ['id' => $meeting->id]) }}">
                                    <div class="relative mx-4 my-3 flex">
                                        <img class="h-10 rounded-lg" src="{{ $meeting->hero_image?->getUrl() }}" />
                                        <div class="font-bold ml-5">
                                            <div class="text-gray-600">
                                                {{ $meeting->title }}
                                            </div>
                                            <div class="text-xs font-normal text-gray-400">
                                                {{ $meeting->time }}
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </dl>
    </div>
</div>
