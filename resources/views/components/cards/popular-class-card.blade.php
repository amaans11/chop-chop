<div class="w-32 h-44 p-2 rounded relative flex flex-col items-start justify-end bg-no-repeat bg-center bg-cover"
     style="background-image: url('{{ $subcategory->hero_image_url }}')">
    <div class="rounded absolute w-full h-full top-0 left-0 bg-opacity-75"
         style="background-color: rgba({{ rand(0,100) }},{{ rand(0,100) }},{{ rand(0,100) }},0.75)">
    </div>

    <div class="relative text-white font-medium text-xl line-clamp-2">
        {{ $subcategory->title }}
    </div>

    <div class="relative text-white font-normal text-sm">
        {{ $subcategory->classes_count }} classes
    </div>
</div>
