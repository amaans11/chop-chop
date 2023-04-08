<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Request;

class Register extends Controller
{
    public function __construct()
    {
    }

    public const ONBOARDING_DATA = [
        '',
        '',
        [
            'Beginner',
            'Intermediate',
            'Advanced'
        ],
        [
            'Not really',
            'Loose weight',
            'Gain weight',
            'Maintain weight',
            'sub' => [
                'up to 5kg',
                'up to 10kg',
                'more than 10kg'
            ]
        ],
        [
            'Yes, for general health',
            'Yes, to manage an allergy',
            'Yes, to manage a chronic condition',
            'Yes, for a religious concern',
            'Not at all',
            'sub' => [
                [
                    'Increase vitality',
                    'Clean liver',
                    'Balance hormones',
                    'Gut health',
                    'Other',
                ],
                [
                    'Wheat',
                    'Gluten',
                    'Lactose',
                    'Eggs',
                    'Tree Nut',
                    'Peanuts',
                    'Shellfish',
                    'Soy',
                    'Fish',
                    'Other',
                ],
                [
                    'Cancer',
                    'Cardiovascular',
                    'Diabetes',
                    'Osteoporosis',
                    'Obesity',
                ],
                [
                    'Islam',
                    'Hinduism',
                    'Sikhism',
                    'Judaism',
                ]
            ]
        ],
        [
            'I’ve followed a specific diet for +2 years',
            'I’ve started a specific diet in the last 2 years',
            'I’m interested in following a specific diet but haven’t started yet',
            'I’m not interested in following any specific diet',
        ],
        [
            'Plant-based',
            'Low Sugar / Sugar-free',
            'Religious restrictions',
            'Allergy or intolerance-based',
            'Weight loss / Calorie restricted',
            'Weight gain',
            'Low Carb',
            'Heart Healthy',
            'Heart Healthy',
            'Fasting / Detox',
            'Fasting / Detox',
            'None of the above',
        ]
    ];

    public function register()
    {
        $request_data = Request::all();
        $selections = [];
        $info = $request_data['info'];

        if(!filter_var($info['email'], FILTER_VALIDATE_EMAIL)) return response()->json(['errors' => 'Enter valid email address']);
        if (User::where('email',$info['email'])->exists()) return response()->json(['errors' => 'User with this email is already registered']);
        if (strlen($info['pwd']) < 8) return response()->json(['errors' => 'Password must be minimum 8 characters long']);

        unset($info['pwd']);

        foreach ($request_data['selections'] as $key => $selection) {
            if ($selection === '' || $selection === null) continue;
            if ($key === 6) {
                $selections['step_'.$key] = [];
                foreach ($selection as $sub_key => $sub_selection) {
                    $selections['step_'.$key][$sub_key] = self::ONBOARDING_DATA[$key][$sub_selection];
                }
                continue;
            }

            if (is_array($selection)) {
                $selections['step_'.$key] = [
                    'selection' => self::ONBOARDING_DATA[$key][$selection[0]],
                ];

                if (is_array($selection[1])) {
                    foreach ($selection[1] as $sub_key => $sub_selection) {
                        $selections['step_'.$key]['sub_selection'][$sub_key] = self::ONBOARDING_DATA[$key]['sub'][$selection[0]][$sub_selection];
                    }
                } else {
                    if (isset($selection[1])) $selections['step_'.$key]['sub_selection'] = self::ONBOARDING_DATA[$key]['sub'][$selection[1]];
                }

                continue;
            }

            $selections['step_'.$key] = self::ONBOARDING_DATA[$key][$selection];
        }

        $credentials = [
            'name' => $request_data['info']['name'],
            'email' => $request_data['info']['email'],
            'password' => bcrypt($request_data['info']['pwd']),
            'data' => [
                'info' => $info,
                'selections' => $selections,
                'source_id' => $request_data['source_id'],
            ]
        ];

        User::create($credentials);

        if (Auth::attempt(['email' => $request_data['info']['email'], 'password' => $request_data['info']['pwd']])) {
            request()->session()->regenerate();

            return response()->json('ok');
        }

        return response()->json($request_data);
    }
}
