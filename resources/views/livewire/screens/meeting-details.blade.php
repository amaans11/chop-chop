<div class="bg-white shadow overflow-hidden sm:rounded-lg">
    <div class="px-4 py-5 sm:px-6">
        <h3 class="text-lg leading-6 font-medium text-gray-900">
            {{ $meeting->class->title }}
        </h3>
        <p class="mt-1 max-w-2xl text-sm text-gray-500">
            {{ $meeting->time }}
        </p>
    </div>

    <div class="px-5 my-5">
        <img class="w-full rounded-lg" src="{{ $meeting->hero_image?->getUrl() }}"/>
    </div>
    <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
        <dl class="sm:divide-y sm:divide-gray-200">
            <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                <dt class="text-sm font-medium text-gray-500">
                    Class
                </dt>
                <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                    {{ $meeting->class->title }}
                </dd>
            </div>

            <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                <dt class="text-sm font-medium text-gray-500">
                    Participants
                </dt>
                <div class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                    <div class="border border-gray-200 rounded-md divide-y divide-gray-200">
                        <div class="pl-3 pr-4 py-3 flex flex-col items-start justify-start text-sm">
                            @foreach ($meeting->participants as $user)
                                    <div class="relative mx-4 my-3 flex">
                                        <div class="font-bold ml-5">
                                            <div class="text-gray-600">
                                                {{ $user->name }}
                                            </div>
                                            <div class="text-xs font-medium text-gray-500">
                                                {{ $user->email }}
                                            </div>
                                        </div>
                                    </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </dl>
    </div>
</div>

