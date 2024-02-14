{{ dbt_utils.date_spine(
    datepart="hour",
    start_date="to_date('01/01/2018', 'mm/dd/yyyy')",
    end_date="dateadd(week, -1, current_date)"
)
}}