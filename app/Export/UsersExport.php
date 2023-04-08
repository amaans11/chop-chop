<?php

namespace app\Export;

use App\Models\User;
use DateTime;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class UsersExport implements FromCollection, WithMapping, WithHeadings, ShouldAutoSize
{
    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return User::all();
    }

    public function map($user): array
    {
        $slot= $user->data?->get('slot_selection') ? $user->data?->get('slot_selection')['slot'] ?? null : null;
        $selectedDate= $user->data?->get('slot_selection') ? $user->data?->get('slot_selection')['selected_date'] ?? null : null;
        $timeSlot= $user->data?->get('slot_selection') ? $user->data?->get('slot_selection')['time_slot'] ?? null : null;
        $currentDate= $user->data?->get('slot_selection') ? $user->data?->get('slot_selection')['current_date'] ?? null : null;
        $selectedDay = $selectedDate  ? DateTime::createFromFormat('d-m-Y',$selectedDate )->format('l') : null;
       
        return [
            $user->id,
            $user->name,
            $user->data?->get('info')['age'] ?? null,
            $user->data?->get('info')['gender'] ?? null,
            $user->data?->get('info')['city'] ?? null,
            $user->data?->get('info')['zip'] ?? null,
            $user->data?->get('selections')['step_2'] ?? null,
            $user->data?->get('selections')['step_3']['selection'] ?? null,
            $user->data?->get('selections')['step_3']['sub_selection'] ?? null,
            $user->data?->get('selections')['step_4']['selection'] ?? null,
            implode('|', $user->data?->get('selections')['step_4']['sub_selection'] ?? []),
            $user->data?->get('selections')['step_5'] ?? null,
            implode('|', $user->data?->get('selections')['step_6'] ?? []),
            $user->email,
            $user->data?->get('subCategory') ?? null,
            $user->data?->get('cuisine') ?? null,
            $user->data?->get('result-selection') ?? null,
            $user->data?->get('class') ?? null,
            $slot  ."|". $selectedDate ."|". $timeSlot . "|". $currentDate . "|".  $selectedDay,
            $user->data?->get('review') ?? null,
            $user->data?->get('source_id'),

        ];
    }

    public function headings(): array
    {
        return [
            '#',
            'Name',
            'Age',
            'Gender',
            'City',
            'Zip Code',
            'Step 2 selection',
            'Step 3 selection',
            'Step 3 sub-selection',
            'Step 4 selection',
            'Step 4 sub-selection',
            'Step 5 selection',
            'Step 6 selections',
            'Email',
            'Browse selection',
            'Cuisine Selection',
            'Result Selection',
            'Detail Selection',
            'Confirm Slot Selection',
            'Result & Confirm Selection',
            'Source ID',
        ];
    }
}
