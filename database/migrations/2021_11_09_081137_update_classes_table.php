<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateClassesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('classes', function (Blueprint $table) {
            $table->dropColumn('tier');

            $table->string('short_description')->nullable();
            $table->text('description')->nullable()->change();
            $table->text('ingredients')->nullable();
            $table->text('steps')->nullable();
            $table->text('utensils')->nullable();

            $table->string('level')->default('Beginner');

            $table->integer('duration');
            $table->decimal('price');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function ($table) {
            $table->dropColumn(['ingredients', 'steps', 'utensils', 'level', 'duration', 'price']);
        });
    }
}
