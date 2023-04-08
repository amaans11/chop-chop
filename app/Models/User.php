<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\AsCollection;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Fortify\TwoFactorAuthenticatable;
use Laravel\Jetstream\HasProfilePhoto;
use Laravel\Jetstream\HasTeams;
use Laravel\Sanctum\HasApiTokens;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\Tags\HasTags;
use Spark\Billable;


class User extends Authenticatable implements HasMedia
{
    use HasApiTokens;
    use HasFactory;
    use HasProfilePhoto;
    use HasTeams;
    use Notifiable;
    use TwoFactorAuthenticatable;
    use InteractsWithMedia;
    use HasTags;
    use Billable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'facebook_id', 'data', 'role','credits'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
        'two_factor_recovery_codes',
        'two_factor_secret',
        'role',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'data' => AsCollection::class,
    ];

    protected $attributes = [
        'data' => '{}',
    ];

    /**
     * The accessors to append to the model's array form.
     *
     * @var array
     */
    protected $appends = [
        'profile_photo_url',
        'hero_image_url',
    ];

    public function addNew($input)
    {
        $check = static::where('facebook_id', $input['facebook_id'])->first();

        if (is_null($check)) {
            return static::create($input);
        }

        return $check;
    }

    public function isAdmin(): bool
    {
        return $this->role === 'admin';
    }

    public function classes(): HasMany
    {
        return $this->hasMany(Classes::class);
    }

    public function meetings(): BelongsToMany
    {
        return $this->belongsToMany(Meetings::class, 'meetings');
    }

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('users')->useDisk('public')->singleFile();
    }

    public function getHeroImageAttribute()
    {
        return $this->getMedia('users')->first();
    }

    public function getHeroImageUrlAttribute()
    {
        return $this->getMedia('users')->first()?->getUrl();
    }
}
