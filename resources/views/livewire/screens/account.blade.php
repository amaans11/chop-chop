<div class="flex flex-col min-body justify-between">
    <div class="flex items-center bg-purple-default h-24 px-4">
        <div class="flex lg:justify-center w-1/7">
            <div wire:click="backHandler">
                <i class="fas fa-chevron-left text-lg text-white"></i>
            </div>

            <div class="text-xl ml-6 font-semibold text-white">
                Account
            </div>
        </div>
    </div>
    <div class="p-4">
        <div class="lg:w-1/4 mx-auto">
            <a href=" {{ route('privacyPolicy') }}">
                <div class="font-semibold font-sans border-b border-gray-400 py-5">
                    Privacy Policy
                </div>
            </a>
            <a href="{{ route('termsOfUse') }}">
                <div class="font-semibold font-sans border-b border-gray-400 py-5">
                    Terms of use
                </div>
            </a>

            <a href="{{ route('logout') }}">
                <div class="font-semibold font-sans py-5">
                    Logout
                </div>
            </a>
        </div>
    </div>


    <x-slide-over id="terms_of_use">
        <h1 class="font-semibold text-xl mb-8">
            Terms of use
        </h1>
        <h2 class="font-semibold mb-5">
            What Data We Collect
        </h2>

        <span class="font-semibold">General Data:</span> The use of our services will automatically create information
        that will be collected. For example, when you use our
        Services, your geographic location, how you use the Services, information about the type of device you use, your
        Open Device
        Identification Number, date/time stamps for your visit, your unique device identifier, your browser type,
        operating system, Internet
        Protocol (IP) address, and domain name are all collected. This information is generally used to help us deliver
        the most relevant
        information to you and administer and improve the Site.
        <br><br>

        <span class="font-semibold">Log Files:</span> As is true of most websites, we gather certain information
        automatically and store it in log files. This information includes
        IP addresses, browser type, Internet service provider (ISP), referring/exit pages, operating system, date/time
        stamp, and
        clickstream data. We use this information to maintain and improve the performance of the
        <br><br>

        <span class="font-semibold">Services.</span>
        <br>
        Analytics: We use analytics services (including, but not limited to, Google Analytics) to help analyze how users
        use the Site.
        Analytics services use Cookies to collect information such as how often users visit the Site and we use the
        information to improve
        our Site and Services. The analytics services' ability to use and share information collected by them is
        restricted by their terms of
        use and privacy policy, which you should refer to for more information about how these entities use this
        information.
        Location Information: If you have enabled location services on your mobile device, we may collect your location
        information to
        improve the Services we offer. If you do not want this information collected, you can disable location services
        on your device.
        Cookies: “Cookies” are small pieces of information (text files) that a website sends to your computer’s hard
        drive while you are
        viewing the website. These text files can be used by websites to make the users experience more efficient. The
        law states that we
        can store these cookies on your device if they are strictly necessary for the operation of this site. For all
        other types of cookies we
        need your permission. To that end, this site uses different types of cookies. Some cookies are placed by third
        party services that
        appear on our pages. We and some third parties may use both session Cookies (which expire once you close your
        web browser)
        and persistent Cookies (which stay on your computer until you delete them) to provide you with a more personal
        and interactive
        experience on our Services and to market the Services or other products. Marketing cookies are used to track
        visitors across
        websites. The intention is to display ads that are relevant and engaging for the individual user and thereby
        more valuable for
        publishers and third party advertisers. This tracking is done on an anonymous basis and, while not an exhaustive
        list, some of the
        companies we work with are Google, AppNexus, Criteo, Rubicon, Pubmatic and DistrictM. To learn more about this
        practice,
        including the Self Regulatory Principles for Online Advertising, to which we adhere, you can visit
        www.aboutads.info/choices,
        optout.networkadvertising.org and www.youronlinechoices.com
    </x-slide-over>

    <x-slide-over id="privacy_policy">
        <h1 class="font-semibold text-xl mb-8">
            Privacy Policy
        </h1>
        <h2 class="font-semibold mb-5">
            What Data We Collect
        </h2>

        <span class="font-semibold">General Data:</span> The use of our services will automatically create information
        that will be collected. For example, when you use our
        Services, your geographic location, how you use the Services, information about the type of device you use, your
        Open Device
        Identification Number, date/time stamps for your visit, your unique device identifier, your browser type,
        operating system, Internet
        Protocol (IP) address, and domain name are all collected. This information is generally used to help us deliver
        the most relevant
        information to you and administer and improve the Site.
        <br><br>

        <span class="font-semibold">Log Files:</span> As is true of most websites, we gather certain information
        automatically and store it in log files. This information includes
        IP addresses, browser type, Internet service provider (ISP), referring/exit pages, operating system, date/time
        stamp, and
        clickstream data. We use this information to maintain and improve the performance of the
        <br><br>

        <span class="font-semibold">Services.</span>
        <br>
        Analytics: We use analytics services (including, but not limited to, Google Analytics) to help analyze how users
        use the Site.
        Analytics services use Cookies to collect information such as how often users visit the Site and we use the
        information to improve
        our Site and Services. The analytics services' ability to use and share information collected by them is
        restricted by their terms of
        use and privacy policy, which you should refer to for more information about how these entities use this
        information.
        Location Information: If you have enabled location services on your mobile device, we may collect your location
        information to
        improve the Services we offer. If you do not want this information collected, you can disable location services
        on your device.
        Cookies: “Cookies” are small pieces of information (text files) that a website sends to your computer’s hard
        drive while you are
        viewing the website. These text files can be used by websites to make the users experience more efficient. The
        law states that we
        can store these cookies on your device if they are strictly necessary for the operation of this site. For all
        other types of cookies we
        need your permission. To that end, this site uses different types of cookies. Some cookies are placed by third
        party services that
        appear on our pages. We and some third parties may use both session Cookies (which expire once you close your
        web browser)
        and persistent Cookies (which stay on your computer until you delete them) to provide you with a more personal
        and interactive
        experience on our Services and to market the Services or other products. Marketing cookies are used to track
        visitors across
        websites. The intention is to display ads that are relevant and engaging for the individual user and thereby
        more valuable for
        publishers and third party advertisers. This tracking is done on an anonymous basis and, while not an exhaustive
        list, some of the
        companies we work with are Google, AppNexus, Criteo, Rubicon, Pubmatic and DistrictM. To learn more about this
        practice,
        including the Self Regulatory Principles for Online Advertising, to which we adhere, you can visit
        www.aboutads.info/choices,
        optout.networkadvertising.org and www.youronlinechoices.com

    </x-slide-over>

    @if ($class)
        <x-slide-over id="upcoming_classes">
            <h1 class="font-semibold text-xl mb-8">
                Upcoming Classes
            </h1>
            <div class="flex flex-col min-h-screen">
                <div class="border mt-4">
                    <div class=" p-4 mt-4">
                        <div class="flex">
                            <div class="bg-no-repeat bg-center bg-cover w-20 h-20 rounded"
                                style="background-image: url('{{ $class->hero_image?->getUrl() }}');min-width:100px;">
                            </div>
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
        </x-slide-over>
    @endif
</div>
