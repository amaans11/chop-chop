<div class="h-24 bg-white shadow-xl fixed bottom-0 left-0 w-screen flex justify-around items-center lg:justify-center">
    <a href="{{ route('dashboard') }}" class="text-center lg:mx-10">
        <img class="inline w-6 h-6 " src="{{ asset('images/icons/explore.svg') }}" />
        <br>
        <span class="text-sm font-bold text-gray-500 font-sans">Explore</span>
    </a>

    <a href="{{ route('account') }}" class="text-center lg:mx-10">
        <img class="inline w-6 h-6" src="{{ asset('images/icons/profile.svg') }}" />
        <br>
        <span class="text-sm font-bold text-gray-500 font-sans">Account</span>
    </a>
</div>
