<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class Subcategory extends Model implements HasMedia
{
    use HasFactory;
    use InteractsWithMedia;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'subcategories';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'category_id', 'title', 'description',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [];

    protected $attributes = [];

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }

    public function classes()
    {
        return $this->belongsToMany(
            Classes::class,
            'class_subcategory',
            'subcategory_id',
            'class_id'
        );
    }
    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('subcategories_hero_image')->useDisk('public')->singleFile();
    }

    public function getHeroImageAttribute()
    {
        return $this->getMedia('subcategories_hero_image')->first();
    }

    public function getHeroImageUrlAttribute()
    {
        return $this->getMedia('subcategories_hero_image')->first()?->getUrl();
    }
}
