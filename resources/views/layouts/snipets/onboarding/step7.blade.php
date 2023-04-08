<div x-show="step === 7" class="font-semibold flex flex-col justify-between pt-5">

    @include('layouts.snipets.onboarding.heading', ['slot' => 'Great! Let’s setup your account'])

    <div class="mt-5">
        Email
    </div>

    <div class="mt-2">
        <x-input class="text-min" x-on:keyup="errorMsg = ''" x-model="info.email" placeholder="Email"></x-input>
    </div>

    <div class="mt-5">
        Password
    </div>

    <div class="mt-2">
        <x-input class="text-min" x-on:keyup="errorMsg = ''" x-model="info.pwd" placeholder="Password" type="password"></x-input>
    </div>

    <div x-text="errorMsg" class="text-red-500 mt-5 font-normal text-sm"></div>

    <x-button @click="register" class="w-full bg-secondary text-white rounded mt-10">
        Create an account
    </x-button>

    <div class="text-gray-400 mt-10 text-center font-normal">
        By creating an account, you agree to our <br>
        <a class="text-black font-semibold" href="https://www.myfoodandfamily.com/useragreement" target="_blank">Term of
            use</a>
        and
        <a class="text-black font-semibold" href="https://www.myfoodandfamily.com/privacynotice" target="_blank">Privacy
            Policy</a>
    </div>
</div>
