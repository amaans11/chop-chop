<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddSlugColumnToTables extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('classes', function (Blueprint $table) {
            $table->string('slug')->nullable();
        });
        Schema::table('user_reviews', function (Blueprint $table) {
            $table->string('slug')->nullable();
        });
        Schema::table('categories', function (Blueprint $table) {
            $table->string('slug')->nullable();
        });
        Schema::table('subcategories', function (Blueprint $table) {
            $table->string('slug')->nullable();
            $table->string('category_slug')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('classes', function (Blueprint $table) {
            $table->dropColumn('slug');
        });
        Schema::table('user_reviews', function (Blueprint $table) {
            $table->dropColumn('slug');
        });
        Schema::table('categories', function (Blueprint $table) {
            $table->dropColumn('slug');
        });
        Schema::table('subcategories', function (Blueprint $table) {
            $table->dropColumn('slug');
        });
    }
}
