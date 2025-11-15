{% macro mac_find_claim_percentage(insurance_id, amount_paid, amount_billed) %}

    case
        when {{ insurance_id }} = 2
        then ({{ amount_paid }} / {{ amount_billed }}) * 100
        else ({{ amount_paid }} / {{ amount_billed }}) * 500
    end

{% endmacro %}
