<?php

namespace App\Models;

use App\Traits\FullTextSearch;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class Classes extends Model implements HasMedia
{
    use InteractsWithMedia, FullTextSearch;

    protected $searchable = [
        'title',
        'description'
    ];

    protected $fillable = [
        'owner_id',
        'title',
        'short_description',
        'description',
        'ingredients',
        'steps',
        'utensils',
    ];

    protected $appends = ['hero_image_url'];

    public function registerMediaConversions(Media $media = null): void
    {
        $this->addMediaConversion('thumb')
            ->width(368)
            ->height(232)
            ->sharpen(10);
    }

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('classes_hero_image')->useDisk('public')->singleFile();
    }

    public function owner(): BelongsTo
    {
        return $this->belongsTo(User::class, 'owner_id', 'id');
    }

    public function userReviews(): HasMany
    {
        return $this->hasMany(UserReview::class, 'class_id', 'id');
    }

    public function getHeroImageAttribute()
    {
        return $this->getMedia('classes_hero_image')->first();
    }

    public function getHeroImageUrlAttribute()
    {
        return $this->getMedia('classes_hero_image')->first()?->getUrl();
    }

    public function getAverageReview()
    {
        $sum = $this->userReviews->reduce(fn($sum, $item) => $sum + $item->rate, 0);
        $count = $this->userReviews->count() > 0 ? $this->userReviews->count() : 1;

        
        return $sum/$count;
    }

    public function subCategories()
    {
        return $this->belongsToMany(
            Subcategory::class,
            'class_subcategory',
            'class_id',
            'subcategory_id'
        );
    }
}
