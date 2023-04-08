<?php

use App\Http\Controllers\Auth\FacebookController;
use App\Http\Controllers\ClassesController;
use App\Http\Controllers\ExportController;
use App\Http\Controllers\Register;
use App\Http\Livewire\Screens\Account;
use App\Http\Livewire\Screens\ClassDetails;
use App\Http\Livewire\Screens\Classes;
use App\Http\Livewire\Screens\ClassInfo;
use App\Http\Livewire\Screens\Confirmation;
use App\Http\Livewire\Screens\Dashboard;
use App\Http\Livewire\Screens\Login;
use App\Http\Livewire\Screens\MeetingDetails;
use App\Http\Livewire\Screens\Meetings;
use App\Http\Livewire\Screens\MyClasses;
use App\Http\Livewire\Screens\Onboarding;
use App\Http\Livewire\Screens\Review;
use App\Http\Livewire\Screens\Cuisines;
use App\Http\Livewire\Screens\SessionType;
use App\Http\Livewire\Screens\Search;
use App\Http\Livewire\Screens\PrivacyPolicy;
use App\Http\Livewire\Screens\TermsOfUse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

Route::get('auth/facebook', [FacebookController::class, 'redirectToFacebook']);
Route::get('auth/facebook/callback', [FacebookController::class, 'handleFacebookCallback']);

Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
    return view('dashboard');
})->name('dashboard');

Route::get('/logout', function (Request $request) {
    Auth::logout();
    $request->session()->invalidate();
    $request->session()->regenerateToken();

    return redirect()->route('home');
});

// Screens
Route::middleware(['guest'])->group(function () {
    Route::get('/', function () {
        return view('unbounce', ['slug' => 'home']);
    })->name('home');
    Route::get('/signup', Onboarding::class)->name('onboarding');
    Route::get('/login', Login::class)->name('login');
});

Route::middleware(['auth'])->group(function () {
    Route::get('/session-type', SessionType::class)->name('sessionType');
    Route::get('/cuisines', Cuisines::class)->name('cuisines');
    Route::get('/dashboard', Dashboard::class)->name('dashboard');
    Route::get('/search', Search::class)->name('search');
    Route::get('/account', Account::class)->name('account');
    Route::get('/classes', Classes::class)->name('classes');
    Route::get('/meetings', Meetings::class)->name('meetings');
    Route::get('/class-details/{id}', ClassDetails::class)->name('classDetails');
    Route::get('/meeting-details/{id}', MeetingDetails::class)->name('meetingDetails');
    Route::get('/class/{id}', ClassInfo::class)->name('classInfo');
    Route::get('/review', Review::class)->name('review');
    Route::get('/confirmation', Confirmation::class)->name('confirmation');
    Route::get('/my-classes', MyClasses::class)->name('myClasses');
    Route::get('/privacy-policy', PrivacyPolicy::class)->name('privacyPolicy');
    Route::get('/terms-of-use', TermsOfUse::class)->name('termsOfUse');

    Route::prefix('/api')->group(function () {
        Route::get('/classes/{keyword}', [ClassesController::class, 'search']);
        Route::post('/register', [Register::class, 'register'])->withoutMiddleware(['auth']);
    });
});

//unbounce
Route::get('/u/{slug}', function ($slug) {
    return view('unbounce', ['slug' => $slug]);
})->name('unbounce');

Route::get('/export/users', [ExportController::class, 'users'])
    ->name('export.users');
