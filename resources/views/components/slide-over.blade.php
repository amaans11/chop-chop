<div x-data="slideOver('{{ $attributes->get('id') }}')" x-show="isVisible" x-cloak
    class="absolute inset-0 overflow-hidden z-30">
    <div class="fixed inset-0 overflow-hidden">
        <div :class="{'opacity-1': isOpen, 'opacity-0': !isOpen}"
            class="absolute inset-0 bg-gray-500 bg-opacity-75 transition-opacity duration-700" x-on:click="toggle"></div>
        <div class="absolute inset-0 pointer-events-none">
            <div class="fixed inset-y-0 bottom-0 mt-20 w-full flex justify-center pointer-events-none">
                <div :class="{'translate-y-0': isOpen, 'translate-y-full': !isOpen}"
                    class="max-w-lg w-full transform transition ease-in-out duration-500 sm:duration-700 pointer-events-auto">
                    <div class="h-full flex flex-col pt-6 bg-white shadow-xl overflow-y-auto rounded-t-3xl">
                        <div class="relative flex-1 sm:px-6">
                            <div class="absolute inset-0  sm:px-6">
                                <div class="h-full relative">
                                    {{ $slot }}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('alpine:init', () => {
            Alpine.data('slideOver', id => ({
                isOpen: false,
                isVisible: false,

                init: function() {
                    window.addEventListener('toggleSlideOver', event => {
                        if (event.detail === id) {
                            this.toggle();
                        }
                    });
                },

                toggle: function() {
                    if (this.isVisible) {
                        this.isOpen = false;
                        setTimeout(() => {
                            this.isVisible = false;
                        }, 700);
                    } else {
                        this.isVisible = true;
                        this.$nextTick(() => {
                            // $nextTick doesn't seem to be working correctly all the time so timeout is backup for it
                            setTimeout(() => {
                                this.isOpen = true;
                            }, 50);
                        });
                    }
                }
            }));
        });
    </script>
</div>
