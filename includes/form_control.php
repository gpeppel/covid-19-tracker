<?php

function generate_checkboxes($data)
{
    $checkbox_buttons = '';
    $counter = 0;
    $current = 0;
    foreach ($data as $group => $values) {
        $checkbox_buttons .= '<fieldset>';
        $checkbox_buttons .= "<legend>$group</legend>";
        $checkbox_buttons .= '<table id="dynamic-tbl">';

        foreach ($values as $value) {
            $check = $counter % 2;
            if ($check == 1 or $current == 0) {
                $checkbox_buttons .= '<tr>';
                $checkbox_buttons .= '<td>';
                $checkbox_buttons .= "<input type='checkbox' name='States[]' id='$value' value='$value'>";
                $checkbox_buttons .= "<label for='$value'>$value</label>";
                $checkbox_buttons .= '</td>';
                $counter++;
                $current++;
            }
            else if ($check == 0) {
                $checkbox_buttons .= '</tr>';
                $counter++;
            } 
            else {
                $checkbox_buttons .= '<td>';
                $checkbox_buttons .= "<input type='checkbox' name='States[]' id='$value' value='$value'>";
                $checkbox_buttons .= "<label for='$value'>$value</label>";
                $checkbox_buttons .= '</td>';
                $counter++;
            }
        }
        $checkbox_buttons .= '</table>';
        $checkbox_buttons .= '</fieldset>';
    }

    return $checkbox_buttons;
}

$state_checkbox_buttons = [
    'States' => [
        'Alabama',
        'Alaska',
        'Arizona',
        'Arkansas',
        'California',
        'Colorado',
        'Connecticut',
        'Delaware',
        'Florida',
        'Georgia',
        'Hawaii',
        'Idaho',
        'Illinois',
        'Indiana',
        'Iowa',
        'Kansas',
        'Kentucky',
        'Louisiana',
        'Maine',
        'Maryland',
        'Massachusetts',
        'Michigan',
        'Minnesota',
        'Mississippi',
        'Missouri',
        'Montana',
        'Nebraska',
        'Nevada',
        'New Hampshire',
        'New Jersey',
        'New Mexico',
        'New York',
        'North Carolina',
        'North Dakota',
        'Ohio',
        'Oklahoma',
        'Oregon',
        'Pennsylvania',
        'Rhode Island',
        'South Carolina',
        'South Dakota',
        'Tennessee',
        'Texas',
        'Utah',
        'Vermont',
        'Virginia',
        'Washington',
        'West Virginia',
        'Wisconsin',
        'Wyoming'
    ]
];
$checkbox_buttons = generate_checkboxes($state_checkbox_buttons);

echo $checkbox_buttons;
// echo "<xmp>$checkbox_buttons</xmp>";
