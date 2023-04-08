<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateClassSubcategoryTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('class_subcategory', function (Blueprint $table) {
            $table->id();
            $table->foreignId('subcategory_id')
                ->constrained('subcategories')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->foreignId('class_id')
                ->constrained('classes')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('class_subcategory');
    }
}
