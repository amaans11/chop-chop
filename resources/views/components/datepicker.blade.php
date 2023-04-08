<div class=" antialiased sans-serif ">
    <div x-cloak wire:ignore x-data="app()" x-init="[initDate(), getNoOfDays()]">
        <div class="container mx-auto md:py-10">
            <div class="mb-5">
                <div class="">
                    <div class="bg-white w-full mt-4 rounded-lg shadow p-4" style="height:310px;">
                        <div class="flex justify-between items-center mb-2" style="height:64px;">
                            <div>
                                <span x-text="MONTH_NAMES[month]" class="text-lg font-bold text-gray-800"></span>
                                <span x-text="year" class="ml-1 text-lg text-gray-600 font-normal"></span>
                            </div>
                            <div>
                                <button type="button"
                                        class="focus:outline-none focus:shadow-outline transition ease-in-out duration-100 inline-flex cursor-pointer hover:bg-gray-100 p-1 rounded-full"
                                        @click="if (month == 0) {
												year--;
												month = 12;
											} month--; getNoOfDays()">
                                    <svg class="h-6 w-6 text-gray-400 inline-flex" fill="none" viewBox="0 0 24 24"
                                         stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M15 19l-7-7 7-7"/>
                                    </svg>
                                </button>
                                <button type="button"
                                        class="focus:outline-none focus:shadow-outline transition ease-in-out duration-100 inline-flex cursor-pointer hover:bg-gray-100 p-1 rounded-full"
                                        @click="if (month == 11) {
												month = 0;
												year++;
											} else {
												month++;
											} getNoOfDays()"
                                >
                                    <svg class="h-6 w-6 text-gray-400 inline-flex" fill="none" viewBox="0 0 24 24"
                                         stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M9 5l7 7-7 7"/>
                                    </svg>
                                </button>
                            </div>
                        </div>

                        <div class="flex flex-wrap mb-3 -mx-1">
                            <template x-for="(day, index) in DAYS" :key="index">
                                <div style="width: 14.26%" class="px-0.5">
                                    <div x-text="day" class="text-gray-800 font-medium text-center text-xs"></div>
                                </div>
                            </template>
                        </div>

                        <div class="flex flex-wrap -mx-1 " style="height:200px;">
                            <template x-for="blankday in blankdays">
                                <div style="width: 14.28%"
                                     class="text-center border p-1 border-transparent text-sm"></div>
                            </template>
                            <template x-for="(date, dateIndex) in no_of_days" :key="dateIndex">
                                <div style="width: 14.28%" class="px-1 mb-1">
                                    <div @click="getDateValue(date)"
                                         x-text="date"
                                         class="cursor-pointer text-center text-sm leading-none rounded-full leading-loose transition ease-in-out duration-100"
                                         :class="{
                      'bg-indigo-200': isToday(date) == true,
                      'text-gray-300': isBeforeToday(date),
                      'text-gray-600': isToday(date) == false && isSelectedDate(date) == false,
                      'bg-secondary text-white hover:bg-opacity-75': isSelectedDate(date) == true
                    }"></div>
                                </div>
                            </template>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        const MONTH_NAMES = [
            "January",
            "February",
            "March",
            "April",
            "May",
            "June",
            "July",
            "August",
            "September",
            "October",
            "November",
            "December",
        ];
        const MONTH_SHORT_NAMES = [
            "Jan",
            "Feb",
            "Mar",
            "Apr",
            "May",
            "Jun",
            "Jul",
            "Aug",
            "Sep",
            "Oct",
            "Nov",
            "Dec",
        ];
        const DAYS = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

        function app() {
            return {
                showDatepicker: true,
                datepickerValue: "",
                selectedDate: new Date(),
                dateFormat: "DD-MM-YYYY",
                month: "",
                year: "",
                no_of_days: [],
                blankdays: [],

                initDate() {
                    let today;
                    if (this.selectedDate) {
                        today = new Date(Date.parse(this.selectedDate));
                    } else {
                        today = new Date();
                    }
                    this.month = today.getMonth();
                    this.year = today.getFullYear();
                    this.datepickerValue = this.formatDateForDisplay(
                        today
                    );
                },
                formatDateForDisplay(date) {
                    let formattedDay = DAYS[date.getDay()];
                    let formattedDate = ("0" + date.getDate()).slice(
                        -2
                    ); // appends 0 (zero) in single digit date
                    let formattedMonth = MONTH_NAMES[date.getMonth()];
                    let formattedMonthShortName =
                        MONTH_SHORT_NAMES[date.getMonth()];
                    let formattedMonthInNumber = (
                        "0" +
                        (parseInt(date.getMonth()) + 1)
                    ).slice(-2);
                    let formattedYear = date.getFullYear();
                    if (this.dateFormat === "DD-MM-YYYY") {
                        return `${formattedDate}-${formattedMonthInNumber}-${formattedYear}`; // 02-04-2021
                    }
                    if (this.dateFormat === "YYYY-MM-DD") {
                        return `${formattedYear}-${formattedMonthInNumber}-${formattedDate}`; // 2021-04-02
                    }
                    if (this.dateFormat === "D d M, Y") {
                        return `${formattedDay} ${formattedDate} ${formattedMonthShortName} ${formattedYear}`; // Tue 02 Mar 2021
                    }
                    return `${formattedDay} ${formattedDate} ${formattedMonth} ${formattedYear}`;
                },
                isSelectedDate(date) {
                    const d = new Date(this.year, this.month, date);
                    return this.datepickerValue ===
                    this.formatDateForDisplay(d) ?
                        true :
                        false;
                },
                isToday(date) {
                    const today = new Date();
                    const d = new Date(this.year, this.month, date);
                    return today.toDateString() === d.toDateString() ?
                        true :
                        false;
                },
                isBeforeToday(date){
                    const today = new Date();
                    today.setHours(0,0,0,0);
                    const d = new Date(this.year, this.month, date);
                    return d.getTime() < today.getTime();
                },
                getDateValue(date) {
                    if (this.isBeforeToday(date)) return;
                    let selectedDate = new Date(
                        this.year,
                        this.month,
                        date
                    );
                    this.datepickerValue = this.formatDateForDisplay(selectedDate);

                    // Update livewire property
                    this.$wire.set('datepickerValue', this.datepickerValue);

                    this.isSelectedDate(date);
                    this.showDatepicker = false;
                },
                getNoOfDays() {
                    let daysInMonth = new Date(
                        this.year,
                        this.month + 1,
                        0
                    ).getDate();
                    // find where to start calendar day of week
                    let dayOfWeek = new Date(
                        this.year,
                        this.month
                    ).getDay();
                    let blankdaysArray = [];
                    for (var i = 1; i <= dayOfWeek; i++) {
                        blankdaysArray.push(i);
                    }
                    let daysArray = [];
                    for (var i = 1; i <= daysInMonth; i++) {
                        daysArray.push(i);
                    }
                    this.blankdays = blankdaysArray;
                    this.no_of_days = daysArray;
                },
            };
        }
    </script>
</div>
