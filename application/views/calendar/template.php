{table_open}
<table border="0" cellpadding="0" cellspacing="0" id="the-calendar">
{/table_open}

{heading_row_start}<tr style="background-color: transparent;">{/heading_row_start}

{heading_previous_cell}<td style="vertical-align: middle;text-align: center">
<a  style="display: block;"  href="{previous_url}">&lt;&lt;</a></td>{/heading_previous_cell}
{heading_title_cell}<td style="text-align: center" colspan="{colspan}"><h2>{heading}</h2></td>
{/heading_title_cell}
{heading_next_cell}<td style="vertical-align: middle;text-align: center">
    <a style="display: block;" href="{next_url}">&gt;&gt;</a></td>{/heading_next_cell}

{heading_row_end}</tr>{/heading_row_end}

{week_row_start}<tr>{/week_row_start}
{week_day_cell}
<th style="text-align: center;font-weight: bold;color:white;" >
    {week_day}
</th>
{/week_day_cell}
{week_row_end}</tr>{/week_row_end}

{cal_row_start}<tr>{/cal_row_start}
{cal_cell_start}<td>{/cal_cell_start}
{cal_cell_start_today}<td>{/cal_cell_start_today}
{cal_cell_start_other}<td class="other-month">{/cal_cell_start_other}

{cal_cell_content}
<div style=""  id="{cell_id}">
<a href="{content}">
    {day}
</a>
</div>    
{/cal_cell_content}

{cal_cell_content_today}
<div class="highlight content-today today-cell"   id="{cell_id}">
    <a href="{content}">
        {day}
    </a>
</div>
{/cal_cell_content_today}

{cal_cell_no_content}
<div style=""  id="{cell_id}">
{day}
</div>
{/cal_cell_no_content}
{cal_cell_no_content_today}
<div class="highlight no-content-today today-cell" style="" id="{cell_id}" >
    {day}
</div>
{/cal_cell_no_content_today}

{cal_cell_blank}&nbsp;{/cal_cell_blank}

{cal_cell_other}{day}{/cal_cel_other}

{cal_cell_end}</td>{/cal_cell_end}
{cal_cell_end_today}</td>{/cal_cell_end_today}
{cal_cell_end_other}</td>{/cal_cell_end_other}
{cal_row_end}</tr>{/cal_row_end}

{table_close}</table>{/table_close}