<div
    class="relative w-56 h-44 p-2 rounded relative flex flex-col items-start justify-start bg-no-repeat bg-center bg-cover"
    style="background-image: url('{{ $subcategory->hero_image_url }}')">

    <div class="rounded absolute w-full h-full top-0 left-0"
         style="background: radial-gradient(at top left, rgba(255,255,255,1) 0%, rgba(255,255,255,0.5) 68%, rgba(255,255,255,0) 100%);">
    </div>

    <div class="relative mt-2 font-semibold text-xl line-clamp-2">
        {{ $subcategory->title }}
    </div>

    <div class="relative mt-2 relative font-semibold text-sm">
        {{ $subcategory->classes_count }} classes
    </div>

</div>
